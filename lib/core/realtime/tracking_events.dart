import '../domain/enums.dart';

/// A realtime event about one order. The screen refetches
/// `GET /orders/track/{token}` on any event, so only the fields needed for
/// logging and deciding to refetch are parsed.
sealed class TrackingEvent {
  const TrackingEvent();

  /// Socket.IO event names the app listens to (see MOBILE_APP_SPEC §6).
  static const statusChanged = 'order:statusChanged';
  static const paymentUpdated = 'order:paymentUpdated';
  static const locationUpdate = 'delivery:locationUpdate';
  static const names = [statusChanged, paymentUpdated, locationUpdate];

  /// Parses a raw Socket.IO event. Returns `null` for unknown events or
  /// payloads without an `orderId`.
  static TrackingEvent? parse(String event, Object? payload) {
    if (payload is! Map) return null;
    final orderId = payload['orderId'];
    if (orderId is! String) return null;
    switch (event) {
      case statusChanged:
        return OrderStatusChanged(
          orderId: orderId,
          toStatus: OrderStatus.fromWire(payload['toStatus'] as String?),
          changedAt: DateTime.tryParse(payload['changedAt'] as String? ?? ''),
        );
      case paymentUpdated:
        return OrderPaymentUpdated(orderId: orderId, paymentStatus: payload['paymentStatus'] as String?);
      case locationUpdate:
        final lat = payload['latitude'];
        final lng = payload['longitude'];
        if (lat is! num || lng is! num) return null;
        return RiderLocationUpdated(orderId: orderId, latitude: lat.toDouble(), longitude: lng.toDouble());
    }
    return null;
  }
}

class OrderStatusChanged extends TrackingEvent {
  const OrderStatusChanged({required this.orderId, required this.toStatus, this.changedAt});

  final String orderId;
  final OrderStatus toStatus;
  final DateTime? changedAt;
}

class OrderPaymentUpdated extends TrackingEvent {
  const OrderPaymentUpdated({required this.orderId, this.paymentStatus});

  final String orderId;
  final String? paymentStatus;
}

class RiderLocationUpdated extends TrackingEvent {
  const RiderLocationUpdated({required this.orderId, required this.latitude, required this.longitude});

  final String orderId;
  final double latitude;
  final double longitude;
}

/// Emitted after a (re)connect and successful subscribe: events may have been
/// missed while disconnected, so the screen should refetch.
class TrackingResubscribed extends TrackingEvent {
  const TrackingResubscribed();
}
