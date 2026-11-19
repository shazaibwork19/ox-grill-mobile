import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

/// One field-level problem from the API's `error.details[]`.
class FieldIssue {
  const FieldIssue({required this.path, required this.message, this.code});

  /// Dotted path into the request body, e.g. `contactPhone` or `items.0.quantity`.
  final String path;
  final String message;
  final String? code;
}

/// Every error the UI can see. Screens switch on the type and on [ApiFailure.code];
/// raw exceptions and stack traces never reach the user.
sealed class AppFailure implements Exception {
  const AppFailure();

  /// Short sentence that is safe to show to a customer.
  String get userMessage;

  /// Converts anything thrown by the network layer into an [AppFailure].
  static AppFailure from(Object error) {
    if (error is AppFailure) return error;
    if (error is DioException) return _fromDio(error);
    if (error is SocketException) return const NetworkFailure();
    if (error is TimeoutException) return const NetworkFailure(timedOut: true);
    return UnexpectedFailure(error);
  }

  static AppFailure _fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return const NetworkFailure(timedOut: true);
      case DioExceptionType.connectionError:
        return const NetworkFailure();
      case DioExceptionType.badCertificate:
        return const NetworkFailure(badCertificate: true);
      case DioExceptionType.cancel:
        return const CancelledFailure();
      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
        final response = e.response;
        if (response == null) {
          return e.error is SocketException ? const NetworkFailure() : UnexpectedFailure(e.error ?? e);
        }
        return ApiFailure.fromResponse(response.statusCode ?? 0, response.data, response.headers);
    }
  }
}

/// The request may not have reached the server, or the reply was lost.
/// For `POST /orders` this means "outcome unknown": retry with the same key.
class NetworkFailure extends AppFailure {
  const NetworkFailure({this.timedOut = false, this.badCertificate = false});

  final bool timedOut;
  final bool badCertificate;

  @override
  String get userMessage => badCertificate
      ? 'The connection to Ox & Grill could not be verified.'
      : timedOut
      ? 'The connection timed out.'
      : 'You appear to be offline.';
}

class CancelledFailure extends AppFailure {
  const CancelledFailure();

  @override
  String get userMessage => 'The request was cancelled.';
}

/// A non-2xx reply in the API's error envelope.
class ApiFailure extends AppFailure {
  const ApiFailure({
    required this.statusCode,
    required this.code,
    required this.message,
    this.details = const [],
    this.requestId,
  });

  factory ApiFailure.fromResponse(int statusCode, Object? body, Headers? headers) {
    String code = _fallbackCode(statusCode);
    String message = _fallbackMessage(statusCode);
    final details = <FieldIssue>[];
    String? requestId = headers?.value('x-request-id');

    if (body is Map) {
      final error = body['error'];
      if (error is Map) {
        if (error['code'] is String) code = error['code'] as String;
        if (error['message'] is String) message = error['message'] as String;
        final rawDetails = error['details'];
        if (rawDetails is List) {
          for (final d in rawDetails) {
            if (d is Map && d['path'] is String) {
              details.add(
                FieldIssue(
                  path: d['path'] as String,
                  message: d['message'] is String ? d['message'] as String : 'Invalid value',
                  code: d['code'] is String ? d['code'] as String : null,
                ),
              );
            }
          }
        }
      }
      if (body['requestId'] is String) requestId = body['requestId'] as String;
    }
    return ApiFailure(
      statusCode: statusCode,
      code: code,
      message: message,
      details: details,
      requestId: requestId,
    );
  }

  final int statusCode;

  /// Stable machine code, e.g. `ITEM_UNAVAILABLE`. Branch on this, never on [message].
  final String code;

  /// Server-written, customer-safe explanation.
  final String message;
  final List<FieldIssue> details;
  final String? requestId;

  bool get isServerError => statusCode >= 500;
  bool get isNotFound => statusCode == 404;
  bool get isBusinessRule => statusCode == 422;
  bool get isValidation => statusCode == 400;

  /// Detail messages keyed by path, for inline form errors.
  Map<String, String> get fieldErrors => {for (final d in details) d.path: d.message};

  @override
  String get userMessage {
    if (isServerError) return 'Something went wrong on our side. Please try again in a moment.';
    if (statusCode == 429) return 'Too many attempts. Please wait a moment and try again.';
    return message;
  }

  static String _fallbackCode(int status) => switch (status) {
    400 => 'VALIDATION_ERROR',
    401 => 'UNAUTHENTICATED',
    403 => 'FORBIDDEN',
    404 => 'NOT_FOUND',
    409 => 'CONFLICT',
    429 => 'RATE_LIMITED',
    _ when status >= 500 => 'INTERNAL_ERROR',
    _ => 'UNKNOWN',
  };

  static String _fallbackMessage(int status) => switch (status) {
    404 => 'Not found.',
    _ when status >= 500 => 'Server error.',
    _ => 'The request could not be completed.',
  };

  @override
  String toString() => 'ApiFailure($statusCode $code: $message, requestId: $requestId)';
}

/// The app itself refuses the action (e.g. a customer account in the staff app).
class AccessFailure extends AppFailure {
  const AccessFailure(this.userMessage);

  @override
  final String userMessage;
}

/// The reply was a 2xx but did not match the documented shape.
class UnexpectedFailure extends AppFailure {
  const UnexpectedFailure(this.cause);

  final Object cause;

  @override
  String get userMessage => 'Something unexpected happened. Please try again.';

  @override
  String toString() => 'UnexpectedFailure($cause)';
}
