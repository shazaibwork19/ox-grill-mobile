import '../domain/auth_models.dart';

/// Who is signed in, as far as the staff app's screens are concerned.
enum StaffRole {
  owner('Owner'),
  manager('Branch manager'),
  cashier('Cashier'),
  kitchen('Kitchen'),
  rider('Rider');

  const StaffRole(this.label);
  final String label;

  /// `null` for customers, unknown roles and staff who are not active.
  static StaffRole? of(AppUser user) {
    if (user.globalRole == GlobalRole.superAdmin) return owner;
    if (user.globalRole != GlobalRole.staff) return null;
    final profile = user.staffProfile;
    if (profile == null || profile.status != StaffStatus.active) return null;
    return switch (profile.staffRole) {
      StaffRoleWire.branchManager => manager,
      StaffRoleWire.cashier => cashier,
      StaffRoleWire.kitchenStaff => kitchen,
      StaffRoleWire.deliveryAgent => rider,
      StaffRoleWire.unknown => null,
    };
  }

  bool can(Capability c) => c.roles.contains(this);
}

/// Each capability mirrors the `x-roles` / `x-staff-roles` of the endpoints
/// behind it in the OpenAPI document. The server enforces these again; the
/// app uses them only to decide what to show.
enum Capability {
  dashboard({StaffRole.owner, StaffRole.manager, StaffRole.cashier}),
  orders({StaffRole.owner, StaffRole.manager, StaffRole.cashier}),
  refund({StaffRole.owner, StaffRole.manager}),
  pos({StaffRole.owner, StaffRole.manager, StaffRole.cashier}),
  assignRider({StaffRole.owner, StaffRole.manager, StaffRole.cashier}),

  /// Kitchen endpoints are `STAFF` only (not `SUPER_ADMIN`).
  kitchen({StaffRole.manager, StaffRole.kitchen}),
  deliveries({StaffRole.rider}),
  duty({StaffRole.manager, StaffRole.cashier, StaffRole.kitchen, StaffRole.rider}),
  menuAvailability({StaffRole.owner, StaffRole.manager, StaffRole.cashier}),
  branchStaff({StaffRole.owner, StaffRole.manager}),
  shifts({StaffRole.owner, StaffRole.manager, StaffRole.cashier}),
  reservations({StaffRole.owner, StaffRole.manager, StaffRole.cashier}),
  waitlist({StaffRole.owner, StaffRole.manager, StaffRole.cashier}),
  reports({StaffRole.owner, StaffRole.manager}),
  forecasts({StaffRole.owner, StaffRole.manager}),
  branchSettingsEdit({StaffRole.owner, StaffRole.manager}),

  // Owner only (`/admin/*`).
  adminBranches({StaffRole.owner}),
  adminMenu({StaffRole.owner}),
  adminStaff({StaffRole.owner}),
  adminAdmins({StaffRole.owner}),
  adminCustomers({StaffRole.owner}),
  adminSettings({StaffRole.owner}),
  adminAudit({StaffRole.owner}),
  runForecasts({StaffRole.owner});

  const Capability(this.roles);
  final Set<StaffRole> roles;
}
