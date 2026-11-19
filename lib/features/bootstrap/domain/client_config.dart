import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/enums.dart';

part 'client_config.freezed.dart';
part 'client_config.g.dart';

/// `GET /config` (`ClientConfig`).
@freezed
abstract class ClientConfig with _$ClientConfig {
  const factory ClientConfig({
    required String apiVersion,
    @Default('PKR') String currency,
    @Default(100) int currencyMinorUnits,
    @Default('Asia/Karachi') String timezone,
    required FeatureFlags features,
    @Default({}) Map<String, List<String>> paymentMethodsByOrderType,
    SupportContact? support,
  }) = _ClientConfig;

  const ClientConfig._();

  factory ClientConfig.fromJson(Map<String, dynamic> json) => _$ClientConfigFromJson(json);

  /// Payment methods the server allows for [type], in server order.
  /// Methods this app does not know are dropped, as is `ONLINE` while the
  /// `onlinePayments` feature is off.
  List<PaymentMethod> paymentMethodsFor(OrderType type) => [
    for (final wire in paymentMethodsByOrderType[type.wire] ?? const <String>[])
      if (PaymentMethod.fromWire(wire) case final m
          when m != PaymentMethod.unknown && (m != PaymentMethod.online || features.onlinePayments))
        m,
  ];
}

@freezed
abstract class FeatureFlags with _$FeatureFlags {
  const factory FeatureFlags({
    @Default(false) bool reservations,
    @Default(false) bool waitlist,
    @Default(false) bool whatsapp,
    @Default(false) bool aiAssistant,
    @Default(false) bool deliveryGps,
    @Default(false) bool forecasting,
    @Default(false) bool onlinePayments,
  }) = _FeatureFlags;

  factory FeatureFlags.fromJson(Map<String, dynamic> json) => _$FeatureFlagsFromJson(json);
}

@freezed
abstract class SupportContact with _$SupportContact {
  const factory SupportContact({String? email, String? phone}) = _SupportContact;

  factory SupportContact.fromJson(Map<String, dynamic> json) => _$SupportContactFromJson(json);
}
