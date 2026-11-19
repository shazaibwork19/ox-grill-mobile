import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/app_image.dart';
import '../../../core/widgets/panels.dart';
import '../../core/branch_scope.dart';
import '../../core/staff_socket.dart';
import '../../data/ops_repository.dart';
import '../../domain/ops_models.dart';
import '../../widgets/staff_ui.dart';

final availabilityProvider = FutureProvider.autoDispose.family<List<BranchMenuItem>, String>(
  (ref, branchId) => ref.watch(opsRepositoryProvider).menuAvailability(branchId),
);

/// Per-branch menu: mark items sold out, set a branch price, track stock.
class AvailabilityPage extends ConsumerStatefulWidget {
  const AvailabilityPage({super.key});

  @override
  ConsumerState<AvailabilityPage> createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends ConsumerState<AvailabilityPage> {
  final _search = TextEditingController();
  bool _soldOutOnly = false;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final branchId = ref.watch(activeBranchProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Menu availability'), actions: const [BranchChip(allowAll: false)]),
      body: branchId == null
          ? const NeedsBranch()
          : AutoRefresh(
              every: const Duration(minutes: 2),
              events: const {StaffEvent.menuAvailabilityChanged},
              onRefresh: () => ref.invalidate(availabilityProvider(branchId)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x3, Space.gutter, 0),
                    child: TextField(
                      controller: _search,
                      onChanged: (_) => setState(() {}),
                      decoration: const InputDecoration(
                        hintText: 'Search dishes',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: Icon(Icons.search_rounded, semanticLabel: 'Search dishes'),
                      ),
                    ),
                  ),
                  SwitchListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: Space.gutter),
                    title: const Text('Show sold-out only'),
                    value: _soldOutOnly,
                    onChanged: (v) => setState(() => _soldOutOnly = v),
                  ),
                  Expanded(
                    child: _List(branchId: branchId, query: _search.text, soldOutOnly: _soldOutOnly),
                  ),
                ],
              ),
            ),
    );
  }
}

class _List extends ConsumerWidget {
  const _List({required this.branchId, required this.query, required this.soldOutOnly});

  final String branchId;
  final String query;
  final bool soldOutOnly;

  Future<void> _patch(
    BuildContext context,
    WidgetRef ref,
    BranchMenuItem item,
    Map<String, Object?> patch,
    String done,
  ) async {
    await runAction(
      context,
      () => ref.read(opsRepositoryProvider).updateAvailability(branchId, item.menuItemId, patch),
      success: done,
    );
    ref.invalidate(availabilityProvider(branchId));
  }

  Future<void> _edit(BuildContext context, WidgetRef ref, BranchMenuItem item) async {
    final price = TextEditingController(
      text: item.priceOverride == null ? '' : rupeesText(item.priceOverride!),
    );
    final stock = TextEditingController(text: item.stockQuantity?.toString() ?? '');
    final form = GlobalKey<FormState>();
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(item.name),
        content: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              KeyValue('Menu price (all branches)', money(item.basePrice)),
              const SizedBox(height: Space.x3),
              RupeeField(
                controller: price,
                label: 'Price at this branch',
                helper: 'Leave empty to use the menu price',
                optional: true,
              ),
              const SizedBox(height: Space.x3),
              IntField(
                controller: stock,
                label: 'Stock',
                max: 100000,
                optional: true,
                helper: 'Leave empty if you don’t track stock',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              if (form.currentState!.validate()) Navigator.pop(context, true);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    await _patch(context, ref, item, {
      'priceOverride': price.text.trim().isEmpty ? null : parseRupees(price.text),
      'stockQuantity': stock.text.trim().isEmpty ? null : int.parse(stock.text.trim()),
    }, 'Saved ${item.name}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(availabilityProvider(branchId));
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    return RefreshIndicator(
      onRefresh: () => ref.refresh(availabilityProvider(branchId).future),
      child: AsyncBody(
        value: items,
        onRetry: () => ref.invalidate(availabilityProvider(branchId)),
        errorTitle: 'Couldn’t load the menu',
        data: (all) {
          final q = query.trim().toLowerCase();
          final list = all
              .where(
                (i) =>
                    (!soldOutOnly || !i.isAvailable) &&
                    (q.isEmpty ||
                        i.name.toLowerCase().contains(q) ||
                        i.categoryName.toLowerCase().contains(q)),
              )
              .toList();
          if (list.isEmpty) {
            return ListView(
              children: [
                SizedBox(
                  height: 300,
                  child: MessagePanel(
                    icon: Icons.search_off_rounded,
                    title: soldOutOnly ? 'Nothing is sold out' : 'No dishes found',
                    message: soldOutOnly ? 'Every dish is available at this branch.' : 'Try another word.',
                  ),
                ),
              ],
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(Space.gutter, 0, Space.gutter, Space.x12),
            itemCount: list.length,
            separatorBuilder: (_, _) => Divider(color: c.border),
            itemBuilder: (_, i) {
              final item = list[i];
              final overridden = item.priceOverride != null;
              return Row(
                children: [
                  ClipRRect(
                    borderRadius: Radii.controlAll,
                    child: SizedBox(
                      width: 56,
                      height: 42,
                      child: AppImage(url: item.imageUrl, semanticLabel: item.name, iconSize: 16),
                    ),
                  ),
                  const SizedBox(width: Space.x3),
                  Expanded(
                    child: InkWell(
                      onTap: () => _edit(context, ref, item),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: Space.x2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name, style: t.titleSmall),
                            Text(
                              '${item.categoryName} · ${money(item.effectivePrice)}${overridden ? ' (branch price)' : ''}'
                              '${item.stockQuantity != null ? ' · stock ${item.stockQuantity}' : ''}'
                              '${item.isActiveGlobally ? '' : ' · archived'}',
                              style: t.bodySmall?.copyWith(color: overridden ? c.bronze400 : null),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Semantics(
                    label: '${item.name} ${item.isAvailable ? 'available' : 'sold out'}',
                    excludeSemantics: true,
                    child: Switch(
                      value: item.isAvailable,
                      onChanged: item.isActiveGlobally
                          ? (v) => _patch(context, ref, item, {
                              'isAvailable': v,
                            }, v ? '${item.name} available' : '${item.name} sold out')
                          : null,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
