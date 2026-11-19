// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientConfig _$ClientConfigFromJson(Map<String, dynamic> json) => _ClientConfig(
  apiVersion: json['apiVersion'] as String,
  currency: json['currency'] as String? ?? 'PKR',
  currencyMinorUnits: (json['currencyMinorUnits'] as num?)?.toInt() ?? 100,
  timezone: json['timezone'] as String? ?? 'Asia/Karachi',
  features: FeatureFlags.fromJson(json['features'] as Map<String, dynamic>),
  paymentMethodsByOrderType:
      (json['paymentMethodsByOrderType'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ) ??
      const {},
  support: json['support'] == null ? null : SupportContact.fromJson(json['support'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ClientConfigToJson(_ClientConfig instance) => <String, dynamic>{
  'apiVersion': instance.apiVersion,
  'currency': instance.currency,
  'currencyMinorUnits': instance.currencyMinorUnits,
  'timezone': instance.timezone,
  'features': instance.features.toJson(),
  'paymentMethodsByOrderType': instance.paymentMethodsByOrderType,
  'support': ?instance.support?.toJson(),
};

_FeatureFlags _$FeatureFlagsFromJson(Map<String, dynamic> json) => _FeatureFlags(
  reservations: json['reservations'] as bool? ?? false,
  waitlist: json['waitlist'] as bool? ?? false,
  whatsapp: json['whatsapp'] as bool? ?? false,
  aiAssistant: json['aiAssistant'] as bool? ?? false,
  deliveryGps: json['deliveryGps'] as bool? ?? false,
  forecasting: json['forecasting'] as bool? ?? false,
  onlinePayments: json['onlinePayments'] as bool? ?? false,
);

Map<String, dynamic> _$FeatureFlagsToJson(_FeatureFlags instance) => <String, dynamic>{
  'reservations': instance.reservations,
  'waitlist': instance.waitlist,
  'whatsapp': instance.whatsapp,
  'aiAssistant': instance.aiAssistant,
  'deliveryGps': instance.deliveryGps,
  'forecasting': instance.forecasting,
  'onlinePayments': instance.onlinePayments,
};

_SupportContact _$SupportContactFromJson(Map<String, dynamic> json) =>
    _SupportContact(email: json['email'] as String?, phone: json['phone'] as String?);

Map<String, dynamic> _$SupportContactToJson(_SupportContact instance) => <String, dynamic>{
  'email': ?instance.email,
  'phone': ?instance.phone,
};
