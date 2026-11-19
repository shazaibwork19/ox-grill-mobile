import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:ox_grill/core/network/api_client.dart';

/// Reads `test/fixtures/<name>` as decoded JSON.
Map<String, dynamic> fixture(String name) =>
    jsonDecode(File('test/fixtures/$name').readAsStringSync()) as Map<String, dynamic>;

/// The `data` field of a success-envelope fixture.
Map<String, dynamic> fixtureData(String name) => fixture(name)['data'] as Map<String, dynamic>;

class FakeReply {
  const FakeReply(this.status, this.body, {this.headers = const {}});

  factory FakeReply.fixture(String name, {int status = 200, Map<String, List<String>> headers = const {}}) =>
      FakeReply(status, fixture(name), headers: headers);

  final int status;
  final Object? body;
  final Map<String, List<String>> headers;
}

/// A recorded request, for assertions.
class SeenRequest {
  SeenRequest(this.options);

  final RequestOptions options;

  String get method => options.method;
  String get path => options.uri.path;
  Map<String, dynamic> get headers => options.headers;
  Object? get body => options.data;
}

typedef Responder = Future<FakeReply> Function(RequestOptions options);

/// HTTP adapter that answers from a handler instead of the network.
class FakeAdapter implements HttpClientAdapter {
  FakeAdapter(this.responder);

  Responder responder;
  final requests = <SeenRequest>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(SeenRequest(options));
    final reply = await responder(options);
    return ResponseBody.fromString(
      jsonEncode(reply.body),
      reply.status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
        ...reply.headers,
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

/// A real [ApiClient] (same envelope handling and error mapping) on a fake adapter.
(ApiClient, FakeAdapter) fakeApi(Responder responder) {
  final client = ApiClient.create(baseUrl: 'https://api.test/api/v1');
  final adapter = FakeAdapter(responder);
  client.dio.httpClientAdapter = adapter;
  // Dio decodes large bodies in an isolate, which never finishes under the
  // widget tester's fake clock.
  client.dio.transformer = FusedTransformer(contentLengthIsolateThreshold: -1);
  // Keep test output quiet; the redacting logger is debug-only behaviour.
  client.dio.interceptors.clear();
  return (client, adapter);
}

/// Routes GET/POST paths (relative to /api/v1) to fixtures.
Responder fixtureRoutes(Map<String, FakeReply Function(RequestOptions o)> routes) {
  return (o) async {
    final path = o.uri.path.replaceFirst('/api/v1', '');
    final key = '${o.method} $path';
    final handler = routes[key];
    if (handler == null) {
      return const FakeReply(404, {
        'success': false,
        'error': {'code': 'NOT_FOUND', 'message': 'No fake route'},
      });
    }
    return handler(o);
  };
}

/// Simulates a dropped connection.
Never throwConnectionError(RequestOptions o) =>
    throw DioException.connectionError(requestOptions: o, reason: 'offline (test)');
