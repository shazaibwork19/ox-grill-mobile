import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'tracking_events.dart';

/// Live updates for one guest order.
abstract interface class TrackingChannel {
  Stream<TrackingEvent> get events;

  /// `true` while connected *and* subscribed to the order's room.
  ValueListenable<bool> get live;

  void dispose();
}

typedef TrackingChannelFactory = TrackingChannel Function(String token);

/// Socket.IO channel: `subscribe { type: "orderTracking", token }`.
///
/// The client library reconnects with exponential backoff (1 s → 15 s, with
/// jitter). After every reconnect it subscribes again and emits
/// [TrackingResubscribed], because the server does not replay missed events.
class SocketTrackingChannel implements TrackingChannel {
  SocketTrackingChannel({required String origin, required this.token}) {
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
          .setTimeout(10000)
          .disableAutoConnect()
          .build(),
    );
    _socket.onConnect((_) => _subscribe());
    _socket.onDisconnect((_) => _live.value = false);
    _socket.onConnectError((_) => _live.value = false);
    for (final name in TrackingEvent.names) {
      _socket.on(name, (data) {
        final event = TrackingEvent.parse(name, data);
        if (event != null && !_events.isClosed) _events.add(event);
      });
    }
    _socket.connect();
  }

  final String token;
  late final io.Socket _socket;
  final _events = StreamController<TrackingEvent>.broadcast();
  final _live = ValueNotifier(false);

  void _subscribe() {
    _socket.emitWithAck(
      'subscribe',
      {'type': 'orderTracking', 'token': token},
      ack: (Object? reply) {
        final ok = reply is Map && reply['ok'] == true;
        _live.value = ok;
        if (ok && !_events.isClosed) _events.add(const TrackingResubscribed());
      },
    );
  }

  @override
  Stream<TrackingEvent> get events => _events.stream;

  @override
  ValueListenable<bool> get live => _live;

  @override
  void dispose() {
    _socket
      ..clearListeners()
      ..dispose();
    unawaited(_events.close());
    _live.dispose();
  }
}
