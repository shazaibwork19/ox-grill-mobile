# Ox & Grill — mobile apps (Flutter)

Two Android apps from one codebase:

- **Ox & Grill** (`com.oxandgrill.app`, flavor `customer`, `lib/main.dart`): guest ordering. Choose a branch and order type, browse the branch's menu, customise dishes, see server-priced totals, check out without an account, follow the order live.
- **Ox & Grill Staff** (`com.oxandgrill.staff`, flavor `staff`, `lib/main_staff.dart`): sign-in for the owner, branch managers, cashiers, kitchen and riders, each seeing their own screens. See [`docs/STAFF_APP.md`](docs/STAFF_APP.md).

- API contract: [`docs/API_MAP.md`](docs/API_MAP.md) (plus `docs/openapi.json`, the live OpenAPI snapshot)
- Progress and next steps: [`docs/MOBILE_PLAN.md`](docs/MOBILE_PLAN.md)
- Machine setup notes: [`docs/SETUP.md`](docs/SETUP.md)

## Requirements

Flutter 3.47+ (Dart 3.13+), Android SDK 36, JDK 21 (Android Studio's bundled one). iOS builds need a Mac and are not set up from Windows.

## Run

The API address is a build-time value. There is no URL in the source.

```powershell
flutter pub get
# Customer app (the default flavor)
flutter run --dart-define=API_BASE_URL=https://api.32-236-141-77.sslip.io/api/v1 --dart-define=APP_ENV=test
# Staff app
flutter run --flavor staff -t lib/main_staff.dart --dart-define=API_BASE_URL=https://api.32-236-141-77.sslip.io/api/v1 --dart-define=APP_ENV=test
```

In VS Code, pick a configuration in **Run and Debug** (`.vscode/launch.json`): customer or staff app, test server or production (edit the placeholder URL first).

A build without `API_BASE_URL` starts on an "App not configured" screen.

> The test server's data can be reset at any time, and its host name will change when the restaurant moves to its own domain. Only `API_BASE_URL` needs to change.

## Test

```powershell
dart format lib test
flutter analyze
flutter test                      # unit, widget and layout tests (no network)
flutter test --tags screenshots --run-skipped --update-goldens   # writes screenshots/*.png for review
```

Tests never call the real API: they use the live responses saved in `test/fixtures/`. `mock_*.json` fixtures were written by hand from the OpenAPI schema.

After changing a freezed/json model run `dart run build_runner build`.

## Build

```powershell
$api = '--dart-define=API_BASE_URL=https://…/api/v1'
flutter build apk --release $api --dart-define=APP_ENV=production                                   # customer
flutter build appbundle --release $api --dart-define=APP_ENV=production
flutter build apk --release --flavor staff -t lib/main_staff.dart $api --dart-define=APP_ENV=production  # staff
flutter build appbundle --release --flavor staff -t lib/main_staff.dart $api --dart-define=APP_ENV=production
```

Outputs: `build/app/outputs/flutter-apk/app-customer-release.apk`, `app-staff-release.apk`, and `build/app/outputs/bundle/customerRelease/` / `staffRelease/` for the `.aab` files.

Cleartext HTTP is disabled in both apps; the API must be HTTPS. Each app is a separate Play Store listing (separate ID, icon, signing).

### Release signing (not set up yet)

Release builds are currently signed with the **debug key**, which Google Play rejects. To publish:

1. Create an upload key: `keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload`.
2. Store it outside the repo and add `android/key.properties` (git-ignored) with `storePassword`, `keyPassword`, `keyAlias`, `storeFile`.
3. Load it in `android/app/build.gradle.kts` as a `release` signing config.
4. Enrol in **Play App Signing** so Google holds the app signing key; you keep only the upload key.

## Structure

```
lib/
  app/                 app widget, router (go_router)
  core/                config, network (dio, error mapping, auth/refresh for a future staff area),
                       realtime (Socket.IO), money, theme, time, shared widgets
  features/
    bootstrap/         GET /config
    branches/          branch list, order session (branch + order type), branch info
    menu/              menu, sections/scroll-spy, item customizer
    cart/              per-branch cart, debounced server quote, cart sheet
    checkout/          form, idempotent submit
    orders/            saved tracking tokens, live status screen
  staff/               the staff app
    app/               staff app widget, router (session redirect), role-based shell
    core/              permissions (role table), session (login/refresh/logout), branch scope, socket
    data/              repositories: ops, people, front desk, reports, admin
    domain/            staff/admin/report models (freezed)
    features/          login, dashboard, orders (+ POS, receipt), kitchen, rider, menu availability,
                       front desk, people (staff, shifts), branch settings, reports, admin, account
```

Tree-shaking keeps staff code out of the customer APK and vice versa (separate entry points).

## Branding

Fonts (OFL): DM Serif Display and Manrope, bundled under `assets/fonts/` with their licences. The app icon and splash use a typographic "O&G" monogram until the restaurant supplies a vector logo. Replace `assets/images/app_icon*.png`, `staff_icon*.png` and `splash_logo.png`, then run `dart run flutter_launcher_icons` (uses `flutter_launcher_icons-customer.yaml` and `-staff.yaml`) and `dart run flutter_native_splash:create`.
