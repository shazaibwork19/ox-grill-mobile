import 'package:flutter/material.dart';

import '../../../core/theme/tokens.dart';
import '../people/staff_page.dart';
import 'admins_page.dart';
import 'audit_page.dart';
import 'branches_admin.dart';
import 'customers_page.dart';
import 'menu_admin.dart';
import 'settings_page.dart';

/// Owner back office (everything under `/admin/*`).
class AdminHubPage extends StatelessWidget {
  const AdminHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = <(IconData, String, String, WidgetBuilder)>[
      (
        Icons.storefront_outlined,
        'Branches',
        'Add, edit, hours, deactivate',
        (_) => const BranchesAdminPage(),
      ),
      (Icons.category_outlined, 'Menu categories', 'Order and visibility', (_) => const CategoriesPage()),
      (
        Icons.restaurant_menu_rounded,
        'Menu items',
        'Base prices, options, photos',
        (_) => const MenuItemsPage(),
      ),
      (
        Icons.badge_outlined,
        'All staff',
        'Every branch, managers included',
        (_) => const StaffPage(admin: true),
      ),
      (
        Icons.admin_panel_settings_outlined,
        'Owner logins',
        'Super admin accounts',
        (_) => const AdminsPage(),
      ),
      (
        Icons.people_outline_rounded,
        'Customers',
        'Order history, disable accounts',
        (_) => const CustomersPage(),
      ),
      (
        Icons.toggle_on_outlined,
        'Settings & features',
        'Feature flags and system settings',
        (_) => const SettingsPage(),
      ),
      (Icons.history_rounded, 'Audit log', 'Who changed what', (_) => const AuditPage()),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Admin')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: Space.x2),
        children: [
          for (final (icon, title, subtitle, builder) in entries)
            ListTile(
              leading: Icon(icon),
              title: Text(title),
              subtitle: Text(subtitle),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: builder)),
            ),
        ],
      ),
    );
  }
}
