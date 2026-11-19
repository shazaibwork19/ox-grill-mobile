import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/tokens.dart';

/// Primary button that keeps its width and shows a spinner while [loading].
class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.loadingLabel,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool loading;

  /// Announced to screen readers while loading.
  final String? loadingLabel;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final button = FilledButton(
      onPressed: loading ? () {} : onPressed,
      style: loading
          ? ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(c.ember600),
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            )
          : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // The label stays in the layout so the width never jumps.
          Opacity(
            opacity: loading ? 0 : 1,
            child: Text(label, textAlign: TextAlign.center),
          ),
          if (loading)
            SizedBox.square(
              dimension: 22,
              child: CircularProgressIndicator(strokeWidth: 2.5, color: c.cream50),
            ),
        ],
      ),
    );
    return Semantics(
      button: true,
      enabled: !loading && onPressed != null,
      label: loading ? (loadingLabel ?? 'Please wait') : null,
      excludeSemantics: loading,
      child: expand ? SizedBox(width: double.infinity, child: button) : button,
    );
  }
}

/// − n + stepper with 48×48 targets.
class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 1,
    this.max = 50,
    this.itemName,
    this.compact = false,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;

  /// Used in screen reader labels: "Decrease quantity of Beef Chilli Fries".
  final String? itemName;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final of = itemName == null ? '' : ' of $itemName';
    final removeAtMin = min == 0;
    return Container(
      decoration: BoxDecoration(
        color: c.creamSurface,
        borderRadius: BorderRadius.circular(Radii.pill),
        border: Border.all(color: c.borderStrong),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: value <= 1 && removeAtMin ? 'Remove$of' : 'Decrease quantity$of',
            onPressed: value > min ? () => onChanged(value - 1) : null,
            icon: Icon(
              value <= 1 && removeAtMin ? Icons.delete_outline_rounded : Icons.remove_rounded,
              size: 20,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: compact ? 20 : 32),
            child: Semantics(
              label: 'Quantity$of',
              value: '$value',
              child: ExcludeSemantics(
                child: Text(
                  '$value',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ),
          IconButton(
            tooltip: 'Increase quantity$of',
            onPressed: value < max ? () => onChanged(value + 1) : null,
            icon: const Icon(Icons.add_rounded, size: 20),
          ),
        ],
      ),
    );
  }
}

/// Small rounded label, e.g. "Sold out" or "Featured".
class Pill extends StatelessWidget {
  const Pill({super.key, required this.label, this.icon, this.color, this.filled = false});

  final String label;
  final IconData? icon;
  final Color? color;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final accent = color ?? c.bronze400;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Space.x2 + 2, vertical: Space.x1),
      decoration: BoxDecoration(
        color: filled ? c.ink950.withValues(alpha: 0.82) : accent.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(Radii.pill),
        border: Border.all(color: accent.withValues(alpha: 0.55)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 14, color: accent), const SizedBox(width: Space.x1)],
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: c.cream50),
            ),
          ),
        ],
      ),
    );
  }
}

/// Pinned bottom area for sticky actions; respects the home indicator.
class BottomActionBar extends StatelessWidget {
  const BottomActionBar({super.key, required this.child, this.above});

  final Widget child;

  /// Optional line above the button (e.g. why it is disabled).
  final Widget? above;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: c.ink900,
        border: Border(top: BorderSide(color: c.border)),
        boxShadow: [BoxShadow(color: c.shadow, blurRadius: 24, offset: const Offset(0, -6))],
      ),
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: Space.x2),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x3, Space.gutter, Space.x2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (above != null) ...[above!, const SizedBox(height: Space.x2)],
              child,
            ],
          ),
        ),
      ),
    );
  }
}
