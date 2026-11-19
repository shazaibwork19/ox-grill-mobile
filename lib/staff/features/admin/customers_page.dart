import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/format/phone.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/launch.dart';
import '../../../core/widgets/panels.dart';
import '../../data/admin_repository.dart';
import '../../domain/admin_models.dart';
import '../../widgets/staff_ui.dart';

final customersProvider = FutureProvider.autoDispose.family<List<Customer>, String>(
  (ref, q) async => (await ref.watch(adminRepositoryProvider).customers(query: q.isEmpty ? null : q)).items,
);

/// Customers with order counts and spend. Disabling blocks online orders from that number.
class CustomersPage extends ConsumerStatefulWidget {
  const CustomersPage({super.key});

  @override
  ConsumerState<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends ConsumerState<CustomersPage> {
  String _q = '';

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(customersProvider(_q));
    return Scaffold(
      appBar: AppBar(title: const Text('Customers')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Space.gutter),
            child: TextField(
              onSubmitted: (v) => setState(() => _q = v.trim()),
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                hintText: 'Name or phone',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Icon(Icons.search_rounded, semanticLabel: 'Search customers'),
              ),
            ),
          ),
          Expanded(
            child: AsyncBody(
              value: list,
              onRetry: () => ref.invalidate(customersProvider(_q)),
              data: (items) => items.isEmpty
                  ? const MessagePanel(
                      icon: Icons.people_outline_rounded,
                      title: 'No customers found',
                      message: 'Try another name or number.',
                    )
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (_, i) {
                        final c = items[i];
                        final active = c.status == 'ACTIVE';
                        return ListTile(
                          title: Text(c.name ?? displayPhone(c.phone)),
                          subtitle: Text(
                            '${displayPhone(c.phone)} · ${c.orderCount} orders · ${money(c.totalSpent)}'
                            '${c.lastOrderAt != null ? ' · last ${shortDate(c.lastOrderAt!)}' : ''}${active ? '' : ' · disabled'}',
                          ),
                          onTap: () => showModalBottomSheet<void>(
                            context: context,
                            useSafeArea: true,
                            builder: (sheet) => ListView(
                              shrinkWrap: true,
                              padding: const EdgeInsets.fromLTRB(Space.gutter, 0, Space.gutter, Space.x6),
                              children: [
                                Text(c.name ?? 'Customer', style: Theme.of(sheet).textTheme.headlineSmall),
                                KeyValue('Phone', displayPhone(c.phone)),
                                if (c.email != null) KeyValue('Email', c.email!),
                                KeyValue('Orders', '${c.orderCount}'),
                                KeyValue('Total spent', money(c.totalSpent)),
                                KeyValue('Customer since', shortDate(c.createdAt)),
                                const SizedBox(height: Space.x4),
                                if (c.phone != null)
                                  OutlinedButton.icon(
                                    onPressed: () => callNumber(sheet, c.phone!),
                                    icon: const Icon(Icons.call_rounded),
                                    label: const Text('Call'),
                                  ),
                                const SizedBox(height: Space.x2),
                                FilledButton(
                                  style: active
                                      ? FilledButton.styleFrom(
                                          backgroundColor: Theme.of(sheet).colorScheme.error,
                                        )
                                      : null,
                                  onPressed: () async {
                                    Navigator.pop(sheet);
                                    final ok = await confirm(
                                      context,
                                      title: active ? 'Block this customer?' : 'Unblock this customer?',
                                      message: active
                                          ? 'Their number will no longer be able to place online orders. They can still call the branch.'
                                          : 'Their number will be able to place online orders again.',
                                      confirmLabel: active ? 'Block customer' : 'Unblock customer',
                                      destructive: active,
                                    );
                                    if (!ok || !context.mounted) return;
                                    await runAction(
                                      context,
                                      () => ref
                                          .read(adminRepositoryProvider)
                                          .setCustomerStatus(c.id, active: !active),
                                      success: active ? 'Customer blocked' : 'Customer unblocked',
                                    );
                                    ref.invalidate(customersProvider(_q));
                                  },
                                  child: Text(active ? 'Block online orders' : 'Unblock'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
