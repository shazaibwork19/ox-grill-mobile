import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/domain/enums.dart';
import '../../core/errors/app_failure.dart';
import '../../core/money/money.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/tokens.dart';
import '../../core/time/local_time.dart';
import '../../core/widgets/panels.dart';
import '../../core/widgets/skeleton.dart';
import '../../core/widgets/status_badge.dart';
import '../core/branch_scope.dart';
import '../core/session.dart';
import '../core/staff_socket.dart';

// ---- Async ------------------------------------------------------------------

/// Loading skeleton / error panel with retry / data, for any provider value.
class AsyncBody<T> extends StatelessWidget {
  const AsyncBody({
    super.key,
    required this.value,
    required this.data,
    required this.onRetry,
    this.errorTitle = 'Couldn’t load this',
    this.skeletonRows = 6,
    this.inList = false,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final VoidCallback onRetry;
  final String errorTitle;
  final int skeletonRows;

  /// Set when placed inside another scrollable: panels get a fixed height.
  final bool inList;

  @override
  Widget build(BuildContext context) {
    // Keep showing data while a refresh runs; show the error only without data.
    if (value.hasValue) return data(value.requireValue);
    final panel = _panel();
    return inList && panel is! ListSkeleton ? SizedBox(height: 320, child: panel) : panel;
  }

  Widget _panel() {
    if (value.hasError) {
      final f = AppFailure.from(value.error!);
      if (f is ApiFailure && f.code == 'FEATURE_DISABLED') {
        return const MessagePanel(
          icon: Icons.toggle_off_outlined,
          title: 'Switched off',
          message: 'This module is turned off for the restaurant. The owner can enable it in Settings.',
        );
      }
      if (f is ApiFailure && (f.code == 'FORBIDDEN' || f.code == 'BRANCH_ACCESS_DENIED')) {
        return MessagePanel(
          icon: Icons.lock_outline_rounded,
          title: 'Not available for your role',
          message: f.userMessage,
        );
      }
      return MessagePanel.failure(value.error!, title: errorTitle, onRetry: onRetry);
    }
    return ListSkeleton(rows: skeletonRows);
  }
}

class ListSkeleton extends StatelessWidget {
  const ListSkeleton({super.key, this.rows = 6});

  final int rows;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return SkeletonPulse(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(Space.gutter),
        itemCount: rows,
        separatorBuilder: (_, _) => const SizedBox(height: Space.x3),
        itemBuilder: (_, _) => Container(
          padding: const EdgeInsets.all(Space.x4),
          decoration: BoxDecoration(
            borderRadius: Radii.cardAll,
            border: Border.all(color: context.colors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonLine(widthFactor: 0.5, style: t.titleSmall),
              const SizedBox(height: Space.x1),
              SkeletonLine(widthFactor: 0.8, style: t.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

/// Refetches [onRefresh] every [every], when the app returns to the
/// foreground, and on matching realtime events (fallback when sockets drop).
class AutoRefresh extends ConsumerStatefulWidget {
  const AutoRefresh({
    super.key,
    required this.onRefresh,
    required this.child,
    this.every = const Duration(seconds: 30),
    this.events = const {},
    this.onEvent,
  });

  final VoidCallback onRefresh;
  final Widget child;
  final Duration every;

  /// Socket event names that should trigger a refresh. `reconnected` is always included.
  final Set<String> events;
  final void Function(String event, Map<String, dynamic> payload)? onEvent;

  @override
  ConsumerState<AutoRefresh> createState() => _AutoRefreshState();
}

class _AutoRefreshState extends ConsumerState<AutoRefresh> {
  Timer? _timer;
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.every, (_) => widget.onRefresh());
    _lifecycle = AppLifecycleListener(onResume: widget.onRefresh);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _lifecycle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(staffEventsProvider, (_, next) {
      final e = next.value;
      if (e == null) return;
      if (e.name == 'reconnected' || widget.events.contains(e.name)) {
        widget.onEvent?.call(e.name, e.payload);
        widget.onRefresh();
      }
    });
    return widget.child;
  }
}

// ---- Actions ---------------------------------------------------------------

/// Runs [action], then shows [success] or the failure's message. Returns
/// whether it succeeded. The UI never shows raw exceptions.
Future<bool> runAction(BuildContext context, Future<void> Function() action, {String? success}) async {
  final messenger = ScaffoldMessenger.of(context);
  try {
    await action();
    if (success != null) {
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(success)));
    }
    return true;
  } catch (e) {
    final f = AppFailure.from(e);
    final detail = f is ApiFailure && f.details.isNotEmpty
        ? '\n${f.details.map((d) => d.message).join('\n')}'
        : '';
    final conflict = f is ApiFailure && f.statusCode == 409
        ? ' Someone may have changed it first — refreshed.'
        : '';
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('${f.userMessage}$conflict$detail'), duration: const Duration(seconds: 5)),
      );
    return false;
  }
}

Future<bool> confirm(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmLabel,
  bool destructive = false,
}) async {
  final c = context.colors;
  final ok = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
        FilledButton(
          style: destructive ? FilledButton.styleFrom(backgroundColor: c.danger500) : null,
          onPressed: () => Navigator.pop(context, true),
          child: Text(confirmLabel),
        ),
      ],
    ),
  );
  return ok ?? false;
}

/// Asks for a short text (e.g. a rejection reason). Returns null if cancelled.
Future<String?> promptText(
  BuildContext context, {
  required String title,
  required String label,
  String? hint,
  String? message,
  int minLength = 0,
  int maxLength = 300,
  String confirmLabel = 'Save',
  bool destructive = false,
  String initial = '',
}) {
  return showDialog<String>(
    context: context,
    builder: (context) => _PromptDialog(
      title: title,
      label: label,
      hint: hint,
      message: message,
      minLength: minLength,
      maxLength: maxLength,
      confirmLabel: confirmLabel,
      destructive: destructive,
      initial: initial,
    ),
  );
}

class _PromptDialog extends StatefulWidget {
  const _PromptDialog({
    required this.title,
    required this.label,
    required this.hint,
    required this.message,
    required this.minLength,
    required this.maxLength,
    required this.confirmLabel,
    required this.destructive,
    required this.initial,
  });

  final String title;
  final String label;
  final String? hint;
  final String? message;
  final int minLength;
  final int maxLength;
  final String confirmLabel;
  final bool destructive;
  final String initial;

  @override
  State<_PromptDialog> createState() => _PromptDialogState();
}

class _PromptDialogState extends State<_PromptDialog> {
  late final _controller = TextEditingController(text: widget.initial);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final valid = _controller.text.trim().length >= widget.minLength;
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.message != null) ...[Text(widget.message!), const SizedBox(height: Space.x4)],
            TextField(
              controller: _controller,
              autofocus: true,
              maxLength: widget.maxLength,
              minLines: 1,
              maxLines: 4,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: widget.label,
                hintText: widget.hint,
                helperText: widget.minLength > 0 ? 'At least ${widget.minLength} characters' : null,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        FilledButton(
          style: widget.destructive
              ? FilledButton.styleFrom(backgroundColor: context.colors.danger500)
              : null,
          onPressed: valid ? () => Navigator.pop(context, _controller.text.trim()) : null,
          child: Text(widget.confirmLabel),
        ),
      ],
    );
  }
}

// ---- Money input -----------------------------------------------------------

/// "1,390" / "1390.50" / "Rs 1,390" → paisa. `null` when not a valid amount.
int? parseRupees(String input) {
  final cleaned = input.replaceAll(RegExp(r'rs\.?|,|\s', caseSensitive: false), '');
  if (cleaned.isEmpty) return null;
  if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(cleaned)) return null;
  final parts = cleaned.split('.');
  final rupees = int.parse(parts[0]);
  final paisa = parts.length == 2 ? int.parse(parts[1].padRight(2, '0')) : 0;
  return rupees * 100 + paisa;
}

/// Paisa → editable rupee text: 139000 → "1390", 139050 → "1390.50".
String rupeesText(int paisa) {
  final r = paisa ~/ 100;
  final p = paisa % 100;
  return p == 0 ? '$r' : '$r.${p.toString().padLeft(2, '0')}';
}

class RupeeField extends StatelessWidget {
  const RupeeField({
    super.key,
    required this.controller,
    required this.label,
    this.helper,
    this.optional = false,
    this.enabled = true,
    this.onChanged,
  });

  final TextEditingController controller;
  final String label;
  final String? helper;
  final bool optional;
  final bool enabled;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      onChanged: onChanged,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))],
      decoration: InputDecoration(
        labelText: label,
        prefixText: 'Rs ',
        hintText: 'e.g. 1390',
        helperText: helper,
      ),
      validator: (v) {
        if ((v ?? '').trim().isEmpty) return optional ? null : 'Enter an amount';
        return parseRupees(v!) == null ? 'Enter an amount like 1390 or 1390.50' : null;
      },
    );
  }
}

class IntField extends StatelessWidget {
  const IntField({
    super.key,
    required this.controller,
    required this.label,
    this.min = 0,
    this.max = 1 << 31,
    this.suffix,
    this.optional = false,
    this.helper,
  });

  final TextEditingController controller;
  final String label;
  final int min;
  final int max;
  final String? suffix;
  final bool optional;
  final String? helper;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(labelText: label, suffixText: suffix, helperText: helper),
      validator: (v) {
        if ((v ?? '').trim().isEmpty) return optional ? null : 'Required';
        final n = int.tryParse(v!.trim());
        if (n == null || n < min || n > max) return 'Enter a number from $min to $max';
        return null;
      },
    );
  }
}

// ---- Layout pieces ---------------------------------------------------------

class SectionCard extends StatelessWidget {
  const SectionCard({super.key, this.title, required this.children, this.trailing, this.padding});

  final String? title;
  final List<Widget> children;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    // Material (not a decorated box) so list tiles inside keep their ink.
    return Material(
      color: c.ink800,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.cardAll,
        side: BorderSide(color: c.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(Space.x4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: Space.x3),
                child: Row(
                  children: [
                    Expanded(
                      child: Semantics(
                        header: true,
                        child: Text(title!, style: Theme.of(context).textTheme.titleSmall),
                      ),
                    ),
                    if (trailing != null) ...[const SizedBox(width: Space.x2), Flexible(child: trailing!)],
                  ],
                ),
              ),
            ...children,
          ],
        ),
      ),
    );
  }
}

class KeyValue extends StatelessWidget {
  const KeyValue(this.label, this.value, {super.key, this.emphasis = false});

  final String label;
  final String value;
  final bool emphasis;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Text(label, style: emphasis ? t.titleSmall : t.bodyMedium)),
            const SizedBox(width: Space.x3),
            Flexible(
              child: Text(
                value,
                textAlign: TextAlign.end,
                style: emphasis ? t.titleSmall : t.bodyMedium?.copyWith(color: context.colors.cream50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A big number tile for dashboards.
class StatTile extends StatelessWidget {
  const StatTile({super.key, required this.label, required this.value, this.icon, this.note});

  final String label;
  final String value;
  final IconData? icon;
  final String? note;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    return Semantics(
      label: '$label: $value${note == null ? '' : ', $note'}',
      excludeSemantics: true,
      child: Container(
        padding: const EdgeInsets.all(Space.x4),
        decoration: BoxDecoration(
          color: c.ink800,
          borderRadius: Radii.cardAll,
          border: Border.all(color: c.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 18, color: c.bronze400),
                  const SizedBox(width: Space.x2),
                ],
                Expanded(child: Text(label, style: t.labelSmall, maxLines: 2)),
              ],
            ),
            const SizedBox(height: Space.x2),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(value, style: t.titleLarge),
            ),
            if (note != null) Text(note!, style: t.bodySmall),
          ],
        ),
      ),
    );
  }
}

/// Responsive grid of [StatTile]s: 2 columns on phones, 4 on tablets.
class StatGrid extends StatelessWidget {
  const StatGrid({super.key, required this.tiles});

  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) {
        final cols = box.maxWidth >= 700 ? 4 : 2;
        final w = (box.maxWidth - Space.x3 * (cols - 1)) / cols;
        return Wrap(
          spacing: Space.x3,
          runSpacing: Space.x3,
          children: [for (final t in tiles) SizedBox(width: w, child: t)],
        );
      },
    );
  }
}

// ---- Labels ----------------------------------------------------------------

String orderStatusLabel(OrderStatus s) => switch (s) {
  OrderStatus.pending => 'Pending',
  OrderStatus.confirmed => 'Confirmed',
  OrderStatus.rejected => 'Rejected',
  OrderStatus.preparing => 'Preparing',
  OrderStatus.ready => 'Ready',
  OrderStatus.outForDelivery => 'Out for delivery',
  OrderStatus.delivered => 'Delivered',
  OrderStatus.completed => 'Completed',
  OrderStatus.cancelled => 'Cancelled',
  OrderStatus.unknown => 'Unknown',
};

Widget orderBadge(OrderStatus s) => StatusBadge.order(s, orderStatusLabel(s));

String money(int paisa) => Money(paisa).format();

/// `source` wire value → what staff call it.
String orderSourceLabel(String source) => switch (source) {
  'WEB' => 'Website',
  'MOBILE' => 'App',
  'POS' => 'Counter',
  'WHATSAPP' => 'WhatsApp',
  'PHONE' => 'Phone',
  _ => source,
};

/// `28 Oct 2026` in restaurant time.
String shortDate(DateTime t) => DateFormat('d MMM yyyy', 'en_US').format(toKarachi(t));

/// `YYYY-MM-DD` for "today" in restaurant time.
String karachiToday() => DateFormat('yyyy-MM-dd').format(toKarachi(DateTime.now()));

/// "3 min ago" style, for live boards.
String ago(DateTime t, {DateTime? now}) {
  final d = (now ?? DateTime.now()).difference(t);
  if (d.inMinutes < 1) return 'just now'; // also covers small clock skew
  if (d.inMinutes < 60) return '${d.inMinutes} min ago';
  if (d.inHours < 24) return '${d.inHours} h ago';
  return shortDate(t);
}

// ---- Branch picker (owner) -------------------------------------------------

/// App-bar action: the owner picks which branch to work on; staff see their branch name.
class BranchChip extends ConsumerWidget {
  const BranchChip({super.key, this.allowAll = true});

  /// Whether "All branches" is a valid choice on this screen.
  final bool allowAll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider).value;
    final name = ref.watch(activeBranchNameProvider);
    final isOwner = session?.ownBranchId == null;
    final t = Theme.of(context).textTheme;
    final label = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.storefront_outlined, size: 18),
        const SizedBox(width: Space.x1),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 150),
          child: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: t.labelMedium),
        ),
        if (isOwner) const Icon(Icons.expand_more_rounded, size: 18),
      ],
    );
    if (!isOwner) {
      return Padding(
        padding: const EdgeInsets.only(right: Space.x3),
        child: label,
      );
    }
    return Padding(
      padding: const EdgeInsets.only(right: Space.x2),
      child: TextButton(
        onPressed: () => pickBranch(context, ref, allowAll: allowAll),
        child: Semantics(label: 'Branch: $name. Change branch', excludeSemantics: true, child: label),
      ),
    );
  }
}

Future<void> pickBranch(BuildContext context, WidgetRef ref, {bool allowAll = true}) async {
  final branches = await ref.read(adminBranchesProvider.future).catchError((_) => const <Never>[]);
  if (!context.mounted) return;
  final current = ref.read(activeBranchProvider);
  final picked = await showModalBottomSheet<({String? id})>(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (context) => ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: Space.x6),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Space.gutter, 0, Space.gutter, Space.x3),
          child: Text('Work on branch', style: Theme.of(context).textTheme.headlineSmall),
        ),
        if (allowAll)
          ListTile(
            leading: const Icon(Icons.all_inclusive_rounded),
            title: const Text('All branches'),
            selected: current == null,
            onTap: () => Navigator.pop(context, (id: null)),
          ),
        for (final b in branches)
          ListTile(
            leading: Icon(b.isActive ? Icons.storefront_outlined : Icons.store_mall_directory_outlined),
            title: Text(b.name),
            subtitle: Text(b.isActive ? b.city : '${b.city} · inactive'),
            selected: current == b.id,
            onTap: () => Navigator.pop(context, (id: b.id)),
          ),
      ],
    ),
  );
  if (picked != null) await ref.read(activeBranchProvider.notifier).choose(picked.id);
}

/// Shown when an owner opens a branch-only screen with "All branches" selected.
class NeedsBranch extends ConsumerWidget {
  const NeedsBranch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MessagePanel(
    icon: Icons.storefront_outlined,
    title: 'Choose a branch',
    message: 'This screen works on one branch at a time.',
    actionLabel: 'Choose branch',
    onAction: () => pickBranch(context, ref, allowAll: false),
  );
}
