// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResolvedRange _$ResolvedRangeFromJson(Map<String, dynamic> json) =>
    _ResolvedRange(from: json['from'] as String, to: json['to'] as String);

Map<String, dynamic> _$ResolvedRangeToJson(_ResolvedRange instance) => <String, dynamic>{
  'from': instance.from,
  'to': instance.to,
};

_PeriodTotals _$PeriodTotalsFromJson(Map<String, dynamic> json) => _PeriodTotals(
  revenue: (json['revenue'] as num?)?.toInt() ?? 0,
  orders: (json['orders'] as num?)?.toInt() ?? 0,
  averageOrderValue: (json['averageOrderValue'] as num?)?.toInt() ?? 0,
  cancelledOrders: (json['cancelledOrders'] as num?)?.toInt() ?? 0,
  rejectedOrders: (json['rejectedOrders'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PeriodTotalsToJson(_PeriodTotals instance) => <String, dynamic>{
  'revenue': instance.revenue,
  'orders': instance.orders,
  'averageOrderValue': instance.averageOrderValue,
  'cancelledOrders': instance.cancelledOrders,
  'rejectedOrders': instance.rejectedOrders,
};

_PeriodChange _$PeriodChangeFromJson(Map<String, dynamic> json) => _PeriodChange(
  revenuePct: (json['revenuePct'] as num?)?.toDouble(),
  ordersPct: (json['ordersPct'] as num?)?.toDouble(),
  averageOrderValuePct: (json['averageOrderValuePct'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PeriodChangeToJson(_PeriodChange instance) => <String, dynamic>{
  'revenuePct': ?instance.revenuePct,
  'ordersPct': ?instance.ordersPct,
  'averageOrderValuePct': ?instance.averageOrderValuePct,
};

_ReportOverview _$ReportOverviewFromJson(Map<String, dynamic> json) => _ReportOverview(
  range: ResolvedRange.fromJson(json['range'] as Map<String, dynamic>),
  current: PeriodTotals.fromJson(json['current'] as Map<String, dynamic>),
  previous: PeriodTotals.fromJson(json['previous'] as Map<String, dynamic>),
  change: json['change'] == null
      ? const PeriodChange()
      : PeriodChange.fromJson(json['change'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReportOverviewToJson(_ReportOverview instance) => <String, dynamic>{
  'range': instance.range.toJson(),
  'current': instance.current.toJson(),
  'previous': instance.previous.toJson(),
  'change': instance.change.toJson(),
};

_ReportRow _$ReportRowFromJson(Map<String, dynamic> json) => _ReportRow(
  date: json['date'] as String?,
  hour: (json['hour'] as num?)?.toInt(),
  name: json['name'] as String?,
  method: json['method'] as String?,
  status: json['status'] as String?,
  type: json['type'] as String?,
  branchId: json['branchId'] as String?,
  branchName: json['branchName'] as String?,
  orders: (json['orders'] as num?)?.toInt() ?? 0,
  quantity: (json['quantity'] as num?)?.toInt() ?? 0,
  revenue: (json['revenue'] as num?)?.toInt() ?? 0,
  averageOrderValue: (json['averageOrderValue'] as num?)?.toInt() ?? 0,
  previousRevenue: (json['previousRevenue'] as num?)?.toInt() ?? 0,
  revenueChangePct: (json['revenueChangePct'] as num?)?.toDouble(),
  cancelledOrders: (json['cancelledOrders'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ReportRowToJson(_ReportRow instance) => <String, dynamic>{
  'date': ?instance.date,
  'hour': ?instance.hour,
  'name': ?instance.name,
  'method': ?instance.method,
  'status': ?instance.status,
  'type': ?instance.type,
  'branchId': ?instance.branchId,
  'branchName': ?instance.branchName,
  'orders': instance.orders,
  'quantity': instance.quantity,
  'revenue': instance.revenue,
  'averageOrderValue': instance.averageOrderValue,
  'previousRevenue': instance.previousRevenue,
  'revenueChangePct': ?instance.revenueChangePct,
  'cancelledOrders': instance.cancelledOrders,
};

_ForecastHour _$ForecastHourFromJson(Map<String, dynamic> json) => _ForecastHour(
  hour: (json['hour'] as num).toInt(),
  expectedOrders: (json['expectedOrders'] as num?)?.toDouble() ?? 0,
  lower: (json['lower'] as num?)?.toDouble() ?? 0,
  upper: (json['upper'] as num?)?.toDouble() ?? 0,
  expectedRevenue: (json['expectedRevenue'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ForecastHourToJson(_ForecastHour instance) => <String, dynamic>{
  'hour': instance.hour,
  'expectedOrders': instance.expectedOrders,
  'lower': instance.lower,
  'upper': instance.upper,
  'expectedRevenue': instance.expectedRevenue,
};

_ForecastDay _$ForecastDayFromJson(Map<String, dynamic> json) => _ForecastDay(
  date: json['date'] as String,
  dayOfWeek: (json['dayOfWeek'] as num?)?.toInt() ?? 0,
  expectedOrders: (json['expectedOrders'] as num?)?.toDouble() ?? 0,
  expectedRevenue: (json['expectedRevenue'] as num?)?.toInt() ?? 0,
  historicalAverageOrders: (json['historicalAverageOrders'] as num?)?.toDouble() ?? 0,
  peakHours: (json['peakHours'] as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ?? const [],
  hours:
      (json['hours'] as List<dynamic>?)
          ?.map((e) => ForecastHour.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ForecastDayToJson(_ForecastDay instance) => <String, dynamic>{
  'date': instance.date,
  'dayOfWeek': instance.dayOfWeek,
  'expectedOrders': instance.expectedOrders,
  'expectedRevenue': instance.expectedRevenue,
  'historicalAverageOrders': instance.historicalAverageOrders,
  'peakHours': instance.peakHours,
  'hours': instance.hours.map((e) => e.toJson()).toList(),
};

_Forecast _$ForecastFromJson(Map<String, dynamic> json) => _Forecast(
  branchId: json['branchId'] as String,
  branchName: json['branchName'] as String? ?? '',
  status: json['status'] as String,
  message: json['message'] as String?,
  method: json['method'] as String?,
  generatedAt: json['generatedAt'] == null ? null : DateTime.parse(json['generatedAt'] as String),
  historyWeeks: (json['historyWeeks'] as num?)?.toInt() ?? 0,
  days:
      (json['days'] as List<dynamic>?)
          ?.map((e) => ForecastDay.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ForecastToJson(_Forecast instance) => <String, dynamic>{
  'branchId': instance.branchId,
  'branchName': instance.branchName,
  'status': instance.status,
  'message': ?instance.message,
  'method': ?instance.method,
  'generatedAt': ?instance.generatedAt?.toIso8601String(),
  'historyWeeks': instance.historyWeeks,
  'days': instance.days.map((e) => e.toJson()).toList(),
};
