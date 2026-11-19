# API map — Ox & Grill customer app

Checked against the live OpenAPI document (`GET https://api.32-236-141-77.sslip.io/openapi.json`, 108 paths / 128 operations, fetched 2026-10-28; copy in [`openapi.json`](openapi.json)) and `MOBILE_APP_SPEC.md` (2026-10-07). Where the two disagree the OpenAPI document wins (the spec says so itself). No mutating call was made against the server while writing this; `POST /menu/quote` was called once because it only prices a cart and saves nothing.

Base URL comes from `--dart-define=API_BASE_URL=…/api/v1`. Socket.IO uses the same origin without `/api/v1`.

## Conventions

| Topic | Rule (verified live) |
| --- | --- |
| Success | `{ "success": true, "data": … }`; lists may add `meta { page, pageSize, total, totalPages }` |
| Error | `{ "success": false, "error": { "code", "message", "details?": [{ path, message, code }] }, "requestId" }`. App branches on `error.code`; shows `message` for 4xx business errors; never for 5xx. |
| Money | Integer paisa (PKR × 100). App type: `Money` extension type over `int`. Display `Rs 2,447`, rounded half up. |
| Times | ISO-8601 UTC; shown in `Asia/Karachi` (UTC+5, no DST). |
| Phones | Send `03XXXXXXXXX` (spaces/dashes stripped); responses are `+92…`, shown as `0300 1234567`. |
| Validation `details[].path` | Live sample: `params.token`. Body fields are expected as `contactPhone`, `delivery.addressLine`, `items.0.quantity`; the app also strips a `body.` prefix if it appears. |

## Endpoints the customer app uses

All are **public** (no `Authorization` header). Customers order as guests.

| Screen | Method & path | Request | Response `data` | Errors handled |
| --- | --- | --- | --- | --- |
| Splash / resume | `GET /config` | — | `ClientConfig` (feature flags, `paymentMethodsByOrderType`) | network → retry panel |
| Branch list | `GET /branches` | `city?`, `service?` | `BranchSummary[]` (services, fees, `status.label`, `acceptingOrders`) | 400 |
| Branch info / checkout tax hint | `GET /branches/{idOrSlug}` | — | `BranchDetail` (+ `hours[]`, `paymentMethods`, `taxRateCashBps`, `taxRateCardBps`) | 404 |
| Menu | `GET /menu?branchId=` | `branchId` (always sent) | `MenuResponse { categories[], items[] }` | 400 |
| Item detail | `GET /menu/items/{idOrSlug}?branchId=` | — | `MenuItemDetail` (+ `optionGroups[]` with `minSelect`/`maxSelect`, `related[]`) | 404 |
| Cart totals | `POST /menu/quote` | `{ branchId, orderType, paymentMethod?, items: CartItemInput[] }` | `Quote { lines, totals, issues[{index, code, message}], meetsMinimum, minDeliveryOrder, allowedPaymentMethods }` | 400 |
| Place order | `POST /orders` + header `Idempotency-Key` | `CreateOrder` (see below) | **201** `CreateOrderResult { order, trackingToken, paymentAction, changeDue }`; header `Idempotent-Replayed: true` on replay | 400, 403 (blocked number), 409 `IDEMPOTENCY_IN_PROGRESS`, 422 `ITEM_UNAVAILABLE`/`BRANCH_CLOSED`/`BRANCH_UNAVAILABLE`/`PAYMENT_METHOD_NOT_ALLOWED`/`IDEMPOTENCY_KEY_REUSED`/minimum |
| Order status | `GET /orders/track/{token}` | token ≥ 20 chars | `PublicOrderStatus { order, tracking }`; `tracking.steps[]` = `{ status, label, reachedAt, state: done/current/upcoming }` | 404 → token forgotten; 400 for malformed token |

`CreateOrder` as sent by the app (no prices, ever):

```json
{
  "branchId": "…", "orderType": "DELIVERY", "paymentMethod": "CASH_ON_DELIVERY",
  "items": [{ "menuItemId": "…", "quantity": 2, "optionIds": ["…"], "notes": "…" }],
  "contactName": "…", "contactPhone": "03001234567",
  "delivery": { "addressLine": "…", "area": "…", "city": "…", "instructions": "…" },
  "pickupName": "…  (PICKUP only)", "tableRef": "… (DINE_IN only)",
  "notes": "…", "source": "MOBILE"
}
```

## Authentication

The customer product does **not** use accounts (spec §1.1, §3.5: "Do not send an Authorization header for customers"). The API does have customer OTP login (`/auth/otp/request`, `/auth/otp/verify`) and email/password login, but building customer sign-in would contradict the product decision, so it is not built.

For a future staff area the client side is ready (`lib/core/network/auth/`):

- `POST /auth/login { email, password, deviceName }` → `AuthResult { user, tokens }`.
- Access token ≈ 15 min (`accessTokenExpiresAt`); refresh token rotates on every `POST /auth/refresh { refreshToken }`. Reusing an old refresh token revokes the whole session family.
- `AuthInterceptor` adds `Bearer`, and on `401 TOKEN_EXPIRED` calls a single-flight `TokenRefresher` (concurrent requests wait for the same refresh), stores the new pair in Keychain/Keystore, retries once. Refresh failure clears tokens and signals sign-out.
- Socket.IO for staff passes `auth: { token }`.

## Idempotent checkout

- Header: **`Idempotency-Key`** (required on `POST /orders`).
- One UUID v4 per checkout attempt, stored **before** the request is sent together with a fingerprint of the canonical request body. Same body → same key (retries after timeout, offline, or app restart). Different body → new key. Cleared after HTTP 201.
- Network error / timeout / 5xx → "outcome unknown": cart kept, retry is safe. `409 IDEMPOTENCY_IN_PROGRESS` → wait 2/4/6 s and ask again with the same key. 4xx → definite failure.
- Double-tap: the controller ignores submits while one is in flight; the button shows a spinner without changing width.

## Live order tracking

**Socket.IO v4**, not SSE (the API has no SSE endpoint).

- Connect to the API origin, path `/socket.io`, transports websocket → polling.
- After every connect: `emit('subscribe', { type: 'orderTracking', token }, ack)`; ack `{ ok, room?, error? }`.
- Events: `order:statusChanged`, `order:paymentUpdated`, `delivery:locationUpdate`. The app refetches `GET /orders/track/{token}` on any event and after every (re)subscribe, because missed events are not replayed.
- Reconnect: library backoff 1 s → 15 s with 50 % jitter. While not subscribed, the app polls every 20 s (spec §3.6). On app resume it refetches. Everything stops once the order is `COMPLETED`, `CANCELLED` or `REJECTED`.

## Where the prompt and the live API disagree

| Prompt said | Live API | What the app does |
| --- | --- | --- |
| `GET /branches/:id/deals`, deal customizer | **404 "No route"**; no deal schema in OpenAPI | No deals UI. |
| SSE tracking | Socket.IO | Socket.IO + 20 s polling fallback. |
| Up to 3 images per item, `thumbnailUrl` | Single `imageUrl` only | Gallery takes a list; shows one image today. |
| Customer login / registration / order history | Guest-only by product decision | Saved tracking tokens on the device ("Order status"). |
| Campaign / hero banners | No endpoint | Typographic hero + "Chef's picks" from `isFeatured`. |
| "Cash or card" for every type | Delivery: `CASH_ON_DELIVERY` only. Pickup/dine-in: `CASH`, `CARD_AT_COUNTER`. `onlinePayments` off. | Methods read from `/config`, never hard-coded. |
| Don't show branch hours | `GET /branches/{id}` returns `hours[]` (IMPLEMENTATION_PLAN says they are placeholders) | Shown on Branch info with "Hours can change" note. **Confirm with client.** |

## Gaps (things the app would need that the API does not provide)

1. **Guest order cancel** — no guest cancel endpoint; the app says "To cancel, call the branch."
2. **Push notifications** — no device-token registration endpoint. Customers only get live updates while the status screen is open (plus the branch's SMS, if enabled server-side).
3. **Deals / bundles** — no endpoint.
4. **Banners / campaigns** — no endpoint.
5. **Multiple item images** — single `imageUrl`.
6. **Unavailable reason** — items only have `isAvailable`; no reason text ("Sold out" is shown).
7. **Universal links for tracking** — no `assetlinks.json` / domain decided. The app registers `oxgrill://app/track/{token}` only.
8. **Branch change re-quote is client-orchestrated** — fine, but there is no "move cart" endpoint (not needed).
9. **Account deletion** — not needed while there are no customer accounts. If customer login is ever enabled, Google Play requires an in-app deletion path and the API has none.
10. **Data quality (report to client)** — "Swiss Mushroom Burger" option deltas are +Rs 950 / +Rs 990 on a Rs 1,390 base (Rs 2,340 total) — looks like full prices entered as deltas. Already listed in IMPLEMENTATION_PLAN "open items".
11. **`support.phone` / `support.email` are null** in `/config`; the app uses the branch phone instead.

## Fixtures

Live responses saved 2026-10-28 in `test/fixtures/`: `config`, `branches`, `branch_detail`, `menu`, four `item_*`, `quote_delivery_cod`, `error_validation`, `error_not_found`, `health`. Files prefixed `mock_` (`mock_create_order`, `mock_track_pending`) are **hand-written from the schema**; no order was placed to obtain them.
