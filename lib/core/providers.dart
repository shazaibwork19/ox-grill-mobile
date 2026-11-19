import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/app_config.dart';
import 'network/api_client.dart';

/// Overridden in tests; defaults to `--dart-define` values.
final appConfigProvider = Provider<AppConfig>((ref) => AppConfig.fromEnvironment);

/// Must be overridden in `main()` with the loaded instance.
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('sharedPreferencesProvider must be overridden'),
);

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) => const FlutterSecureStorage());

/// Customer API client. Customers order as guests, so no auth interceptor is
/// attached here. A staff area would build a second client with
/// `AuthInterceptor` (see `core/network/auth/`).
final apiClientProvider = Provider<ApiClient>((ref) {
  final config = ref.watch(appConfigProvider);
  return ApiClient.create(baseUrl: config.apiBaseUrl);
});

/// `true` while the device reports some network. A `true` here does not
/// promise the API is reachable; requests still handle failures.
final isOnlineProvider = StreamProvider<bool>((ref) async* {
  final connectivity = Connectivity();
  bool online(List<ConnectivityResult> r) => r.any((c) => c != ConnectivityResult.none);
  yield online(await connectivity.checkConnectivity());
  yield* connectivity.onConnectivityChanged.map(online).distinct();
});
