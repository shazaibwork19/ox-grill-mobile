import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/tokens.dart';
import '../../features/bootstrap/data/config_repository.dart';
import '../core/permissions.dart';
import '../core/session.dart';
import '../core/staff_socket.dart';
import '../features/account/account_page.dart';
import '../features/admin/admin_hub_page.dart';
import '../features/branch/branch_settings_page.dart';
import '../features/dashboard/dashboard_page.dart';
import '../features/frontdesk/frontdesk_page.dart';
import '../features/kitchen/kitchen_page.dart';
import '../features/menu/availability_page.dart';
import '../features/orders/orders_page.dart';
import '../features/people/shifts_page.dart';
import '../features/people/staff_page.dart';
import '../features/reports/reports_page.dart';
import '../features/rider/deliveries_page.dart';

/// One screen reachable from the main navigation or the "More" list.
class StaffDestination {
  const StaffDestination(this.id, this.label, this.icon, this.builder, {this.description});

  final String id;
  final String label;
  final IconData icon;
  final WidgetBuilder builder;
  final String? description;
}

/// Everything the signed-in role may open, in navigation order. The first
/// four (or all, if five or fewer) go in the bottom bar; the rest under "More".
List<StaffDestination> destinationsFor(StaffSession s, {required bool reservations, required bool waitlist}) {
  final role = s.role;
  final frontDesk =
      (s.can(Capability.reservations) && reservations) || (s.can(Capability.waitlist) && waitlist);
  final all = <StaffDestination>[
    if (s.can(Capability.deliveries))
      StaffDestination(
        'deliveries',
        'Deliveries',
        Icons.delivery_dining_rounded,
        (_) => const DeliveriesPage(),
      ),
    if (role == StaffRole.kitchen)
      StaffDestination('kitchen', 'Kitchen', Icons.soup_kitchen_outlined, (_) => const KitchenPage()),
    if (s.can(Capability.dashboard))
      StaffDestination('home', 'Today', Icons.space_dashboard_outlined, (_) => const DashboardPage()),
    if (s.can(Capability.orders))
      StaffDestination('orders', 'Orders', Icons.receipt_long_outlined, (_) => const OrdersPage()),
    if (role == StaffRole.manager)
      StaffDestination('kitchen', 'Kitchen', Icons.soup_kitchen_outlined, (_) => const KitchenPage()),
    if (role == StaffRole.owner)
      StaffDestination('reports', 'Reports', Icons.insights_outlined, (_) => const ReportsPage()),
    if (role == StaffRole.owner)
      StaffDestination('admin', 'Admin', Icons.admin_panel_settings_outlined, (_) => const AdminHubPage()),
    if (role == StaffRole.cashier && frontDesk)
      StaffDestination('frontdesk', 'Front desk', Icons.event_seat_outlined, (_) => const FrontDeskPage()),
    if (s.can(Capability.menuAvailability))
      StaffDestination(
        'menu',
        'Menu',
        Icons.restaurant_menu_rounded,
        (_) => const AvailabilityPage(),
        description: 'Sold out, branch prices, stock',
      ),
    if (role != StaffRole.cashier && frontDesk)
      StaffDestination(
        'frontdesk',
        'Front desk',
        Icons.event_seat_outlined,
        (_) => const FrontDeskPage(),
        description: 'Reservations and waitlist',
      ),
    if (role == StaffRole.manager)
      StaffDestination(
        'reports',
        'Reports',
        Icons.insights_outlined,
        (_) => const ReportsPage(),
        description: 'Sales, items, forecasts',
      ),
    if (s.can(Capability.shifts))
      StaffDestination(
        'shifts',
        'Shift',
        Icons.point_of_sale_outlined,
        (_) => const ShiftsPage(),
        description: 'Open, close and cash up',
      ),
    if (s.can(Capability.branchStaff) && role != StaffRole.owner)
      StaffDestination(
        'staff',
        'Staff',
        Icons.badge_outlined,
        (_) => const StaffPage(),
        description: 'Team at your branch',
      ),
    if (s.can(Capability.branchSettingsEdit))
      StaffDestination(
        'branch',
        'Branch settings',
        Icons.tune_rounded,
        (_) => const BranchSettingsPage(),
        description: 'Pause orders, services, times',
      ),
    StaffDestination(
      'account',
      'Account',
      Icons.person_outline_rounded,
      (_) => const AccountPage(),
      description: 'Profile, password, sign out',
    ),
  ];
  // Drop duplicates (a role may match two rules for the same screen).
  final seen = <String>{};
  return [
    for (final d in all)
      if (seen.add(d.id)) d,
  ];
}

class StaffShell extends ConsumerStatefulWidget {
  const StaffShell({super.key});

  @override
  ConsumerState<StaffShell> createState() => _StaffShellState();
}

class _StaffShellState extends ConsumerState<StaffShell> {
  int _index = 0;

  void _alert(StaffSession s, StaffEvent e) {
    final text = switch (e.name) {
      StaffEvent.orderCreated when s.can(Capability.orders) => 'New order ${e.orderNumber ?? ''}',
      StaffEvent.kitchenNewOrder when s.can(Capability.kitchen) =>
        'New kitchen ticket ${e.orderNumber ?? ''}',
      StaffEvent.deliveryAssigned when s.can(Capability.deliveries) => 'New delivery ${e.orderNumber ?? ''}',
      _ => null,
    };
    if (text == null || !mounted) return;
    SystemSound.play(SystemSoundType.alert);
    HapticFeedback.heavyImpact();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text.trim()), duration: const Duration(seconds: 6)));
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionProvider).value;
    if (session == null) return const Scaffold();
    final features = ref.watch(clientConfigProvider).value?.features;
    final dests = destinationsFor(
      session,
      reservations: features?.reservations ?? false,
      waitlist: features?.waitlist ?? false,
    );
    ref.listen(staffEventsProvider, (_, next) {
      if (next.value case final e?) _alert(session, e);
    });

    final tablet = Breakpoints.isTablet(context);
    final primary = tablet || dests.length <= 5 ? dests : dests.take(4).toList();
    final overflow = tablet || dests.length <= 5 ? <StaffDestination>[] : dests.skip(4).toList();
    final tabs = [
      ...primary,
      if (overflow.isNotEmpty)
        StaffDestination('more', 'More', Icons.more_horiz_rounded, (_) => MorePage(items: overflow)),
    ];
    final index = _index.clamp(0, tabs.length - 1);

    final body = IndexedStack(
      index: index,
      children: [
        for (final d in tabs)
          KeyedSubtree(
            key: ValueKey(d.id),
            child: Builder(builder: d.builder),
          ),
      ],
    );

    if (tablet) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - 48),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      selectedIndex: index,
                      labelType: NavigationRailLabelType.all,
                      onDestinationSelected: (i) => setState(() => _index = i),
                      destinations: [
                        for (final d in tabs)
                          NavigationRailDestination(icon: Icon(d.icon), label: Text(d.label)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const VerticalDivider(width: 1),
            Expanded(child: body),
          ],
        ),
      );
    }
    return Scaffold(
      body: body,
      bottomNavigationBar: tabs.length < 2
          ? null
          : NavigationBar(
              selectedIndex: index,
              onDestinationSelected: (i) => setState(() => _index = i),
              destinations: [for (final d in tabs) NavigationDestination(icon: Icon(d.icon), label: d.label)],
            ),
    );
  }
}

/// The rest of the role's screens as a list.
class MorePage extends StatelessWidget {
  const MorePage({super.key, required this.items});

  final List<StaffDestination> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: Space.x2),
        children: [
          for (final d in items)
            ListTile(
              leading: Icon(d.icon),
              title: Text(d.label),
              subtitle: d.description == null ? null : Text(d.description!),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: d.builder)),
            ),
        ],
      ),
    );
  }
}
