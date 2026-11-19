import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/enums.dart';
import '../../../core/errors/app_failure.dart';
import '../../../core/format/phone.dart';
import '../../../core/network/api_client.dart';
import '../../../core/providers.dart';
import '../../branches/application/order_session.dart';
import '../../cart/application/cart_controller.dart';
import '../../cart/domain/cart.dart';
import '../../orders/data/order_repository.dart';
import '../../orders/data/saved_orders_store.dart';
import '../../orders/domain/order.dart';
import '../data/customer_details_store.dart';
import 'idempotency.dart';

/// What the customer typed on the checkout form.
class CheckoutForm {
  const CheckoutForm({
    required this.name,
    required this.phone,
    this.addressLine = '',
    this.area = '',
    this.city = '',
    this.instructions = '',
    this.pickupName = '',
    this.tableRef = '',
    this.notes = '',
  });

  final String name;
  final String phone;
  final String addressLine;
  final String area;
  final String city;
  final String instructions;
  final String pickupName;
  final String tableRef;
  final String notes;
}

/// Builds the `CreateOrder` body. Contains no prices: the server prices everything.
Map<String, Object?> buildCreateOrderBody({
  required String branchId,
  required OrderType orderType,
  required PaymentMethod paymentMethod,
  required List<CartLine> lines,
  required CheckoutForm form,
}) {
  String? opt(String v) => v.trim().isEmpty ? null : v.trim();
  return {
    'branchId': branchId,
    'orderType': orderType.wire,
    'paymentMethod': paymentMethod.wire,
    'items': [for (final l in lines) l.toCartItemInput()],
    'contactName': form.name.trim(),
    'contactPhone': normalizePhoneInput(form.phone),
    if (orderType == OrderType.delivery)
      'delivery': {
        'addressLine': form.addressLine.trim(),
        'area': ?opt(form.area),
        'city': ?opt(form.city),
        'instructions': ?opt(form.instructions),
      },
    if (orderType == OrderType.pickup) 'pickupName': ?opt(form.pickupName),
    if (orderType == OrderType.dineIn) 'tableRef': ?opt(form.tableRef),
    'notes': ?opt(form.notes),
    'source': 'MOBILE',
  };
}

sealed class CheckoutState {
  const CheckoutState();
}

class CheckoutIdle extends CheckoutState {
  const CheckoutIdle();
}

class CheckoutSubmitting extends CheckoutState {
  const CheckoutSubmitting({this.retrying = false});

  final bool retrying;
}

class CheckoutPlaced extends CheckoutState {
  const CheckoutPlaced(this.result, {required this.replayed});

  final CreateOrderResult result;

  /// The server returned an order created by an earlier attempt with the same key.
  final bool replayed;
}

class CheckoutFailed extends CheckoutState {
  const CheckoutFailed(this.failure);

  final AppFailure failure;

  /// Network failure or timeout: the order may or may not exist. Retrying
  /// with the same key is safe and settles it.
  bool get outcomeUnknown =>
      failure is NetworkFailure || (failure is ApiFailure && (failure as ApiFailure).isServerError);
}

class CheckoutController extends Notifier<CheckoutState> {
  @override
  CheckoutState build() => const CheckoutIdle();

  IdempotencyKeys get _keys => IdempotencyKeys(ref.read(sharedPreferencesProvider));

  /// Places the order. Ignored while a submit is already running, so a
  /// double tap cannot send two requests.
  Future<void> submit({required PaymentMethod paymentMethod, required CheckoutForm form}) async {
    if (state is CheckoutSubmitting) return;
    final session = ref.read(orderSessionProvider);
    final lines = ref.read(cartProvider);
    if (session == null || lines.isEmpty) return;

    final body = buildCreateOrderBody(
      branchId: session.branchId,
      orderType: session.orderType,
      paymentMethod: paymentMethod,
      lines: lines,
      form: form,
    );
    state = CheckoutSubmitting(retrying: _keys.hasPendingAttempt);
    final key = await _keys.keyFor(body);

    try {
      final response = await _placeWithInProgressRetry(body, key);
      final result = response.data;
      await _keys.complete();
      await _afterPlaced(result, session.branchName, form);
      state = CheckoutPlaced(result, replayed: response.idempotentReplayed);
    } on AppFailure catch (failure) {
      state = CheckoutFailed(failure);
    } catch (e) {
      state = CheckoutFailed(AppFailure.from(e));
    }
  }

  /// `409 IDEMPOTENCY_IN_PROGRESS` means the first attempt with this key is
  /// still being processed: wait briefly and ask again with the same key.
  Future<ApiResponse<CreateOrderResult>> _placeWithInProgressRetry(
    Map<String, Object?> body,
    String key,
  ) async {
    final repo = ref.read(orderRepositoryProvider);
    for (var attempt = 0; ; attempt++) {
      try {
        return await repo.placeOrder(body: body, idempotencyKey: key);
      } on ApiFailure catch (e) {
        if (e.code != 'IDEMPOTENCY_IN_PROGRESS' || attempt >= 3) rethrow;
        await Future<void>.delayed(Duration(seconds: 2 * (attempt + 1)));
      }
    }
  }

  Future<void> _afterPlaced(CreateOrderResult result, String branchName, CheckoutForm form) async {
    final token = result.trackingToken;
    if (token != null) {
      await ref
          .read(savedOrdersProvider.notifier)
          .add(
            SavedOrder(
              token: token,
              orderNumber: result.order.orderNumber,
              branchName: result.order.branchName.isEmpty ? branchName : result.order.branchName,
              placedAt: result.order.placedAt,
            ),
          );
    }
    ref.read(cartProvider.notifier).clear();
    unawaited(
      ref
          .read(customerDetailsStoreProvider)
          .save(
            CustomerDetails(
              name: form.name.trim(),
              phone: normalizePhoneInput(form.phone),
              addressLine: form.addressLine.trim(),
              area: form.area.trim(),
              city: form.city.trim(),
              instructions: form.instructions.trim(),
            ),
          ),
    );
  }

  void reset() => state = const CheckoutIdle();
}

final checkoutControllerProvider = NotifierProvider<CheckoutController, CheckoutState>(
  CheckoutController.new,
);
