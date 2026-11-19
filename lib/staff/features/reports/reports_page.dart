import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/domain/enums.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/panels.dart';
import '../../../features/bootstrap/data/config_repository.dart';
import '../../core/branch_scope.dart';
import '../../core/permissions.dart';
import '../../core/session.dart';
import '../../data/reports_repository.dart';
import '../../domain/report_models.dart';
import '../../widgets/staff_ui.dart';

final overviewProvider = FutureProvider.autoDispose.family<ReportOverview, ReportQuery>(
  (ref, q) => ref.watch(reportsRepositoryProvider).overview(q),
);

final breakdownProvider = FutureProvider.autoDispose.family<List<ReportRow>, ({Breakdown b, ReportQuery q})>(
  (ref, k) => ref.watch(reportsRepositoryProvider).breakdown(k.b, k.q),
);

final forecastsProvider = FutureProvider.autoDispose.family<List<Forecast>, String?>(
  (ref, branchId) => ref.watch(reportsRepositoryProvider).forecasts(branchId: branchId),
);

/// Sales reports (owner: any or all branches; manager: own branch) and forecasts.
class ReportsPage extends ConsumerStatefulWidget {
  const ReportsPage({super.key});

  @override
  ConsumerState<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends ConsumerState<ReportsPage> {
  ReportRange _range = ReportRange.week;
  DateTimeRange? _custom;

  ReportQuery _query(String? branchId) => ReportQuery(
    range: _range,
    from: _custom == null ? null : DateFormat('yyyy-MM-dd').format(_custom!.start),
    to: _custom == null ? null : DateFormat('yyyy-MM-dd').format(_custom!.end),
    branchId: branchId,
  );

  Future<void> _pickCustom() async {
    final today = DateTime.parse(karachiToday());
    final r = await showDateRangePicker(
      context: context,
      firstDate: today.subtract(const Duration(days: 365)),
      lastDate: today,
      initialDateRange: _custom ?? DateTimeRange(start: today.subtract(const Duration(days: 6)), end: today),
    );
    if (r != null) {
      setState(() {
        _custom = r;
        _range = ReportRange.custom;
      });
    }
  }

  Future<void> _export(ReportQuery q) async {
    final type = await showModalBottomSheet<String>(
      context: context,
      useSafeArea: true,
      builder: (context) => ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: Space.x6),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(Space.gutter, 0, Space.gutter, Space.x2),
            child: Text('Export CSV', style: Theme.of(context).textTheme.headlineSmall),
          ),
          for (final (id, label) in const [
            ('sales-by-day', 'Sales by day'),
            ('orders', 'Orders'),
            ('top-items', 'Top items'),
            ('payment-methods', 'Payment methods'),
            ('branch-comparison', 'Branch comparison'),
          ])
            ListTile(
              leading: const Icon(Icons.table_view_outlined),
              title: Text(label),
              onTap: () => Navigator.pop(context, id),
            ),
        ],
      ),
    );
    if (type == null || !mounted) return;
    await runAction(context, () async {
      final csv = await ref.read(reportsRepositoryProvider).export(q, type);
      final dir = await getTemporaryDirectory();
      final file = File(
        '${dir.path}/ox-grill-$type-${q.range.wire}-${DateTime.now().millisecondsSinceEpoch}.csv',
      );
      await file.writeAsString(csv);
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path, mimeType: 'text/csv')],
          title: 'Ox & Grill $type',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionProvider).value!;
    final branchId = ref.watch(activeBranchProvider);
    final q = _query(branchId);
    final forecasting = ref.watch(clientConfigProvider).value?.features.forecasting ?? false;
    return DefaultTabController(
      length: forecasting ? 2 : 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reports'),
          actions: [
            IconButton(
              tooltip: 'Export CSV',
              icon: const Icon(Icons.ios_share_rounded),
              onPressed: () => _export(q),
            ),
            const BranchChip(),
          ],
          bottom: forecasting
              ? const TabBar(
                  tabs: [
                    Tab(text: 'Sales'),
                    Tab(text: 'Forecast'),
                  ],
                )
              : null,
        ),
        body: TabBarView(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(overviewProvider(q));
                ref.invalidate(breakdownProvider);
              },
              child: ListView(
                padding: const EdgeInsets.all(Space.gutter),
                children: [
                  Wrap(
                    spacing: Space.x2,
                    runSpacing: Space.x2,
                    children: [
                      for (final r in ReportRange.values)
                        ChoiceChip(
                          label: Text(
                            r == ReportRange.custom && _custom != null
                                ? '${DateFormat('d MMM').format(_custom!.start)} – ${DateFormat('d MMM').format(_custom!.end)}'
                                : r.label,
                          ),
                          selected: _range == r,
                          onSelected: (_) =>
                              r == ReportRange.custom ? _pickCustom() : setState(() => _range = r),
                        ),
                    ],
                  ),
                  const SizedBox(height: Space.x4),
                  _Overview(q: q),
                  for (final b in Breakdown.values)
                    if (b != Breakdown.branchComparison ||
                        (session.role == StaffRole.owner && branchId == null)) ...[
                      const SizedBox(height: Space.x4),
                      _BreakdownCard(b: b, q: q),
                    ],
                ],
              ),
            ),
            if (forecasting) _Forecasts(branchId: branchId, canRun: session.can(Capability.runForecasts)),
          ],
        ),
      ),
    );
  }
}

String _pct(double? p) => p == null ? '—' : '${p >= 0 ? '+' : ''}${p.toStringAsFixed(1)}%';

class _Overview extends ConsumerWidget {
  const _Overview({required this.q});

  final ReportQuery q;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(overviewProvider(q));
    return switch (v) {
      AsyncData(:final value) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${value.range.from} → ${value.range.to} · vs previous period',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: Space.x2),
          StatGrid(
            tiles: [
              StatTile(
                label: 'Revenue',
                value: money(value.current.revenue),
                note: _pct(value.change.revenuePct),
              ),
              StatTile(label: 'Orders', value: '${value.current.orders}', note: _pct(value.change.ordersPct)),
              StatTile(
                label: 'Average order',
                value: money(value.current.averageOrderValue),
                note: _pct(value.change.averageOrderValuePct),
              ),
              StatTile(
                label: 'Cancelled / rejected',
                value: '${value.current.cancelledOrders} / ${value.current.rejectedOrders}',
              ),
            ],
          ),
        ],
      ),
      AsyncError(:final error) => MessagePanel.failure(
        error,
        title: 'Couldn’t load the overview',
        onRetry: () => ref.invalidate(overviewProvider(q)),
      ),
      _ => const SizedBox(height: 160, child: Center(child: CircularProgressIndicator())),
    };
  }
}

class _BreakdownCard extends ConsumerWidget {
  const _BreakdownCard({required this.b, required this.q});

  final Breakdown b;
  final ReportQuery q;

  String _label(ReportRow r) => switch (b) {
    Breakdown.salesByDay => r.date ?? '',
    Breakdown.topItems => r.name ?? '',
    Breakdown.paymentMethods => PaymentMethod.fromWire(r.method).label,
    Breakdown.orderStatuses => orderStatusLabel(OrderStatus.fromWire(r.status)),
    Breakdown.orderTypes => OrderType.fromWire(r.type).label,
    Breakdown.hourly => '${(r.hour ?? 0).toString().padLeft(2, '0')}:00',
    Breakdown.branchComparison => r.branchName ?? '',
  };

  bool get _byOrders => b == Breakdown.orderStatuses || b == Breakdown.orderTypes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(breakdownProvider((b: b, q: q)));
    return SectionCard(
      title: b.title,
      children: [
        switch (v) {
          AsyncData(:final value) when value.isEmpty => Text(
            'No data for this period.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          AsyncData(:final value) => _Bars(
            rows: [
              for (final r in (b == Breakdown.hourly ? value.where((r) => r.orders > 0) : value).take(
                b == Breakdown.topItems ? 10 : 31,
              ))
                (
                  label: _label(r),
                  value: _byOrders ? r.orders : r.revenue,
                  text: _byOrders
                      ? '${r.orders}'
                      : b == Breakdown.topItems
                      ? '${r.quantity}× · ${money(r.revenue)}'
                      : b == Breakdown.branchComparison
                      ? '${money(r.revenue)} (${_pct(r.revenueChangePct)})'
                      : '${money(r.revenue)} · ${r.orders}',
                ),
            ],
          ),
          AsyncError(:final error) => Text(
            'Couldn’t load: ${MessagePanel.failure(error).message}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          _ => const LinearProgressIndicator(),
        },
      ],
    );
  }
}

/// Horizontal bars: label, proportional bar, value text.
class _Bars extends StatelessWidget {
  const _Bars({required this.rows});

  final List<({String label, int value, String text})> rows;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    final top = rows.fold(1, (m, r) => math.max(m, r.value));
    return Column(
      children: [
        for (final r in rows)
          MergeSemantics(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          r.label,
                          style: t.bodyMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: Space.x2),
                      Flexible(
                        child: Text(r.text, style: t.labelMedium, textAlign: TextAlign.end),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  ExcludeSemantics(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Radii.pill),
                      child: LinearProgressIndicator(
                        value: r.value <= 0 ? 0 : r.value / top,
                        minHeight: 8,
                        color: c.bronze400,
                        backgroundColor: c.ink950,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _Forecasts extends ConsumerWidget {
  const _Forecasts({required this.branchId, required this.canRun});

  final String? branchId;
  final bool canRun;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(forecastsProvider(branchId));
    final t = Theme.of(context).textTheme;
    return RefreshIndicator(
      onRefresh: () => ref.refresh(forecastsProvider(branchId).future),
      child: AsyncBody(
        value: v,
        onRetry: () => ref.invalidate(forecastsProvider(branchId)),
        data: (list) => ListView(
          padding: const EdgeInsets.all(Space.gutter),
          children: [
            if (canRun)
              OutlinedButton.icon(
                onPressed: () async {
                  await runAction(
                    context,
                    () => ref.read(reportsRepositoryProvider).runForecasts(branchId: branchId),
                    success: 'Forecasts rebuilt',
                  );
                  ref.invalidate(forecastsProvider(branchId));
                },
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Rebuild forecasts now'),
              ),
            if (list.isEmpty)
              const SizedBox(
                height: 300,
                child: MessagePanel(
                  icon: Icons.insights_outlined,
                  title: 'No forecasts',
                  message: 'Forecasts appear once there is enough order history.',
                ),
              ),
            for (final f in list) ...[
              const SizedBox(height: Space.x4),
              SectionCard(
                title: f.branchName,
                children: [
                  if (f.status != 'READY')
                    Text(f.message ?? 'Not enough history yet.', style: t.bodyMedium)
                  else ...[
                    Text(
                      'Based on ${f.historyWeeks} weeks${f.generatedAt != null ? ' · updated ${shortDate(f.generatedAt!)}' : ''}',
                      style: t.bodySmall,
                    ),
                    const SizedBox(height: Space.x2),
                    for (final d in f.days)
                      KeyValue(
                        DateFormat('EEE d MMM', 'en_US').format(DateTime.parse(d.date)),
                        '~${d.expectedOrders.round()} orders · ${money(d.expectedRevenue)}'
                        '${d.peakHours.isNotEmpty ? ' · peak ${d.peakHours.map((h) => '${h}h').join(', ')}' : ''}',
                      ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
