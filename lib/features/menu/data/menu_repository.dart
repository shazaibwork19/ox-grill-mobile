import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/enums.dart';
import '../../../core/network/api_client.dart';
import '../../../core/providers.dart';
import '../../cart/domain/cart.dart';
import '../../cart/domain/quote.dart';
import '../domain/menu.dart';

class MenuRepository {
  MenuRepository(this._api);

  final ApiClient _api;

  Future<MenuResponse> menu(String branchId) =>
      _api.get('/menu', query: {'branchId': branchId}, decode: (d) => MenuResponse.fromJson(asJsonMap(d)));

  Future<MenuItemDetail> item(String idOrSlug, String branchId) => _api.get(
    '/menu/items/${Uri.encodeComponent(idOrSlug)}',
    query: {'branchId': branchId},
    decode: (d) => MenuItemDetail.fromJson(asJsonMap(d)),
  );

  /// `POST /menu/quote`. Read-only on the server: prices a cart without saving anything.
  Future<Quote> quote({
    required String branchId,
    required OrderType orderType,
    PaymentMethod? paymentMethod,
    required List<CartLine> lines,
  }) async {
    final response = await _api.post(
      '/menu/quote',
      body: {
        'branchId': branchId,
        'orderType': orderType.wire,
        'paymentMethod': ?paymentMethod?.wire,
        'items': [for (final l in lines) l.toCartItemInput()],
      },
      decode: (d) => Quote.fromJson(asJsonMap(d)),
    );
    return response.data;
  }
}

final menuRepositoryProvider = Provider((ref) => MenuRepository(ref.watch(apiClientProvider)));

final menuProvider = FutureProvider.family<MenuResponse, String>(
  (ref, branchId) => ref.watch(menuRepositoryProvider).menu(branchId),
);

final menuItemDetailProvider = FutureProvider.autoDispose
    .family<MenuItemDetail, ({String itemId, String branchId})>(
      (ref, arg) => ref.watch(menuRepositoryProvider).item(arg.itemId, arg.branchId),
    );
