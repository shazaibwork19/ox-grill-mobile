# Mobile plan — Ox & Grill customer app

_Last updated: 2026-10-28. A new session should be able to continue from this file alone._

## Decisions in force

- **Source of truth:** live OpenAPI + `MOBILE_APP_SPEC.md` (they agree). The original build prompt's deals endpoint, SSE, image collections and customer accounts do not exist; see `docs/API_MAP.md` → "Where the prompt and the live API disagree". *Chosen by default; the owner has not confirmed.*
- **Project:** `C:\dev\ox_grill_mobile` (H: was nearly full and its path had spaces). Android ID `com.oxandgrill.app`. *Defaults; not confirmed.*
- **Server:** `https://api.32-236-141-77.sslip.io/api/v1` is treated as production. **No order or other mutation has been sent to it.** Checkout is tested against mocks only. Real checkout needs the owner's explicit approval each time.
- **Flutter** upgraded 3.35.4 → 3.47.8 (shared install at `C:\flutter`).

## Completed

- [x] M0 — environment, scaffold, theme (tokens, fonts bundled), config via `--dart-define`, dio client + error mapping, `flutter analyze` clean
- [x] M1 — branch selection (grouped by city, live status label, services, fees), order-type sheet, menu (hero, Chef's picks, pinned search + category chips with scroll-spy and tap-to-scroll, sections, sold-out muted cards), branch info (address, call, maps, hours)
- [x] M2 — item customizer (required groups first, rule labels, radio/checkbox with max enforced, quantity, notes, sticky "Add · Rs X" with disabled reason), cart per branch persisted in shared_preferences, merge identical lines, edit/remove, debounced `/menu/quote`, issues mapped to lines, delivery-minimum warning, server totals with "estimated" fallback, branch switch warns and moves/prunes cart
- [x] M3 — checkout (inline + server field errors, payment method from `/config` with per-method tax, server summary, double-tap safe, idempotency key persisted across restarts, unknown-outcome messaging), saved tracking tokens in secure storage, order status (server step labels, pending call-you notice, call branch/rider, Socket.IO + 20 s polling fallback, resume refetch), order list (auto-opens the single active order, forgets 404 tokens). Customer auth: not built (product is guest-only); staff token refresh layer built and tested.
- [x] M4 (partly) — empty/error/offline states, global offline banner, a11y labels on icon buttons/images/badges, 48 dp targets, reduced-motion support, tablet layout (2-column menu, side cart, two-pane detail/status), placeholder icon + splash, release APK

- [x] Staff app (`com.oxandgrill.staff`, 2026-10-28): sign-in + session, role-based navigation, owner/manager/cashier/kitchen/rider screens covering every staff and `/admin/*` operation in the OpenAPI document except live GPS sending (details and gaps in `docs/STAFF_APP.md`). Tested against schema-based mocks only.

## In progress

- Nothing running.

## Next task

1. Owner to confirm the decisions above (source of truth, folder, app ID, production vs test server).
2. Finish the on-device pass on a small phone profile (≤360 dp): only the Pixel 7 Pro (411 dp) emulator has been run. Check item detail, branch info and order list on device, plus the back gesture.
3. With approval: one real checkout on the test server; then confirm/cancel it from the website and watch the status screen update live (acceptance checklist items 4–7 in `MOBILE_APP_SPEC.md`).
4. Staff app against the test server: needs the staff passwords (owner supplies them; not committed) and approval, since every staff action changes data. Then run acceptance checklist item 8 (rider steps) and the manager/kitchen flow end to end with a real test order.
5. Release signing (two upload keys or one, plus Play App Signing) when the owner asks.

## Known issues

- **Emulator memory**: the default AVD needs 3 GB free; with Adobe apps open start it with `emulator -avd Pixel_7_Pro -memory 2048`.
- **Live order updates not seen end to end**: the Socket.IO handshake and `subscribe` ack were checked against the server with a fake token (`{"ok":false,"error":"Order not found"}`); status-change events need a real order (needs approval).
- On the checkout screen the sticky "Place order" bar sits behind the keyboard while typing (Scaffold default); it reappears when the keyboard closes.
- Release build is signed with the debug key.
- Data: Swiss Mushroom Burger option deltas look wrong (+Rs 950/990 on Rs 1,390). Branch hours are seeded placeholders per the backend plan.
- iOS not built (Windows).
- `oxgrill://app/track/{token}` deep link registered on Android but nothing generates such links yet.

## Test status

| Check | Result |
| --- | --- |
| `dart format` | clean |
| `flutter analyze` | 0 issues |
| `flutter test` | see the session report (customer + staff suites; screenshot suites opt-in) |
| Layout matrix | 7 screens × widths 320/360/375/390/412/430/768/1024 × text 1.0/1.3 — no overflow |
| Screenshots | `screenshots/*.png` (360, 430, tablet) — reviewed |
| On device / emulator | Release APK on Pixel 7 Pro emulator (API 36, 411 dp) against the live test server, read-only: branches, order type, menu with real images, tap-to-scroll chips, add to cart, live quote (Rs 1,148 pickup; Rs 2,447 delivery for 2× fries = spec example), delivery-minimum block, checkout form + keypad. |
| Release artifacts | `build/app/outputs/flutter-apk/app-release.apk` (54.8 MB), `build/app/outputs/bundle/release/app-release.aab` (53.3 MB); manifest checked: INTERNET, cleartext off, label, ID |
| Real checkout | **not run** (mocked) |
