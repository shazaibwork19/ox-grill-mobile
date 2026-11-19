# Ox & Grill Staff app

A second Android app built from the same codebase as the customer app (`--flavor staff -t lib/main_staff.dart`).

| | Customer app | Staff app |
| --- | --- | --- |
| Android ID | `com.oxandgrill.app` | `com.oxandgrill.staff` |
| Name on the phone | Ox & Grill | Ox & Grill Staff |
| Entry point | `lib/main.dart` | `lib/main_staff.dart` |
| Code | `lib/features/` | `lib/staff/` |
| Sign-in | none (guest) | email + password |

Shared: theme, fonts, network client and error mapping, money, models (`Order`, menu, branch), Socket.IO, the option-selection rules and the idempotency keys.

## Sign-in and session

1. `POST /auth/login { email, password, deviceName }` → `{ user, tokens }`.
2. The role comes from the reply: `globalRole: SUPER_ADMIN` → **owner**; `STAFF` with an **active** `staffProfile` → manager, cashier, kitchen or rider. Customer accounts and suspended/inactive staff are refused and the session they just got is revoked (`POST /auth/logout`).
3. Tokens are kept in the Android Keystore (`flutter_secure_storage`). Every call sends `Authorization: Bearer`. On `401 TOKEN_EXPIRED` one shared refresh runs (`POST /auth/refresh`, rotating refresh token) and the request is retried once. A rejected refresh signs the person out and the sign-in screen says "Your session ended". Being offline during a refresh does **not** sign anyone out.
4. On app start with saved tokens: `GET /auth/me`. Offline at start: the last profile is used until the network returns.
5. Sign out: `POST /auth/logout { refreshToken }`.
6. There is no self-registration or "forgot password": managers create cashiers/kitchen/riders; only the owner creates managers and other owner logins; passwords are reset by them.

Realtime: Socket.IO with `auth: { token }` (token re-read on every reconnect; `TOKEN_EXPIRED` → refresh → reconnect). Staff join their branch rooms automatically. Every list also refreshes on a timer (15–60 s), on app resume and after reconnect, because missed events are not replayed. New orders / kitchen tickets / deliveries raise an alert (sound, vibration, banner).

## What each role sees

The role table in `lib/staff/core/permissions.dart` mirrors the `x-roles` / `x-staff-roles` of every endpoint in the OpenAPI document; `test/staff/permissions_test.dart` fails if the app would ever show a role an action the server forbids.

| Screen | Owner | Manager | Cashier | Kitchen | Rider |
| --- | :-: | :-: | :-: | :-: | :-: |
| Today (dashboard KPIs, top items, payments, recent orders, activity) | all branches or one | ✓ | ✓ | | |
| Orders: live board, to-confirm, history, search, filter by type | all branches or one | ✓ | ✓ | | |
| Order: confirm / reject / cancel (with reason) / any allowed status, call customer, map, assign rider, record payment (with change), receipt | ✓ | ✓ | ✓ | | |
| Refund (full or partial) | ✓ | ✓ | | | |
| New counter / phone order (POS) with live server pricing, paid-now and change | ✓ | ✓ | ✓ | | |
| Kitchen board: start preparing → mark prepared, late tickets highlighted | (server: staff only) | ✓ | | ✓ | |
| My deliveries: accept → picked up (only when ready) → customer received (cash) → completed, call, navigate | | | | | ✓ |
| On/off duty | | ✓ | ✓ | ✓ | ✓ |
| Menu availability: sold-out switch, branch price, stock | ✓ | ✓ | ✓ | | |
| Front desk: reservations (by day, phone booking, confirm/seat/no-show/cancel), waitlist (walk-in, notify next, seat, remove) — shown only when the feature flags are on | ✓ | ✓ | ✓ | | |
| Shift: open with float, close with counted cash and variance, history | ✓ | ✓ | own | | |
| Staff at the branch: add, edit role/status/phone, reset password | | ✓ (not managers) | | | |
| Branch settings: pause online orders, services, delivery fee/minimum, times | ✓ | ✓ | | | |
| Reports: overview vs previous period, sales by day, top items, payment methods, statuses, types, hourly, branch comparison, CSV export (share) | ✓ | own branch | | | |
| Forecasts (feature `forecasting`) | ✓ + rebuild now | ✓ | | | |
| Admin: branches (create, edit, deactivate, weekly hours), categories, menu items (base price, options, photo upload, archive), all staff (incl. managers, move branch), owner logins, customers (block/unblock), settings & feature flags, audit log | ✓ | | | | |
| Account: name, password, reload profile, sign out | ✓ | ✓ | ✓ | ✓ | ✓ |

The owner picks a branch from the header on branch screens ("All branches" where the API supports it).

## Not built (and why)

| Item | Reason |
| --- | --- |
| Live rider GPS (`PATCH /delivery/assignments/{id}/location`) | Feature `deliveryGps` is off and the sign-off says "only if separately approved". Needs location permission (incl. background) and a location package. |
| Receipt printing | Needs a printer integration (Bluetooth/ESC-POS) the API doesn't cover. The receipt screen shows the data. |
| WhatsApp simulator, AI assistant | Feature flags off; developer tools, not staff screens. |
| Password reset by email / OTP for staff | No such endpoint. |
| Owner view of the kitchen board | Kitchen endpoints are `STAFF` only in the API. |
| Owner-wide realtime | The socket rooms for `SUPER_ADMIN` are not documented; owner screens refresh on a timer instead. |

## Verification status

- Unit tests: role mapping, permission table vs OpenAPI, session (login, customer refused, restore, offline start, rejected session, logout, expiry), token refresh queueing, rider step logic, POS body (no prices), rupee parsing, socket events, model parsing.
- Layout: every screen for every role at 320 / 360 / 430 / 1024 px and text 1.0× / 1.3× (mock data), sign-in flow.
- Device: release APK installed on the Pixel 7 Pro emulator; opens on the sign-in screen.
- **Not done:** no sign-in or any staff call against the live server (needs the staff passwords and your approval: every staff action changes real data). All staff screens were tested against mock data written from the OpenAPI schemas.
