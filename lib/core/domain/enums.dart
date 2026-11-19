import 'package:json_annotation/json_annotation.dart';

/// Wire values match the OpenAPI document exactly. Every enum has an `unknown`
/// member so a value added on the server later does not break parsing.

@JsonEnum(valueField: 'wire')
enum OrderType {
  delivery('DELIVERY'),
  pickup('PICKUP'),
  dineIn('DINE_IN'),
  counterPos('COUNTER_POS'),
  unknown('UNKNOWN');

  const OrderType(this.wire);
  final String wire;

  /// Types a customer can choose in the app.
  static const customerTypes = [delivery, pickup, dineIn];

  String get label => switch (this) {
    delivery => 'Delivery',
    pickup => 'Pickup',
    dineIn => 'Dine-in',
    counterPos => 'Counter',
    unknown => 'Order',
  };

  static OrderType fromWire(String? value) =>
      values.firstWhere((t) => t.wire == value, orElse: () => OrderType.unknown);
}

@JsonEnum(valueField: 'wire')
enum PaymentMethod {
  cash('CASH'),
  cashOnDelivery('CASH_ON_DELIVERY'),
  cardAtCounter('CARD_AT_COUNTER'),
  online('ONLINE'),
  unknown('UNKNOWN');

  const PaymentMethod(this.wire);
  final String wire;

  String get label => switch (this) {
    cash => 'Cash',
    cashOnDelivery => 'Cash on delivery',
    cardAtCounter => 'Card at the counter',
    online => 'Pay online',
    unknown => 'Other',
  };

  /// Cash and COD use the branch's cash tax rate; card and online use the card rate.
  bool get isCashRate => this == cash || this == cashOnDelivery;

  static PaymentMethod fromWire(String? value) =>
      values.firstWhere((m) => m.wire == value, orElse: () => PaymentMethod.unknown);
}

@JsonEnum(valueField: 'wire')
enum OrderStatus {
  pending('PENDING'),
  confirmed('CONFIRMED'),
  rejected('REJECTED'),
  preparing('PREPARING'),
  ready('READY'),
  outForDelivery('OUT_FOR_DELIVERY'),
  delivered('DELIVERED'),
  completed('COMPLETED'),
  cancelled('CANCELLED'),
  unknown('UNKNOWN');

  const OrderStatus(this.wire);
  final String wire;

  /// No further changes will happen.
  bool get isFinal => this == completed || this == cancelled || this == rejected;

  bool get isFailed => this == cancelled || this == rejected;

  static OrderStatus fromWire(String? value) =>
      values.firstWhere((s) => s.wire == value, orElse: () => OrderStatus.unknown);
}

@JsonEnum(valueField: 'wire')
enum PaymentStatus {
  pending('PENDING'),
  authorized('AUTHORIZED'),
  paid('PAID'),
  failed('FAILED'),
  refunded('REFUNDED'),
  partiallyRefunded('PARTIALLY_REFUNDED'),
  unknown('UNKNOWN');

  const PaymentStatus(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum TrackingStepState {
  done('done'),
  current('current'),
  upcoming('upcoming'),
  unknown('unknown');

  const TrackingStepState(this.wire);
  final String wire;
}
