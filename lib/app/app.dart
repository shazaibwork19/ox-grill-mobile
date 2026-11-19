import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/theme/app_theme.dart';
import '../core/widgets/connectivity_banner.dart';
import '../features/bootstrap/data/config_repository.dart';
import '../features/branches/data/branch_repository.dart';
import 'router.dart';

class OxGrillApp extends ConsumerWidget {
  const OxGrillApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Ox & Grill',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      routerConfig: ref.watch(routerProvider),
      builder: (context, child) => MediaQuery.withClampedTextScaling(
        // Layouts are verified up to 1.3×; beyond 1.6× they would break.
        maxScaleFactor: 1.6,
        child: _ForegroundRefresher(child: ConnectivityBanner(child: child ?? const SizedBox.shrink())),
      ),
    );
  }
}

/// Reloads `/config` and branch status when the app returns to the foreground,
/// so feature flags and open/closed labels are current.
class _ForegroundRefresher extends ConsumerStatefulWidget {
  const _ForegroundRefresher({required this.child});

  final Widget child;

  @override
  ConsumerState<_ForegroundRefresher> createState() => _ForegroundRefresherState();
}

class _ForegroundRefresherState extends ConsumerState<_ForegroundRefresher> {
  late final AppLifecycleListener _listener;
  DateTime _lastRefresh = DateTime.now();

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(onResume: _onResume);
  }

  void _onResume() {
    if (DateTime.now().difference(_lastRefresh) < const Duration(seconds: 30)) return;
    _lastRefresh = DateTime.now();
    ref.invalidate(clientConfigProvider);
    ref.invalidate(branchesProvider);
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
