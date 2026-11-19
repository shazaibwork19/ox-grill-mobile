import 'package:flutter/material.dart';

import '../domain/enums.dart';
import '../theme/app_colors.dart';
import '../theme/tokens.dart';

enum BadgeTone { success, warning, danger, info, neutral }

/// Colour + icon + text, never colour alone. The text comes from the server
/// where the server provides one (order step labels, branch status labels).
class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.label,
    required this.tone,
    required this.icon,
    this.semanticPrefix,
  });

  /// For an order: tone and icon from the status, text from the server label.
  factory StatusBadge.order(OrderStatus status, String label, {Key? key}) {
    final (tone, icon) = switch (status) {
      OrderStatus.pending => (BadgeTone.warning, Icons.hourglass_top_rounded),
      OrderStatus.confirmed => (BadgeTone.info, Icons.check_circle_outline_rounded),
      OrderStatus.preparing => (BadgeTone.warning, Icons.local_fire_department_rounded),
      OrderStatus.ready => (BadgeTone.success, Icons.room_service_rounded),
      OrderStatus.outForDelivery => (BadgeTone.info, Icons.delivery_dining_rounded),
      OrderStatus.delivered => (BadgeTone.success, Icons.home_rounded),
      OrderStatus.completed => (BadgeTone.success, Icons.task_alt_rounded),
      OrderStatus.rejected || OrderStatus.cancelled => (BadgeTone.danger, Icons.cancel_outlined),
      OrderStatus.unknown => (BadgeTone.neutral, Icons.help_outline_rounded),
    };
    return StatusBadge(key: key, label: label, tone: tone, icon: icon, semanticPrefix: 'Order status');
  }

  /// Branch open/closed, text from `status.label`.
  factory StatusBadge.branch({
    required bool acceptingOrders,
    required bool isOpen,
    required String label,
    Key? key,
  }) {
    final (tone, icon) = acceptingOrders
        ? (BadgeTone.success, Icons.schedule_rounded)
        : isOpen
        ? (BadgeTone.warning, Icons.pause_circle_outline_rounded)
        : (BadgeTone.danger, Icons.do_not_disturb_on_outlined);
    return StatusBadge(key: key, label: label, tone: tone, icon: icon, semanticPrefix: 'Branch');
  }

  final String label;
  final BadgeTone tone;
  final IconData icon;
  final String? semanticPrefix;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final accent = switch (tone) {
      BadgeTone.success => c.sage500,
      BadgeTone.warning => c.amber500,
      BadgeTone.danger => c.danger500,
      BadgeTone.info => c.bronze400,
      BadgeTone.neutral => c.cream200,
    };
    return Semantics(
      label: semanticPrefix == null ? label : '$semanticPrefix: $label',
      child: ExcludeSemantics(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Space.x2 + 2, vertical: Space.x1 + 1),
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.16),
            borderRadius: BorderRadius.circular(Radii.pill),
            border: Border.all(color: accent.withValues(alpha: 0.5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: accent),
              const SizedBox(width: Space.x1 + 2),
              Flexible(
                child: Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(color: c.cream50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
