import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/domain/enums.dart';
import '../../core/network/api_client.dart';
import '../../features/orders/domain/order.dart';
import '../core/session.dart';
import '../domain/admin_models.dart';
import '../domain/ops_models.dart';

String _b(String branchId) => '/branches/${Uri.encodeComponent(branchId)}';

/// Orders, payments, kitchen, deliveries, menu availability and branch
/// settings: the day-to-day operations of a branch.
class OpsRepository {
  OpsRepository(this._api);

  final ApiClient _api;

  // ---- Orders ----

  /// Statuses still in progress, for the live board.
  static const activeStatuses = [
    OrderStatus.pending,
    OrderStatus.confirmed,
    OrderStatus.preparing,
    OrderStatus.ready,
    OrderStatus.outForDelivery,
    OrderStatus.delivered,
  ];

  /// `GET /branches/{b}/orders`, or `GET /admin/orders` across branches when
  /// [branchId] is null (owner only).
  Future<Paged<OrderSummary>> orders({
    String? branchId,
    List<OrderStatus>? statuses,
    OrderType? type,
    String? query,
    String? from,
    String? to,
    int page = 1,
    int pageSize = 30,
  }) {
    final q = <String, Object?>{
      'page': page,
      'pageSize': pageSize,
      if (statuses != null && statuses.isNotEmpty) 'status': statuses.map((s) => s.wire).join(','),
      'type': type?.wire,
      'q': query,
      'from': from,
      'to': to,
    };
    return branchId == null
        ? _api.getPage('/admin/orders', query: q, item: OrderSummary.fromJson)
        : _api.getPage('${_b(branchId)}/orders', query: q, item: OrderSummary.fromJson);
  }

  Future<Order> order(String branchId, String orderId) => _api.get(
    '${_b(branchId)}/orders/${Uri.encodeComponent(orderId)}',
    decode: (d) => Order.fromJson(asJsonMap(d)),
  );

  Future<Order> setStatus(String branchId, String orderId, OrderStatus status, {String? reason}) async {
    final r = await _api.patch(
      '${_b(branchId)}/orders/$orderId/status',
      body: {'status': status.wire, if (reason != null && reason.trim().isNotEmpty) 'reason': reason.trim()},
      decode: (d) => Order.fromJson(asJsonMap(d)),
    );
    return r.data;
  }

  Future<List<Rider>> riders(String branchId) =>
      _api.get('${_b(branchId)}/riders', decode: (d) => asJsonList(d, Rider.fromJson));

  Future<Order> assignRider(String branchId, String orderId, String riderId) async {
    final r = await _api.post(
      '${_b(branchId)}/orders/$orderId/assign-rider',
      body: {'riderId': riderId},
      decode: (d) => Order.fromJson(asJsonMap(d)),
    );
    return r.data;
  }

  /// Records cash / card-at-counter / COD as received.
  Future<Payment> collectPayment(
    String branchId,
    String orderId, {
    PaymentMethod? method,
    int? amountTendered,
    String? reference,
  }) async {
    final r = await _api.post(
      '${_b(branchId)}/orders/$orderId/payments/collect',
      body: {'method': ?method?.wire, 'amountTendered': ?amountTendered, 'reference': ?reference},
      decode: (d) => Payment.fromJson(asJsonMap(d)),
    );
    return r.data;
  }

  /// Full refund when [amount] is null.
  Future<Payment> refund(String branchId, String orderId, {int? amount, required String reason}) async {
    final r = await _api.post(
      '${_b(branchId)}/orders/$orderId/refund',
      body: {'amount': ?amount, 'reason': reason},
      decode: (d) => Payment.fromJson(asJsonMap(d)),
    );
    return r.data;
  }

  Future<Receipt> receipt(String branchId, String orderId) =>
      _api.get('${_b(branchId)}/orders/$orderId/receipt', decode: (d) => Receipt.fromJson(asJsonMap(d)));

  /// Counter (POS) order. Needs an `Idempotency-Key` like customer checkout.
  Future<ApiResponse<CreateOrderResult>> createPosOrder(
    String branchId, {
    required Map<String, Object?> body,
    required String idempotencyKey,
  }) => _api.post(
    '${_b(branchId)}/orders',
    body: body,
    headers: {'Idempotency-Key': idempotencyKey},
    decode: (d) => CreateOrderResult.fromJson(asJsonMap(d)),
  );

  // ---- Kitchen ----

  Future<List<KitchenTicket>> kitchenQueue(String branchId) =>
      _api.get('${_b(branchId)}/kitchen/queue', decode: (d) => asJsonList(d, KitchenTicket.fromJson));

  Future<KitchenTicket> startPreparing(String branchId, String orderId) async => (await _api.patch(
    '${_b(branchId)}/kitchen/orders/$orderId/preparing',
    decode: (d) => KitchenTicket.fromJson(asJsonMap(d)),
  )).data;

  Future<KitchenTicket> markReady(String branchId, String orderId) async => (await _api.patch(
    '${_b(branchId)}/kitchen/orders/$orderId/ready',
    decode: (d) => KitchenTicket.fromJson(asJsonMap(d)),
  )).data;

  // ---- Rider ----

  Future<List<DeliveryAssignment>> myAssignments() =>
      _api.get('/delivery/assignments/me', decode: (d) => asJsonList(d, DeliveryAssignment.fromJson));

  Future<DeliveryAssignment> assignmentAction(String id, String action, {Map<String, Object?>? body}) async =>
      (await _api.patch(
        '/delivery/assignments/${Uri.encodeComponent(id)}/$action',
        body: body,
        decode: (d) => DeliveryAssignment.fromJson(asJsonMap(d)),
      )).data;

  // ---- Branch ----

  Future<BranchAdmin> settings(String branchId) =>
      _api.get('${_b(branchId)}/settings', decode: (d) => BranchAdmin.fromJson(asJsonMap(d)));

  Future<BranchAdmin> updateSettings(String branchId, Map<String, Object?> patch) async => (await _api.patch(
    '${_b(branchId)}/settings',
    body: patch,
    decode: (d) => BranchAdmin.fromJson(asJsonMap(d)),
  )).data;

  Future<Dashboard> dashboard(String? branchId) => branchId == null
      ? _api.get('/admin/dashboard', decode: (d) => Dashboard.fromJson(asJsonMap(d)))
      : _api.get('${_b(branchId)}/dashboard', decode: (d) => Dashboard.fromJson(asJsonMap(d)));

  Future<List<BranchMenuItem>> menuAvailability(String branchId, {String? query}) => _api.get(
    '${_b(branchId)}/menu-availability',
    query: {'q': query},
    decode: (d) => asJsonList(d, BranchMenuItem.fromJson),
  );

  /// `priceOverride: null` and `stockQuantity: null` clear the value, so
  /// keys are only sent when present in [patch].
  Future<BranchMenuItem> updateAvailability(
    String branchId,
    String menuItemId,
    Map<String, Object?> patch,
  ) async => (await _api.patch(
    '${_b(branchId)}/menu-availability/${Uri.encodeComponent(menuItemId)}',
    body: patch,
    decode: (d) => BranchMenuItem.fromJson(asJsonMap(d)),
  )).data;
}

final opsRepositoryProvider = Provider((ref) => OpsRepository(ref.watch(staffApiProvider)));
