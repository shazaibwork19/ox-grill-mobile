import 'package:flutter/material.dart';

import '../errors/app_failure.dart';
import '../theme/app_colors.dart';
import '../theme/tokens.dart';

/// Full-area message used for error, offline and empty states. Always says
/// what happened and what to do next.
class MessagePanel extends StatelessWidget {
  const MessagePanel({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.note,
    this.actionLabel,
    this.onAction,
    this.secondaryLabel,
    this.onSecondary,
    this.tone = PanelTone.neutral,
  });

  /// Builds the panel for a failure, with a retry action.
  factory MessagePanel.failure(
    Object error, {
    Key? key,
    String title = 'Couldn’t load this',
    String? note,
    VoidCallback? onRetry,
  }) {
    final failure = AppFailure.from(error);
    final offline = failure is NetworkFailure;
    return MessagePanel(
      key: key,
      icon: offline ? Icons.wifi_off_rounded : Icons.error_outline_rounded,
      title: offline ? 'No connection' : title,
      message: offline
          ? '${failure.userMessage} Check your internet connection and try again.'
          : failure.userMessage,
      note:
          note ??
          (failure is ApiFailure && failure.requestId != null ? 'Reference: ${failure.requestId}' : null),
      actionLabel: onRetry == null ? null : 'Try again',
      onAction: onRetry,
      tone: offline ? PanelTone.neutral : PanelTone.danger,
    );
  }

  final IconData icon;
  final String title;
  final String message;
  final String? note;
  final String? actionLabel;
  final VoidCallback? onAction;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;
  final PanelTone tone;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    final accent = switch (tone) {
      PanelTone.neutral => c.bronze400,
      PanelTone.danger => c.danger500,
      PanelTone.warning => c.amber500,
    };
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(Space.x6),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(color: accent.withValues(alpha: 0.14), shape: BoxShape.circle),
                child: Icon(icon, color: accent, size: 30),
              ),
              const SizedBox(height: Space.x4),
              Text(title, style: t.titleMedium, textAlign: TextAlign.center),
              const SizedBox(height: Space.x2),
              Text(message, style: t.bodyMedium, textAlign: TextAlign.center),
              if (note != null) ...[
                const SizedBox(height: Space.x2),
                Text(note!, style: t.bodySmall, textAlign: TextAlign.center),
              ],
              if (actionLabel != null) ...[
                const SizedBox(height: Space.x6),
                FilledButton(onPressed: onAction, child: Text(actionLabel!)),
              ],
              if (secondaryLabel != null) ...[
                const SizedBox(height: Space.x2),
                OutlinedButton(onPressed: onSecondary, child: Text(secondaryLabel!)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

enum PanelTone { neutral, danger, warning }

/// Inline notice inside a page (warnings, "estimated" notes, errors with retry).
class InlineNotice extends StatelessWidget {
  const InlineNotice({
    super.key,
    required this.message,
    this.icon = Icons.info_outline_rounded,
    this.tone = PanelTone.neutral,
    this.actionLabel,
    this.onAction,
  });

  final String message;
  final IconData icon;
  final PanelTone tone;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final accent = switch (tone) {
      PanelTone.neutral => c.bronze400,
      PanelTone.danger => c.danger500,
      PanelTone.warning => c.amber500,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Space.x3, vertical: Space.x3),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.10),
        borderRadius: Radii.controlAll,
        border: Border.all(color: accent.withValues(alpha: 0.35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(icon, color: accent, size: 20),
          ),
          const SizedBox(width: Space.x3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: c.cream50)),
                if (actionLabel != null)
                  Padding(
                    padding: const EdgeInsets.only(top: Space.x1),
                    child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero, alignment: Alignment.centerLeft),
                      onPressed: onAction,
                      child: Text(
                        actionLabel!,
                        style: TextStyle(color: c.cream50, decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
