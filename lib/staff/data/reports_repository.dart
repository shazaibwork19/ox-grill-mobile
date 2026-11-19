import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../core/session.dart';
import '../domain/report_models.dart';

/// Query for every report. `from`/`to` (`YYYY-MM-DD`) only with [ReportRange.custom].
class ReportQuery {
  const ReportQuery({this.range = ReportRange.today, this.from, this.to, this.branchId});

  final ReportRange range;
  final String? from;
  final String? to;
  final String? branchId;

  Map<String, Object?> toQuery() => {
    'range': range.wire,
    if (range == ReportRange.custom) 'from': from,
    if (range == ReportRange.custom) 'to': to,
    'branchId': branchId,
  };

  @override
  bool operator ==(Object other) =>
      other is ReportQuery &&
      other.range == range &&
      other.from == from &&
      other.to == to &&
      other.branchId == branchId;

  @override
  int get hashCode => Object.hash(range, from, to, branchId);
}

/// The breakdown reports and the list key each one returns.
enum Breakdown {
  salesByDay('/reports/sales-by-day', 'days', 'Sales by day', 'sales-by-day'),
  topItems('/reports/top-items', 'items', 'Top items', 'top-items'),
  paymentMethods('/reports/payment-methods', 'methods', 'Payment methods', 'payment-methods'),
  orderStatuses('/reports/order-statuses', 'statuses', 'Order statuses', null),
  orderTypes('/reports/order-statuses', 'types', 'Order types', null),
  hourly('/reports/hourly', 'hours', 'Orders by hour', null),
  branchComparison('/reports/branch-comparison', 'branches', 'Branch comparison', 'branch-comparison');

  const Breakdown(this.path, this.listKey, this.title, this.exportType);
  final String path;
  final String listKey;
  final String title;

  /// `type` for `GET /reports/export`, when CSV export exists for it.
  final String? exportType;
}

class ReportsRepository {
  ReportsRepository(this._api);

  final ApiClient _api;

  Future<ReportOverview> overview(ReportQuery q) =>
      _api.get('/reports/overview', query: q.toQuery(), decode: (d) => ReportOverview.fromJson(asJsonMap(d)));

  Future<List<ReportRow>> breakdown(Breakdown b, ReportQuery q) => _api.get(
    b.path,
    query: q.toQuery(),
    decode: (d) => asJsonList((d! as Map)[b.listKey], ReportRow.fromJson),
  );

  /// CSV text for sharing. [type]: sales-by-day, top-items, payment-methods, branch-comparison, orders.
  Future<String> export(ReportQuery q, String type) =>
      _api.getText('/reports/export', query: {...q.toQuery(), 'type': type});

  Future<List<Forecast>> forecasts({String? branchId, int days = 7}) => _api.get(
    '/forecasts',
    query: {'branchId': branchId, 'days': days},
    decode: (d) => asJsonList(d, Forecast.fromJson),
  );

  /// Owner: rebuild aggregates and forecasts now.
  Future<void> runForecasts({String? branchId}) =>
      _api.post('/admin/forecasts/run', body: {'branchId': ?branchId}, decode: (_) => null);
}

final reportsRepositoryProvider = Provider((ref) => ReportsRepository(ref.watch(staffApiProvider)));
