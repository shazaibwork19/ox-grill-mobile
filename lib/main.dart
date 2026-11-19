import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'core/config/app_config.dart';
import 'core/providers.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/panels.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _lockPhonesToPortrait();

  const config = AppConfig.fromEnvironment;
  if (!config.isConfigured) {
    runApp(const _MissingConfigApp());
    return;
  }

  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(overrides: [sharedPreferencesProvider.overrideWithValue(prefs)], child: const OxGrillApp()),
  );
}

/// Phones stay portrait; tablets (shortest side ≥ 600 dp) may rotate.
Future<void> _lockPhonesToPortrait() {
  final views = PlatformDispatcher.instance.views;
  if (views.isEmpty) return Future.value();
  final view = views.first;
  final shortest = view.physicalSize.shortestSide / view.devicePixelRatio;
  if (shortest >= 600) return SystemChrome.setPreferredOrientations([]);
  return SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

/// Shown when the build was made without `--dart-define=API_BASE_URL=…`.
class _MissingConfigApp extends StatelessWidget {
  const _MissingConfigApp();

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: AppTheme.dark(),
    debugShowCheckedModeBanner: false,
    home: const Scaffold(
      body: MessagePanel(
        icon: Icons.settings_rounded,
        title: 'App not configured',
        message: 'This build has no API address. Rebuild with --dart-define=API_BASE_URL=https://…/api/v1.',
      ),
    ),
  );
}
