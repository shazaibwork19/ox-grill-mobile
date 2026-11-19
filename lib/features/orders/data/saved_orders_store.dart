import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/providers.dart';

/// An order placed from this phone. The tracking token is the only way a
/// guest can reopen it, and anyone holding it can see the order, so the list
/// lives in secure storage and is never logged.
class SavedOrder {
  const SavedOrder({
    required this.token,
    required this.orderNumber,
    required this.branchName,
    required this.placedAt,
  });

  factory SavedOrder.fromJson(Map<String, dynamic> json) => SavedOrder(
    token: json['token'] as String,
    orderNumber: json['orderNumber'] as String,
    branchName: json['branchName'] as String,
    placedAt: DateTime.parse(json['placedAt'] as String),
  );

  final String token;
  final String orderNumber;
  final String branchName;
  final DateTime placedAt;

  Map<String, Object?> toJson() => {
    'token': token,
    'orderNumber': orderNumber,
    'branchName': branchName,
    'placedAt': placedAt.toUtc().toIso8601String(),
  };

  @override
  String toString() => 'SavedOrder($orderNumber)';
}

abstract interface class SavedOrdersStorage {
  Future<String?> read();
  Future<void> write(String value);
}

class SecureSavedOrdersStorage implements SavedOrdersStorage {
  SecureSavedOrdersStorage(this._storage);

  static const _key = 'orders.saved.v1';
  final FlutterSecureStorage _storage;

  @override
  Future<String?> read() => _storage.read(key: _key);

  @override
  Future<void> write(String value) => _storage.write(key: _key, value: value);
}

final savedOrdersStorageProvider = Provider<SavedOrdersStorage>(
  (ref) => SecureSavedOrdersStorage(ref.watch(secureStorageProvider)),
);

/// Saved orders, newest first, at most [maxSaved].
class SavedOrdersController extends AsyncNotifier<List<SavedOrder>> {
  static const maxSaved = 20;

  @override
  Future<List<SavedOrder>> build() async {
    final raw = await ref.watch(savedOrdersStorageProvider).read();
    if (raw == null) return const [];
    try {
      final list = [
        for (final e in jsonDecode(raw) as List) SavedOrder.fromJson(Map<String, dynamic>.from(e as Map)),
      ]..sort((a, b) => b.placedAt.compareTo(a.placedAt));
      return list;
    } catch (_) {
      return const [];
    }
  }

  Future<void> add(SavedOrder order) async {
    final current = await future;
    final next = [order, ...current.where((o) => o.token != order.token)].take(maxSaved).toList();
    await _save(next);
  }

  Future<void> remove(String token) async {
    final current = await future;
    await _save(current.where((o) => o.token != token).toList());
  }

  Future<void> _save(List<SavedOrder> next) async {
    state = AsyncData(next);
    await ref.read(savedOrdersStorageProvider).write(jsonEncode([for (final o in next) o.toJson()]));
  }
}

final savedOrdersProvider = AsyncNotifierProvider<SavedOrdersController, List<SavedOrder>>(
  SavedOrdersController.new,
);
