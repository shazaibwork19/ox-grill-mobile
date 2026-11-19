import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/format/phone.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/launch.dart';
import '../../../core/widgets/panels.dart';
import '../../../core/widgets/skeleton.dart';
import '../../../core/widgets/status_badge.dart';
import '../data/branch_repository.dart';
import '../domain/branch.dart';

class BranchInfoScreen extends ConsumerWidget {
  const BranchInfoScreen({super.key, required this.branchId});

  final String branchId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(branchDetailProvider(branchId));
    return Scaffold(
      appBar: AppBar(title: Text(detail.value?.name ?? 'Branch')),
      body: switch (detail) {
        AsyncData(:final value) => _Body(branch: value),
        AsyncError(:final error) => MessagePanel.failure(
          error,
          title: 'Couldn’t load this branch',
          onRetry: () => ref.invalidate(branchDetailProvider(branchId)),
        ),
        _ => SkeletonPulse(
          child: ListView(
            padding: const EdgeInsets.all(Space.gutter),
            children: [
              for (var i = 0; i < 6; i++) ...[
                SkeletonLine(
                  widthFactor: i.isEven ? 0.4 : 0.85,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: Space.x3),
              ],
            ],
          ),
        ),
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.branch});

  final BranchDetail branch;

  static const _days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    final hours = [...branch.hours]..sort((a, b) => ((a.dayOfWeek + 6) % 7).compareTo((b.dayOfWeek + 6) % 7));
    final todayIndex = DateTime.now().toUtc().add(const Duration(hours: 5)).weekday % 7;
    return ListView(
      padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x4, Space.gutter, Space.x12),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: StatusBadge.branch(
            acceptingOrders: branch.status.acceptingOrders,
            isOpen: branch.status.isOpen,
            label: branch.status.label,
          ),
        ),
        const SizedBox(height: Space.x6),
        Text('Address', style: t.titleSmall),
        const SizedBox(height: Space.x1),
        Text(branch.addressLine, style: t.bodyLarge),
        const SizedBox(height: Space.x4),
        Wrap(
          spacing: Space.x3,
          runSpacing: Space.x3,
          children: [
            FilledButton.icon(
              onPressed: () => callNumber(context, branch.phone),
              icon: const Icon(Icons.call_rounded),
              label: Text('Call ${displayPhone(branch.phone)}'),
            ),
            OutlinedButton.icon(
              onPressed: () => openMap(
                context,
                lat: branch.latitude,
                lng: branch.longitude,
                label: '${branch.name}, ${branch.addressLine}',
              ),
              icon: const Icon(Icons.map_outlined),
              label: const Text('Open in Maps'),
            ),
          ],
        ),
        if (hours.isNotEmpty) ...[
          const SizedBox(height: Space.x8),
          Text('Opening hours', style: t.titleSmall),
          const SizedBox(height: Space.x1),
          Text('Restaurant time (Pakistan). Hours can change on holidays.', style: t.bodySmall),
          const SizedBox(height: Space.x3),
          for (final h in hours)
            MergeSemantics(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Space.x1 + 2),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _days[h.dayOfWeek.clamp(0, 6)],
                        style: h.dayOfWeek == todayIndex
                            ? t.titleSmall?.copyWith(color: c.bronze400)
                            : t.bodyLarge,
                      ),
                    ),
                    Text(
                      h.isClosed ? 'Closed' : '${h.opensAt} – ${h.closesAt}',
                      style: h.dayOfWeek == todayIndex
                          ? t.titleSmall?.copyWith(color: c.bronze400)
                          : t.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
        ],
        const SizedBox(height: Space.x8),
        Text('Services', style: t.titleSmall),
        const SizedBox(height: Space.x2),
        for (final s in branch.services.orderTypes)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Space.x1),
            child: Row(
              children: [
                Icon(Icons.check_rounded, size: 18, color: c.sage500),
                const SizedBox(width: Space.x2),
                Text(s.label, style: t.bodyLarge),
              ],
            ),
          ),
        if (branch.services.delivery) ...[
          const SizedBox(height: Space.x3),
          Text(
            'Delivery fee ${branch.deliveryFeeMoney.format()} · minimum order ${branch.minDeliveryOrderMoney.format()}',
            style: t.bodyMedium,
          ),
        ],
      ],
    );
  }
}
