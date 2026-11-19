import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../core/providers.dart';
import '../domain/client_config.dart';

class ConfigRepository {
  ConfigRepository(this._api);

  final ApiClient _api;

  Future<ClientConfig> fetch() => _api.get('/config', decode: (d) => ClientConfig.fromJson(asJsonMap(d)));
}

final configRepositoryProvider = Provider((ref) => ConfigRepository(ref.watch(apiClientProvider)));

/// Feature flags and payment methods. Loaded at start and when the app returns
/// to the foreground (see `AppLifecycleRefresher`).
final clientConfigProvider = FutureProvider<ClientConfig>(
  (ref) => ref.watch(configRepositoryProvider).fetch(),
);
