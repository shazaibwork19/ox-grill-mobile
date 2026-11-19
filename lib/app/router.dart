import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/branches/application/order_session.dart';
import '../features/branches/presentation/branch_info_screen.dart';
import '../features/branches/presentation/branch_select_screen.dart';
import '../features/checkout/presentation/checkout_screen.dart';
import '../features/menu/presentation/item_detail_screen.dart';
import '../features/menu/presentation/menu_screen.dart';
import '../features/orders/presentation/order_status_screen.dart';
import '../features/orders/presentation/orders_list_screen.dart';

/// Route paths in one place.
abstract final class Routes {
  static const root = '/';
  static const branches = '/branches';
  static const menu = '/menu';
  static const checkout = '/checkout';
  static const orders = '/orders';

  static String item(String itemId, {String? editLineId}) => Uri(
    path: '/item/$itemId',
    queryParameters: editLineId == null ? null : {'line': editLineId},
  ).toString();

  static String track(String token) => '/track/${Uri.encodeComponent(token)}';

  static String branchInfo(String branchId) => '/branch/${Uri.encodeComponent(branchId)}';

  static String changeBranch() => '$branches?change=1';
}

/// Customer routes. A staff area would be added as its own route subtree
/// behind a `redirect` that checks the signed-in role.
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.root,
    redirect: (context, state) {
      if (state.matchedLocation == Routes.root) {
        return ref.read(orderSessionProvider) == null ? Routes.branches : Routes.menu;
      }
      return null;
    },
    routes: [
      GoRoute(path: Routes.root, builder: (_, _) => const SizedBox.shrink()),
      GoRoute(
        path: Routes.branches,
        builder: (_, state) => BranchSelectScreen(isChange: state.uri.queryParameters['change'] == '1'),
      ),
      GoRoute(path: Routes.menu, builder: (_, _) => const MenuScreen()),
      GoRoute(
        path: '/item/:itemId',
        builder: (_, state) => ItemDetailScreen(
          itemId: state.pathParameters['itemId']!,
          editLineId: state.uri.queryParameters['line'],
        ),
      ),
      GoRoute(path: Routes.checkout, builder: (_, _) => const CheckoutScreen()),
      GoRoute(path: Routes.orders, builder: (_, _) => const OrdersListScreen()),
      GoRoute(
        path: '/track/:token',
        builder: (_, state) => OrderStatusScreen(token: state.pathParameters['token']!),
      ),
      GoRoute(
        path: '/branch/:branchId',
        builder: (_, state) => BranchInfoScreen(branchId: state.pathParameters['branchId']!),
      ),
    ],
  );
});
