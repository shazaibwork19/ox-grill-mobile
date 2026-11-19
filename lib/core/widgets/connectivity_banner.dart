import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../theme/app_colors.dart';
import '../theme/tokens.dart';

/// App-wide "You're offline" strip shown above every screen.
class ConnectivityBanner extends ConsumerWidget {
  const ConnectivityBanner({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final online = ref.watch(isOnlineProvider).value ?? true;
    final c = context.colors;
    return Column(
      children: [
        AnimatedSize(
          duration: Motion.of(context, Motion.sheet),
          curve: Curves.easeOutCubic,
          child: online
              ? const SizedBox(width: double.infinity)
              : Material(
                  color: c.amber500,
                  child: SafeArea(
                    bottom: false,
                    child: Semantics(
                      liveRegion: true,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Space.gutter, vertical: Space.x2),
                        child: Row(
                          children: [
                            Icon(Icons.wifi_off_rounded, size: 18, color: c.ink950),
                            const SizedBox(width: Space.x2),
                            Expanded(
                              child: Text(
                                'You’re offline. Your cart is saved; menus and prices may be out of date.',
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: c.ink950),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
        Expanded(
          child: online
              ? child
              // The banner already covers the status bar area.
              : MediaQuery.removePadding(context: context, removeTop: true, child: child),
        ),
      ],
    );
  }
}
