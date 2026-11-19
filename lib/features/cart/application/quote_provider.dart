import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/enums.dart';
import '../../bootstrap/data/config_repository.dart';
import '../../branches/application/order_session.dart';
import '../../menu/data/menu_repository.dart';
import '../domain/quote.dart';
import 'cart_controller.dart';

/// Payment methods the server allows for the current order type (from `/config`).
final allowedPaymentMethodsProvider = Provider<List<PaymentMethod>>((ref) {
  final type = ref.watch(orderSessionProvider.select((s) => s?.orderType));
  final config = ref.watch(clientConfigProvider).value;
  if (type == null || config == null) return const [];
  return config.paymentMethodsFor(type);
});

/// The customer's explicit pick, if any.
class PaymentChoice extends Notifier<PaymentMethod?> {
  @override
  PaymentMethod? build() => null;

  void choose(PaymentMethod method) => state = method;
}

final paymentChoiceProvider = NotifierProvider<PaymentChoice, PaymentMethod?>(PaymentChoice.new);

/// The method used for quoting and checkout: the customer's pick when the
/// current order type allows it, otherwise the first allowed method.
final selectedPaymentMethodProvider = Provider<PaymentMethod?>((ref) {
  final allowed = ref.watch(allowedPaymentMethodsProvider);
  final choice = ref.watch(paymentChoiceProvider);
  if (choice != null && allowed.contains(choice)) return choice;
  return allowed.isEmpty ? null : allowed.first;
});

/// Server totals for the cart. Re-runs (debounced) whenever the cart, branch,
/// order type or payment method changes. While a new quote loads, the
/// previous one stays available as `value`.
final quoteProvider = FutureProvider<Quote?>((ref) async {
  final session = ref.watch(orderSessionProvider);
  final lines = ref.watch(cartProvider);
  final method = ref.watch(selectedPaymentMethodProvider);
  if (session == null || lines.isEmpty) return null;

  final debounce = ref.read(quoteDebounceProvider);
  if (debounce > Duration.zero) await Future<void>.delayed(debounce);
  if (!ref.mounted) throw const _Superseded();

  return ref
      .read(menuRepositoryProvider)
      .quote(branchId: session.branchId, orderType: session.orderType, paymentMethod: method, lines: lines);
}, retry: (_, _) => null);

/// Wait after the last cart change before asking for a quote. Zero in tests.
final quoteDebounceProvider = Provider<Duration>((ref) => const Duration(milliseconds: 350));

class _Superseded implements Exception {
  const _Superseded();
}
