import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/staff/core/permissions.dart';
import 'package:ox_grill/staff/domain/auth_models.dart';

/// Endpoints behind each capability (method + OpenAPI path).
const _endpoints = <Capability, List<String>>{
  Capability.dashboard: ['GET /api/v1/branches/{branchId}/dashboard'],
  Capability.orders: [
    'GET /api/v1/branches/{branchId}/orders',
    'GET /api/v1/branches/{branchId}/orders/{orderId}',
    'PATCH /api/v1/branches/{branchId}/orders/{orderId}/status',
    'POST /api/v1/branches/{branchId}/orders/{orderId}/payments/collect',
    'GET /api/v1/branches/{branchId}/orders/{orderId}/receipt',
  ],
  Capability.refund: ['POST /api/v1/branches/{branchId}/orders/{orderId}/refund'],
  Capability.pos: ['POST /api/v1/branches/{branchId}/orders'],
  Capability.assignRider: [
    'GET /api/v1/branches/{branchId}/riders',
    'POST /api/v1/branches/{branchId}/orders/{orderId}/assign-rider',
  ],
  Capability.kitchen: [
    'GET /api/v1/branches/{branchId}/kitchen/queue',
    'PATCH /api/v1/branches/{branchId}/kitchen/orders/{orderId}/preparing',
    'PATCH /api/v1/branches/{branchId}/kitchen/orders/{orderId}/ready',
  ],
  Capability.deliveries: [
    'GET /api/v1/delivery/assignments/me',
    'PATCH /api/v1/delivery/assignments/{id}/accept',
    'PATCH /api/v1/delivery/assignments/{id}/picked-up',
    'PATCH /api/v1/delivery/assignments/{id}/delivered',
    'PATCH /api/v1/delivery/assignments/{id}/complete',
  ],
  Capability.duty: ['PATCH /api/v1/staff/me/duty'],
  Capability.menuAvailability: [
    'GET /api/v1/branches/{branchId}/menu-availability',
    'PATCH /api/v1/branches/{branchId}/menu-availability/{menuItemId}',
  ],
  Capability.branchStaff: [
    'GET /api/v1/branches/{branchId}/staff',
    'POST /api/v1/branches/{branchId}/staff',
    'PATCH /api/v1/branches/{branchId}/staff/{id}',
  ],
  Capability.shifts: [
    'GET /api/v1/branches/{branchId}/shifts/current',
    'POST /api/v1/branches/{branchId}/shifts/open',
    'POST /api/v1/branches/{branchId}/shifts/{id}/close',
    'GET /api/v1/branches/{branchId}/shifts',
  ],
  Capability.reservations: [
    'GET /api/v1/branches/{branchId}/reservations',
    'POST /api/v1/branches/{branchId}/reservations',
    'PATCH /api/v1/branches/{branchId}/reservations/{id}/status',
  ],
  Capability.waitlist: [
    'GET /api/v1/branches/{branchId}/waitlist',
    'POST /api/v1/branches/{branchId}/waitlist',
    'POST /api/v1/branches/{branchId}/waitlist/notify-next',
    'PATCH /api/v1/branches/{branchId}/waitlist/{id}/status',
  ],
  Capability.reports: [
    'GET /api/v1/reports/overview',
    'GET /api/v1/reports/sales-by-day',
    'GET /api/v1/reports/export',
  ],
  Capability.forecasts: ['GET /api/v1/forecasts'],
  Capability.branchSettingsEdit: [
    'GET /api/v1/branches/{branchId}/settings',
    'PATCH /api/v1/branches/{branchId}/settings',
  ],
  Capability.adminBranches: [
    'GET /api/v1/admin/branches',
    'POST /api/v1/admin/branches',
    'PUT /api/v1/admin/branches/{branchId}/hours',
  ],
  Capability.adminMenu: [
    'POST /api/v1/admin/menu-items',
    'POST /api/v1/admin/uploads',
    'DELETE /api/v1/admin/categories/{id}',
  ],
  Capability.adminStaff: [
    'GET /api/v1/admin/staff',
    'POST /api/v1/admin/staff',
    'PATCH /api/v1/admin/staff/{id}',
  ],
  Capability.adminAdmins: ['GET /api/v1/admin/admins', 'POST /api/v1/admin/admins'],
  Capability.adminCustomers: ['GET /api/v1/admin/customers', 'PATCH /api/v1/admin/customers/{id}/status'],
  Capability.adminSettings: ['GET /api/v1/admin/settings', 'PATCH /api/v1/admin/settings/{key}'],
  Capability.adminAudit: ['GET /api/v1/admin/audit-logs'],
  Capability.runForecasts: ['POST /api/v1/admin/forecasts/run'],
};

const _staffWire = {
  StaffRole.manager: 'BRANCH_MANAGER',
  StaffRole.cashier: 'CASHIER',
  StaffRole.kitchen: 'KITCHEN_STAFF',
  StaffRole.rider: 'DELIVERY_AGENT',
};

AppUser _user(GlobalRole g, {StaffRoleWire? role, StaffStatus status = StaffStatus.active}) => AppUser(
  id: 'u1',
  globalRole: g,
  staffProfile: role == null
      ? null
      : StaffProfile(id: 's1', branchId: 'b1', branchName: 'F-7', staffRole: role, status: status),
);

void main() {
  final spec = jsonDecode(File('docs/openapi.json').readAsStringSync()) as Map<String, dynamic>;
  final paths = spec['paths'] as Map<String, dynamic>;

  bool serverAllows(StaffRole role, String endpoint) {
    final [method, path] = endpoint.split(' ');
    final op = (paths[path] as Map<String, dynamic>?)?[method.toLowerCase()] as Map<String, dynamic>?;
    expect(op, isNotNull, reason: '$endpoint is missing from the OpenAPI document');
    final roles = List<String>.from(op!['x-roles'] as List? ?? const []);
    final staffRoles = List<String>.from(op['x-staff-roles'] as List? ?? const []);
    if (role == StaffRole.owner) return roles.contains('SUPER_ADMIN');
    if (!roles.contains('STAFF')) return false;
    return staffRoles.isEmpty || staffRoles.contains(_staffWire[role]);
  }

  test('every capability lists its endpoints', () {
    expect(_endpoints.keys.toSet(), Capability.values.toSet());
  });

  for (final cap in Capability.values) {
    test('${cap.name}: app roles match the server (x-roles / x-staff-roles)', () {
      for (final role in StaffRole.values) {
        if (!role.can(cap)) continue;
        // The app must never offer an action the server forbids.
        for (final e in _endpoints[cap]!) {
          expect(
            serverAllows(role, e),
            isTrue,
            reason: '${role.name} is shown ${cap.name}, but the server forbids $e',
          );
        }
      }
    });
  }

  group('StaffRole.of', () {
    test('owner', () => expect(StaffRole.of(_user(GlobalRole.superAdmin)), StaffRole.owner));
    test('each staff role', () {
      expect(StaffRole.of(_user(GlobalRole.staff, role: StaffRoleWire.branchManager)), StaffRole.manager);
      expect(StaffRole.of(_user(GlobalRole.staff, role: StaffRoleWire.cashier)), StaffRole.cashier);
      expect(StaffRole.of(_user(GlobalRole.staff, role: StaffRoleWire.kitchenStaff)), StaffRole.kitchen);
      expect(StaffRole.of(_user(GlobalRole.staff, role: StaffRoleWire.deliveryAgent)), StaffRole.rider);
    });
    test('customers, suspended staff and staff without a profile are refused', () {
      expect(StaffRole.of(_user(GlobalRole.customer)), isNull);
      expect(
        StaffRole.of(_user(GlobalRole.staff, role: StaffRoleWire.cashier, status: StaffStatus.suspended)),
        isNull,
      );
      expect(StaffRole.of(_user(GlobalRole.staff)), isNull);
    });
  });
}
