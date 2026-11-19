import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/enums.dart';
import '../../../core/providers.dart';
import '../data/branch_repository.dart';
import '../domain/branch.dart';

/// The customer's chosen branch and fulfilment type. Remembered across launches.
class OrderSession {
  const OrderSession({required this.branchId, required this.branchName, required this.orderType});

  final String branchId;

  /// Snapshot for the header while branches load.
  final String branchName;
  final OrderType orderType;

  Map<String, Object?> toJson() => {
    'branchId': branchId,
    'branchName': branchName,
    'orderType': orderType.wire,
  };

  static OrderSession? tryParse(String? raw) {
    if (raw == null) return null;
    try {
      final m = jsonDecode(raw) as Map<String, dynamic>;
      final type = OrderType.fromWire(m['orderType'] as String?);
      if (type == OrderType.unknown) return null;
      return OrderSession(
        branchId: m['branchId'] as String,
        branchName: m['branchName'] as String? ?? '',
        orderType: type,
      );
    } catch (_) {
      return null;
    }
  }
}

class OrderSessionController extends Notifier<OrderSession?> {
  static const _key = 'session.v1';

  @override
  OrderSession? build() => OrderSession.tryParse(ref.watch(sharedPreferencesProvider).getString(_key));

  Future<void> select(BranchSummary branch, OrderType type) async {
    final next = OrderSession(branchId: branch.id, branchName: branch.name, orderType: type);
    state = next;
    await ref.read(sharedPreferencesProvider).setString(_key, jsonEncode(next.toJson()));
  }

  Future<void> setOrderType(OrderType type) async {
    final current = state;
    if (current == null || current.orderType == type) return;
    final next = OrderSession(branchId: current.branchId, branchName: current.branchName, orderType: type);
    state = next;
    await ref.read(sharedPreferencesProvider).setString(_key, jsonEncode(next.toJson()));
  }
}

final orderSessionProvider = NotifierProvider<OrderSessionController, OrderSession?>(
  OrderSessionController.new,
);

/// The live summary of the selected branch (status, services, fees), or null
/// while loading or when the remembered branch no longer exists.
final selectedBranchProvider = Provider<AsyncValue<BranchSummary?>>((ref) {
  final session = ref.watch(orderSessionProvider);
  if (session == null) return const AsyncData(null);
  return ref.watch(branchesProvider).whenData((list) {
    for (final b in list) {
      if (b.id == session.branchId) return b;
    }
    return null;
  });
});
