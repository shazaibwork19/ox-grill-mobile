import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ox_grill/core/config/app_config.dart';
import 'package:ox_grill/core/network/api_client.dart';
import 'package:ox_grill/core/providers.dart';
import 'package:ox_grill/core/realtime/tracking_channel.dart';
import 'package:ox_grill/features/cart/application/quote_provider.dart';
import 'package:ox_grill/features/orders/application/tracking_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_tracking_channel.dart';

const testConfig = AppConfig(apiBaseUrl: 'https://api.test/api/v1', environment: 'test');

/// Overrides shared by unit and widget tests: fake API, in-memory storage,
/// no quote debounce, no real sockets.
Future<List<Override>> testOverrides({
  required ApiClient api,
  Map<String, Object> prefs = const {},
  TrackingChannelFactory? channels,
}) async {
  SharedPreferences.setMockInitialValues(prefs);
  FlutterSecureStorage.setMockInitialValues({});
  final instance = await SharedPreferences.getInstance();
  return [
    appConfigProvider.overrideWithValue(testConfig),
    sharedPreferencesProvider.overrideWithValue(instance),
    apiClientProvider.overrideWithValue(api),
    quoteDebounceProvider.overrideWithValue(Duration.zero),
    isOnlineProvider.overrideWith((ref) => Stream.value(true)),
    trackingChannelFactoryProvider.overrideWithValue(channels ?? (_) => FakeTrackingChannel()),
  ];
}
