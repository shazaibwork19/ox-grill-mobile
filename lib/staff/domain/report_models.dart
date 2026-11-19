import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_models.freezed.dart';
part 'report_models.g.dart';

/// `range` query for every report endpoint.
enum ReportRange {
  today('today', 'Today'),
  week('7d', '7 days'),
  month('30d', '30 days'),
  custom('custom', 'Custom');

  const ReportRange(this.wire, this.label);
  final String wire;
  final String label;
}

@freezed
abstract class ResolvedRange with _$ResolvedRange {
  const factory ResolvedRange({required String from, required String to}) = _ResolvedRange;

  factory ResolvedRange.fromJson(Map<String, dynamic> json) => _$ResolvedRangeFromJson(json);
}

@freezed
abstract class PeriodTotals with _$PeriodTotals {
  const factory PeriodTotals({
    @Default(0) int revenue,
    @Default(0) int orders,
    @Default(0) int averageOrderValue,
    @Default(0) int cancelledOrders,
    @Default(0) int rejectedOrders,
  }) = _PeriodTotals;

  factory PeriodTotals.fromJson(Map<String, dynamic> json) => _$PeriodTotalsFromJson(json);
}

@freezed
abstract class PeriodChange with _$PeriodChange {
  const factory PeriodChange({double? revenuePct, double? ordersPct, double? averageOrderValuePct}) =
      _PeriodChange;

  factory PeriodChange.fromJson(Map<String, dynamic> json) => _$PeriodChangeFromJson(json);
}

@freezed
abstract class ReportOverview with _$ReportOverview {
  const factory ReportOverview({
    required ResolvedRange range,
    required PeriodTotals current,
    required PeriodTotals previous,
    @Default(PeriodChange()) PeriodChange change,
  }) = _ReportOverview;

  factory ReportOverview.fromJson(Map<String, dynamic> json) => _$ReportOverviewFromJson(json);
}

/// One row of any breakdown report (day, item, method, status, type, hour, branch).
@freezed
abstract class ReportRow with _$ReportRow {
  const factory ReportRow({
    String? date,
    int? hour,
    String? name,
    String? method,
    String? status,
    String? type,
    String? branchId,
    String? branchName,
    @Default(0) int orders,
    @Default(0) int quantity,
    @Default(0) int revenue,
    @Default(0) int averageOrderValue,
    @Default(0) int previousRevenue,
    double? revenueChangePct,
    @Default(0) int cancelledOrders,
  }) = _ReportRow;

  factory ReportRow.fromJson(Map<String, dynamic> json) => _$ReportRowFromJson(json);
}

@freezed
abstract class ForecastHour with _$ForecastHour {
  const factory ForecastHour({
    required int hour,
    @Default(0) double expectedOrders,
    @Default(0) double lower,
    @Default(0) double upper,
    @Default(0) int expectedRevenue,
  }) = _ForecastHour;

  factory ForecastHour.fromJson(Map<String, dynamic> json) => _$ForecastHourFromJson(json);
}

@freezed
abstract class ForecastDay with _$ForecastDay {
  const factory ForecastDay({
    required String date,
    @Default(0) int dayOfWeek,
    @Default(0) double expectedOrders,
    @Default(0) int expectedRevenue,
    @Default(0) double historicalAverageOrders,
    @Default([]) List<int> peakHours,
    @Default([]) List<ForecastHour> hours,
  }) = _ForecastDay;

  factory ForecastDay.fromJson(Map<String, dynamic> json) => _$ForecastDayFromJson(json);
}

@freezed
abstract class Forecast with _$Forecast {
  const factory Forecast({
    required String branchId,
    @Default('') String branchName,
    required String status,
    String? message,
    String? method,
    DateTime? generatedAt,
    @Default(0) int historyWeeks,
    @Default([]) List<ForecastDay> days,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);
}
