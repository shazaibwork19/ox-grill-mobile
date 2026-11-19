# Machine setup (Windows 11) — what was done

Date: 2026-10-28.

| Item | State |
| --- | --- |
| Git | 2.51.0 (already installed) |
| Flutter SDK | Already installed at `C:\flutter` (on User PATH). Upgraded from 3.35.4 to **3.47.8 stable** (Dart 3.13.7, DevTools 2.60.0), because current `freezed`/`json_serializable` need a newer Dart than 3.35.4 shipped. `flutter downgrade` reverts it. |
| Analytics | `flutter config --no-analytics` |
| Android Studio | 2025.1.3, bundled JDK 21 detected automatically |
| Android SDK | `%LOCALAPPDATA%\Android\Sdk`: platform 36, build-tools 36.1, command-line tools (latest), emulator 36.1.9 |
| Android licenses | Accepted by the owner (`flutter doctor --android-licenses`) |
| Developer Mode | Turned on (registry `AllowDevelopmentWithoutDevLicense=1`, via UAC prompt); unprivileged symlinks verified |
| VS Code | 1.143.1 with `Dart-Code.dart-code` + `Dart-Code.flutter` |
| Emulators | `Pixel_7_Pro`, `Medium_Phone_API_36.1`; AEHD acceleration usable |
| Visual Studio (Windows desktop) | Not installed — not needed (no Windows desktop build) |
| iOS | Not possible on Windows. Building/signing for iOS needs a Mac with Xcode. |

`flutter --version`:

```
Flutter 3.47.8 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 737ba8f885 (5 days ago) • 2026-10-22 21:37:31 -0700
Engine • hash dfd2e6cb7d319db05e3bf1503f3e2ac60f6288a2 (revision cf636b1dfb) • 2026-10-23
Tools • Dart 3.13.7 • DevTools 2.60.0
```

`flutter doctor`: Flutter ✓, Windows ✓, Android toolchain ✓, Chrome ✓, Android Studio ✓, VS Code ✓, Connected device ✓ (no Android device attached yet), Network ✓, Visual Studio ✗ (expected).

## Problems met

1. **Emulator would not start**: "Insufficient RAM free … Needed 3072 MB, Remaining 1862 MB". Photoshop, Premiere Pro and After Effects together held ~20 GB of commit charge. Close them (or lower the AVD RAM in Device Manager → Edit → Advanced → RAM 2048 MB), or use a physical phone with USB debugging.
2. **Project folder**: the original folder `H:\Ox n grills mobile app` has spaces and H: had 3.4 GB free, too little for Gradle/Android builds. The project lives at **`C:\dev\ox_grill_mobile`**.
3. **Dependency resolution on 3.35.4**: `freezed`/`json_serializable` fell back to pre-null-safety versions. Fixed by upgrading Flutter (above).
4. **Restart VS Code** once so new terminals pick up PATH changes (none were needed this time; `C:\flutter\bin` was already on the User PATH).
