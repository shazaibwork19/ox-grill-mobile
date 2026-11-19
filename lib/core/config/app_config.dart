/// Build-time configuration. Values come from `--dart-define`, never from
/// source, so the same code can point at staging or production.
///
/// ```
/// flutter run --dart-define=API_BASE_URL=https://api.example.com/api/v1
/// ```
class AppConfig {
  const AppConfig({required this.apiBaseUrl, required this.environment});

  /// Full API base including the version prefix, e.g. `https://host/api/v1`.
  final String apiBaseUrl;

  /// Free-form label shown in debug builds (`staging`, `production`, ...).
  final String environment;

  /// Socket.IO lives at the API origin (no `/api/v1`).
  String get socketOrigin {
    final uri = Uri.parse(apiBaseUrl);
    return uri.replace(path: '', query: null, fragment: null).toString().replaceAll(RegExp(r'/$'), '');
  }

  bool get isConfigured => apiBaseUrl.isNotEmpty;

  static const AppConfig fromEnvironment = AppConfig(
    apiBaseUrl: String.fromEnvironment('API_BASE_URL'),
    environment: String.fromEnvironment('APP_ENV', defaultValue: 'unknown'),
  );
}
