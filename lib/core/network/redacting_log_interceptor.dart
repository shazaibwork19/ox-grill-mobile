import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Debug-only request log. Tracking tokens, auth headers and personal fields
/// are masked: a tracking token is enough to open someone's order.
class RedactingLogInterceptor extends Interceptor {
  static final _trackPath = RegExp(r'(orders/track/)[^/?#]+');
  static const _sensitiveKeys = {
    'trackingToken',
    'token',
    'accessToken',
    'refreshToken',
    'password',
    'contactPhone',
    'customerPhone',
    'phone',
    'addressLine',
  };

  static String redactPath(String path) =>
      _trackPath.hasMatch(path) ? path.replaceAllMapped(_trackPath, (m) => '${m[1]}***') : path;

  static Object? redactBody(Object? body) {
    if (body is Map) {
      return {
        for (final e in body.entries) e.key: _sensitiveKeys.contains(e.key) ? '***' : redactBody(e.value),
      };
    }
    if (body is List) return body.map(redactBody).toList();
    return body;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('→ ${options.method} ${redactPath(options.uri.path)}');
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    debugPrint('← ${response.statusCode} ${redactPath(response.requestOptions.uri.path)}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final body = redactBody(err.response?.data);
    debugPrint(
      '✕ ${err.response?.statusCode ?? err.type.name} ${redactPath(err.requestOptions.uri.path)} $body',
    );
    handler.next(err);
  }
}
