import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/providers.dart';
import '../../branches/application/order_session.dart';
import '../domain/cart.dart';

/// Reads and writes one cart per branch in shared preferences.
class CartStorage {
  CartStorage(this._prefs);

  final SharedPreferences _prefs;

  static String _key(String branchId) => 'cart.v1.$branchId';

  List<CartLine> load(String branchId) {
    final raw = _prefs.getString(_key(branchId));
    if (raw == null) return const [];
    try {
      return [
        for (final e in jsonDecode(raw) as List) CartLine.fromJson(Map<String, dynamic>.from(e as Map)),
      ];
    } catch (_) {
      // A cart written by an older app version that no longer parses is dropped.
      unawaited(_prefs.remove(_key(branchId)));
      return const [];
    }
  }

  Future<void> save(String branchId, List<CartLine> lines) {
    if (lines.isEmpty) return _prefs.remove(_key(branchId));
    return _prefs.setString(_key(branchId), jsonEncode([for (final l in lines) l.toJson()]));
  }
}

final cartStorageProvider = Provider((ref) => CartStorage(ref.watch(sharedPreferencesProvider)));

/// The cart for the currently selected branch. Switching branch swaps carts.
class CartController extends Notifier<List<CartLine>> {
  String? _branchId;

  @override
  List<CartLine> build() {
    _branchId = ref.watch(orderSessionProvider.select((s) => s?.branchId));
    final id = _branchId;
    if (id == null) return const [];
    return ref.read(cartStorageProvider).load(id);
  }

  void _commit(List<CartLine> next) {
    state = next;
    final id = _branchId;
    if (id != null) unawaited(ref.read(cartStorageProvider).save(id, next));
  }

  void add(CartLine line) => _commit(state.addLine(line));

  void replace(String lineId, CartLine line) => _commit(state.replaceLine(lineId, line));

  void setQuantity(String lineId, int quantity) => _commit(state.setQuantity(lineId, quantity));

  void remove(String lineId) => _commit(state.removeLine(lineId));

  void removeWhere(bool Function(CartLine line) test) => _commit(state.where((l) => !test(l)).toList());

  void clear() => _commit(const []);

  /// Copies [lines] from another branch's cart into this one (merging duplicates)
  /// and empties the source cart.
  Future<void> importFrom(String fromBranchId, List<CartLine> lines) async {
    var next = state;
    for (final l in lines) {
      next = next.addLine(l);
    }
    _commit(next);
    await ref.read(cartStorageProvider).save(fromBranchId, const []);
  }
}

final cartProvider = NotifierProvider<CartController, List<CartLine>>(CartController.new);
