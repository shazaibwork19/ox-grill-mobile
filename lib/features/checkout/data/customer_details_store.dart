import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers.dart';

/// Contact and address the customer typed last time, to prefill checkout.
/// Kept in secure storage because it is personal data.
class CustomerDetails {
  const CustomerDetails({
    this.name = '',
    this.phone = '',
    this.addressLine = '',
    this.area = '',
    this.city = '',
    this.instructions = '',
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> j) => CustomerDetails(
    name: j['name'] as String? ?? '',
    phone: j['phone'] as String? ?? '',
    addressLine: j['addressLine'] as String? ?? '',
    area: j['area'] as String? ?? '',
    city: j['city'] as String? ?? '',
    instructions: j['instructions'] as String? ?? '',
  );

  final String name;
  final String phone;
  final String addressLine;
  final String area;
  final String city;
  final String instructions;

  Map<String, Object?> toJson() => {
    'name': name,
    'phone': phone,
    'addressLine': addressLine,
    'area': area,
    'city': city,
    'instructions': instructions,
  };
}

final customerDetailsProvider = FutureProvider<CustomerDetails>((ref) async {
  final raw = await ref.watch(secureStorageProvider).read(key: CustomerDetailsStore.key);
  if (raw == null) return const CustomerDetails();
  try {
    return CustomerDetails.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  } catch (_) {
    return const CustomerDetails();
  }
});

class CustomerDetailsStore {
  CustomerDetailsStore(this.ref);

  static const key = 'checkout.customer.v1';
  final Ref ref;

  Future<void> save(CustomerDetails details) async {
    await ref.read(secureStorageProvider).write(key: key, value: jsonEncode(details.toJson()));
    ref.invalidate(customerDetailsProvider);
  }
}

final customerDetailsStoreProvider = Provider(CustomerDetailsStore.new);
