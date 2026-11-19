import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/config/app_config.dart';
import 'core/providers.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/panels.dart';
import 'staff/app/staff_app.dart';

/// Entry point of the **staff** app (managers, cashiers, kitchen, riders, owner).
///
///   flutter run --flavor staff -t lib/main_staff.dart --dart-define=API_BASE_URL=https://…/api/v1
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Kitchen and counter tablets may rotate; phones too (riders use landscape mounts).
  await SystemChrome.setPreferredOrientations([]);

  const config = AppConfig.fromEnvironment;
  if (!config.isConfigured) {
    runApp(
      MaterialApp(
        theme: AppTheme.dark(),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: MessagePanel(
            icon: Icons.settings_rounded,
            title: 'App not configured',
            message:
                'This build has no API address. Rebuild with --dart-define=API_BASE_URL=https://…/api/v1.',
          ),
        ),
      ),
    );
    return;
  }

  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(overrides: [sharedPreferencesProvider.overrideWithValue(prefs)], child: const StaffApp()),
  );
}
