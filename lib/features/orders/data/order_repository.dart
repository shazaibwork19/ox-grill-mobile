import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../core/providers.dart';
import '../domain/order.dart';

class OrderRepository {
  OrderRepository(this._api);

  final ApiClient _api;

  /// `POST /orders` as a guest (no `Authorization` header).
  ///
  /// [idempotencyKey] must be reused for every retry of the same cart; the
  /// server then returns the original order instead of creating a second one.
  Future<ApiResponse<CreateOrderResult>> placeOrder({
    required Map<String, Object?> body,
    required String idempotencyKey,
  }) => _api.post(
    '/orders',
    body: body,
    headers: {'Idempotency-Key': idempotencyKey},
    decode: (d) => CreateOrderResult.fromJson(asJsonMap(d)),
  );

  /// `GET /orders/track/{token}`: no login, the token is the credential.
  Future<PublicOrderStatus> track(String token) => _api.get(
    '/orders/track/${Uri.encodeComponent(token)}',
    decode: (d) => PublicOrderStatus.fromJson(asJsonMap(d)),
  );
}

final orderRepositoryProvider = Provider((ref) => OrderRepository(ref.watch(apiClientProvider)));
