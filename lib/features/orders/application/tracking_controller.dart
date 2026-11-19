import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/app_failure.dart';
import '../../../core/providers.dart';
import '../../../core/realtime/tracking_channel.dart';
import '../../../core/realtime/tracking_events.dart';
import '../data/order_repository.dart';
import '../data/saved_orders_store.dart';
import '../domain/order.dart';

final trackingChannelFactoryProvider = Provider<TrackingChannelFactory>((ref) {
  final origin = ref.watch(appConfigProvider).socketOrigin;
  return (token) => SocketTrackingChannel(origin: origin, token: token);
});

/// How often to poll while the socket is not live (spec: every 20 seconds).
final trackingPollIntervalProvider = Provider<Duration>((ref) => const Duration(seconds: 20));

/// Live status for one order, keyed by tracking token.
///
/// Socket events trigger a refetch. While the socket is not live (connecting,
/// reconnecting, blocked network), the order is polled instead. Both stop
/// once the order reaches a final status.
class TrackingController extends AsyncNotifier<PublicOrderStatus> {
  TrackingController(this.token);

  final String token;

  TrackingChannel? _channel;
  StreamSubscription<TrackingEvent>? _sub;
  Timer? _poll;
  bool _fetching = false;

  @override
  Future<PublicOrderStatus> build() async {
    ref.onDispose(_stopLive);
    final status = await _fetch();
    _syncLive(status);
    return status;
  }

  Future<PublicOrderStatus> _fetch() async {
    try {
      return await ref.read(orderRepositoryProvider).track(token);
    } on ApiFailure catch (e) {
      // The token no longer opens an order (expired or reset test data).
      if (e.isNotFound) unawaited(ref.read(savedOrdersProvider.notifier).remove(token));
      rethrow;
    }
  }

  /// Refetch now (pull to refresh, app resumed, socket event).
  Future<void> refresh() async {
    if (_fetching) return;
    _fetching = true;
    try {
      final status = await _fetch();
      if (!ref.mounted) return;
      state = AsyncData(status);
      _syncLive(status);
    } catch (e, st) {
      // Keep showing the last good status; only surface the error if there is none.
      if (ref.mounted && !state.hasValue) state = AsyncError(AppFailure.from(e), st);
    } finally {
      _fetching = false;
    }
  }

  void _syncLive(PublicOrderStatus status) {
    if (status.order.status.isFinal) {
      _stopLive();
      return;
    }
    if (_channel == null) {
      final channel = ref.read(trackingChannelFactoryProvider)(token);
      _channel = channel;
      _sub = channel.events.listen((_) => refresh());
      channel.live.addListener(_updatePolling);
    }
    _updatePolling();
  }

  void _updatePolling() {
    final live = _channel?.live.value ?? false;
    if (live) {
      _poll?.cancel();
      _poll = null;
    } else {
      _poll ??= Timer.periodic(ref.read(trackingPollIntervalProvider), (_) => refresh());
    }
  }

  bool get isLive => _channel?.live.value ?? false;

  void _stopLive() {
    _poll?.cancel();
    _poll = null;
    unawaited(_sub?.cancel());
    _sub = null;
    _channel?.live.removeListener(_updatePolling);
    _channel?.dispose();
    _channel = null;
  }
}

final trackingProvider = AsyncNotifierProvider.autoDispose
    .family<TrackingController, PublicOrderStatus, String>(TrackingController.new, retry: (_, _) => null);
