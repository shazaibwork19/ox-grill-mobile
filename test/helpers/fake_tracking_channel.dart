import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:ox_grill/core/realtime/tracking_channel.dart';
import 'package:ox_grill/core/realtime/tracking_events.dart';

class FakeTrackingChannel implements TrackingChannel {
  final _events = StreamController<TrackingEvent>.broadcast();
  final _live = ValueNotifier(false);
  bool disposed = false;

  void emit(TrackingEvent e) => _events.add(e);

  set isLive(bool value) => _live.value = value;

  @override
  Stream<TrackingEvent> get events => _events.stream;

  @override
  ValueListenable<bool> get live => _live;

  @override
  void dispose() {
    disposed = true;
    unawaited(_events.close());
  }
}
