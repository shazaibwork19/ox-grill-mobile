import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../core/network/auth/auth_interceptor.dart';
import '../../core/network/auth/token_store.dart';
import '../../core/providers.dart';
import 'session.dart';

/// A realtime event for staff screens. Screens refetch on the events that
/// concern them; payloads are kept as maps because the server sends whole
/// objects that the REST endpoints return anyway.
class StaffEvent {
  const StaffEvent(this.name, this.payload);

  final String name;
  final Map<String, dynamic> payload;

  String? get orderNumber => payload['orderNumber'] as String?;

  static const orderCreated = 'order:created';
  static const orderStatusChanged = 'order:statusChanged';
  static const orderPaymentUpdated = 'order:paymentUpdated';
  static const kitchenNewOrder = 'kitchen:newOrder';
  static const kitchenOrderUpdated = 'kitchen:orderUpdated';
  static const kitchenOrderCancelled = 'kitchen:orderCancelled';
  static const deliveryAssigned = 'delivery:assigned';
  static const deliveryLocation = 'delivery:locationUpdate';
  static const waitlistUpdated = 'waitlist:updated';
  static const waitlistEntryUpdated = 'waitlist:entryUpdated';
  static const reservationUpdated = 'reservation:updated';
  static const menuAvailabilityChanged = 'menu:availabilityChanged';

  /// Event names from the OpenAPI description (MOBILE_APP_SPEC §6).
  static const all = [
    orderCreated,
    orderStatusChanged,
    orderPaymentUpdated,
    kitchenNewOrder,
    kitchenOrderUpdated,
    kitchenOrderCancelled,
    deliveryAssigned,
    deliveryLocation,
    waitlistUpdated,
    waitlistEntryUpdated,
    reservationUpdated,
    menuAvailabilityChanged,
  ];

  static StaffEvent? parse(String name, Object? payload) {
    if (!all.contains(name)) return null;
    return StaffEvent(name, payload is Map ? Map<String, dynamic>.from(payload) : const {});
  }
}

/// Authenticated Socket.IO connection (`auth: { token }`). Staff join their
/// branch rooms automatically. On `TOKEN_EXPIRED` the token is refreshed and
/// the socket reconnects.
class StaffSocket {
  StaffSocket({required String origin, required TokenStore store, required this.refresher}) {
    _socket = io.io(
      origin,
      io.OptionBuilder()
          .setPath('/socket.io')
          .setTransports(['websocket', 'polling'])
          .enableForceNew()
          .enableReconnection()
          .setReconnectionDelay(1000)
          .setReconnectionDelayMax(15000)
          .setRandomizationFactor(0.5)
          .setAuthFn((callback) async => callback({'token': (await store.read())?.accessToken}))
          .disableAutoConnect()
          .build(),
    );
    _socket.onConnect((_) {
      _connected.add(true);
      // Missed events are not replayed: let screens refetch.
      _events.add(const StaffEvent('reconnected', {}));
    });
    _socket.onDisconnect((_) => _connected.add(false));
    _socket.onConnectError(_onConnectError);
    for (final name in StaffEvent.all) {
      _socket.on(name, (data) {
        final e = StaffEvent.parse(name, data);
        if (e != null && !_events.isClosed) _events.add(e);
      });
    }
    _socket.connect();
  }

  final TokenRefresher refresher;
  late final io.Socket _socket;
  final _events = StreamController<StaffEvent>.broadcast();
  final _connected = StreamController<bool>.broadcast();
  bool _refreshing = false;

  Stream<StaffEvent> get events => _events.stream;
  Stream<bool> get connected => _connected.stream;

  Future<void> _onConnectError(Object? err) async {
    _connected.add(false);
    final data = err is Map ? err['data'] : null;
    final code = data is Map ? data['code'] : null;
    if (code != 'TOKEN_EXPIRED' || _refreshing) return;
    _refreshing = true;
    try {
      final tokens = await refresher.refresh();
      if (tokens != null) _socket.connect();
    } catch (_) {
      // Offline: the library keeps retrying with the current token.
    } finally {
      _refreshing = false;
    }
  }

  void dispose() {
    _socket
      ..clearListeners()
      ..dispose();
    unawaited(_events.close());
    unawaited(_connected.close());
  }
}

/// Live while someone is signed in; replaced when the user changes.
final staffSocketProvider = Provider<StaffSocket?>((ref) {
  final userId = ref.watch(sessionProvider.select((s) => s.value?.user.id));
  if (userId == null) return null;
  final socket = StaffSocket(
    origin: ref.watch(appConfigProvider).socketOrigin,
    store: ref.watch(staffTokenStoreProvider),
    refresher: ref.watch(tokenRefresherProvider),
  );
  ref.onDispose(socket.dispose);
  return socket;
});

/// Every staff event, for `ref.listen`.
final staffEventsProvider = StreamProvider<StaffEvent>((ref) {
  final socket = ref.watch(staffSocketProvider);
  return socket?.events ?? const Stream.empty();
});
