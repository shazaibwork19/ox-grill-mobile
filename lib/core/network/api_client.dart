import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../errors/app_failure.dart';
import 'redacting_log_interceptor.dart';

/// A decoded success envelope plus the bits of the HTTP reply callers need.
class ApiResponse<T> {
  const ApiResponse({required this.data, required this.statusCode, required this.headers});

  final T data;
  final int statusCode;
  final Headers headers;

  /// `true` when the server replayed a stored result for an `Idempotency-Key`.
  bool get idempotentReplayed => headers.value('idempotent-replayed') == 'true';
}

typedef Decoder<T> = T Function(Object? data);

/// Thin wrapper over [Dio] that unwraps `{ success, data }` and turns every
/// failure into an [AppFailure].
class ApiClient {
  ApiClient(this.dio);

  factory ApiClient.create({required String baseUrl, List<Interceptor> interceptors = const []}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl.endsWith('/') ? baseUrl : '$baseUrl/',
        connectTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        headers: {'Accept': 'application/json'},
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
    dio.interceptors.addAll(interceptors);
    if (kDebugMode) dio.interceptors.add(RedactingLogInterceptor());
    return ApiClient(dio);
  }

  final Dio dio;

  Future<T> get<T>(String path, {Map<String, Object?>? query, required Decoder<T> decode}) async {
    final response = await _send(
      () => dio.get<Object?>(_relative(path), queryParameters: _clean(query)),
      decode,
    );
    return response.data;
  }

  Future<ApiResponse<T>> post<T>(
    String path, {
    Object? body,
    Map<String, String>? headers,
    required Decoder<T> decode,
  }) {
    return _send(
      () => dio.post<Object?>(
        _relative(path),
        data: body,
        options: Options(headers: headers),
      ),
      decode,
    );
  }

  Future<ApiResponse<T>> patch<T>(String path, {Object? body, required Decoder<T> decode}) {
    return _send(() => dio.patch<Object?>(_relative(path), data: body), decode);
  }

  Future<ApiResponse<T>> put<T>(String path, {Object? body, required Decoder<T> decode}) {
    return _send(() => dio.put<Object?>(_relative(path), data: body), decode);
  }

  Future<ApiResponse<T>> delete<T>(String path, {required Decoder<T> decode}) {
    return _send(() => dio.delete<Object?>(_relative(path)), decode);
  }

  /// A paginated list: `data` plus `meta { page, pageSize, total, totalPages }`.
  Future<Paged<T>> getPage<T>(
    String path, {
    Map<String, Object?>? query,
    required T Function(Map<String, dynamic>) item,
  }) async {
    PageMeta? meta;
    final response = await _send(
      () => dio.get<Object?>(_relative(path), queryParameters: _clean(query)),
      (d) => asJsonList(d, item),
      onBody: (body) => meta = body['meta'] is Map
          ? PageMeta.fromJson(Map<String, dynamic>.from(body['meta'] as Map))
          : null,
    );
    return Paged(
      response.data,
      meta ?? PageMeta(page: 1, pageSize: response.data.length, total: response.data.length, totalPages: 1),
    );
  }

  /// `multipart/form-data` upload of one file field.
  Future<ApiResponse<T>> upload<T>(
    String path, {
    required String field,
    required List<int> bytes,
    required String filename,
    required String contentType,
    required Decoder<T> decode,
  }) {
    final form = FormData.fromMap({
      field: MultipartFile.fromBytes(bytes, filename: filename, contentType: DioMediaType.parse(contentType)),
    });
    return _send(() => dio.post<Object?>(_relative(path), data: form), decode);
  }

  /// A non-JSON body (e.g. `text/csv`). Error replies are still JSON envelopes.
  Future<String> getText(String path, {Map<String, Object?>? query}) async {
    try {
      final response = await dio.get<String>(
        _relative(path),
        queryParameters: _clean(query),
        options: Options(responseType: ResponseType.plain),
      );
      return response.data ?? '';
    } on DioException catch (e) {
      final data = e.response?.data;
      if (data is String && data.trimLeft().startsWith('{')) {
        try {
          throw ApiFailure.fromResponse(e.response!.statusCode ?? 0, jsonDecode(data), e.response!.headers);
        } on FormatException {
          // fall through
        }
      }
      throw AppFailure.from(e);
    }
  }

  Future<ApiResponse<T>> _send<T>(
    Future<Response<Object?>> Function() call,
    Decoder<T> decode, {
    void Function(Map<Object?, Object?> body)? onBody,
  }) async {
    final Response<Object?> response;
    try {
      response = await call();
    } catch (e) {
      throw AppFailure.from(e);
    }
    final body = response.data;
    if (body is! Map || body['success'] != true) {
      throw UnexpectedFailure('Response without a success envelope (HTTP ${response.statusCode})');
    }
    try {
      onBody?.call(body);
      return ApiResponse(
        data: decode(body['data']),
        statusCode: response.statusCode ?? 0,
        headers: response.headers,
      );
    } catch (e) {
      throw UnexpectedFailure(e);
    }
  }

  // Paths are written as "/menu"; Dio needs them relative so the /api/v1 prefix survives.
  static String _relative(String path) => path.startsWith('/') ? path.substring(1) : path;

  static Map<String, Object?>? _clean(Map<String, Object?>? query) {
    if (query == null) return null;
    return {
      for (final e in query.entries)
        if (e.value != null && e.value != '') e.key: e.value,
    };
  }
}

class PageMeta {
  const PageMeta({required this.page, required this.pageSize, required this.total, required this.totalPages});

  factory PageMeta.fromJson(Map<String, dynamic> j) => PageMeta(
    page: (j['page'] as num?)?.toInt() ?? 1,
    pageSize: (j['pageSize'] as num?)?.toInt() ?? 20,
    total: (j['total'] as num?)?.toInt() ?? 0,
    totalPages: (j['totalPages'] as num?)?.toInt() ?? 1,
  );

  final int page;
  final int pageSize;
  final int total;
  final int totalPages;

  bool get hasMore => page < totalPages;
}

class Paged<T> {
  const Paged(this.items, this.meta);

  final List<T> items;
  final PageMeta meta;
}

/// Decoding helpers for the envelope's `data` field.
Map<String, dynamic> asJsonMap(Object? data) => Map<String, dynamic>.from(data! as Map);

List<T> asJsonList<T>(Object? data, T Function(Map<String, dynamic>) fromJson) =>
    (data! as List).map((e) => fromJson(Map<String, dynamic>.from(e as Map))).toList();
