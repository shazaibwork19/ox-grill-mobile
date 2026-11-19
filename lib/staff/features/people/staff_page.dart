import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/format/phone.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/launch.dart';
import '../../../core/widgets/panels.dart';
import '../../../core/widgets/status_badge.dart';
import '../../core/branch_scope.dart';
import '../../data/people_repository.dart';
import '../../domain/admin_models.dart';
import '../../domain/auth_models.dart';
import '../../domain/ops_models.dart';
import '../../widgets/staff_ui.dart';

final staffListProvider = FutureProvider.autoDispose
    .family<List<StaffMember>, ({String? branchId, bool admin, String q})>(
      (ref, k) async =>
          (await ref
                  .watch(peopleRepositoryProvider)
                  .staff(branchId: k.branchId, admin: k.admin, query: k.q.isEmpty ? null : k.q))
              .items,
    );

/// Staff accounts. A branch manager manages their branch (`/branches/{b}/staff`);
/// the owner manages everyone (`/admin/staff`), including managers and moves
/// between branches.
class StaffPage extends ConsumerStatefulWidget {
  const StaffPage({super.key, this.admin = false});

  final bool admin;

  @override
  ConsumerState<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends ConsumerState<StaffPage> {
  final _search = TextEditingController();
  String _q = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final branchId = ref.watch(activeBranchProvider);
    final admin = widget.admin;
    final k = (branchId: branchId, admin: admin, q: _q);
    if (!admin && branchId == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Staff')),
        body: const NeedsBranch(),
      );
    }
    final list = ref.watch(staffListProvider(k));
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Staff'), actions: [if (admin) const BranchChip()]),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: null,
        onPressed: () async {
          final saved = await Navigator.of(context).push<bool>(
            MaterialPageRoute(
              builder: (_) => StaffForm(admin: admin, branchId: branchId),
            ),
          );
          if (saved == true) ref.invalidate(staffListProvider);
        },
        icon: const Icon(Icons.person_add_alt_1_rounded),
        label: const Text('Add staff'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Space.gutter),
            child: TextField(
              controller: _search,
              onSubmitted: (v) => setState(() => _q = v.trim()),
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                hintText: 'Name, email or phone',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Icon(Icons.search_rounded, semanticLabel: 'Search staff'),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => ref.refresh(staffListProvider(k).future),
              child: AsyncBody(
                value: list,
                onRetry: () => ref.invalidate(staffListProvider(k)),
                data: (items) => items.isEmpty
                    ? const MessagePanel(
                        icon: Icons.badge_outlined,
                        title: 'No staff',
                        message: 'Add team members with the button below.',
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(Space.gutter, 0, Space.gutter, 96),
                        itemCount: items.length,
                        separatorBuilder: (_, _) => const SizedBox(height: Space.x2),
                        itemBuilder: (_, i) {
                          final m = items[i];
                          return Material(
                            color: context.colors.ink800,
                            shape: RoundedRectangleBorder(
                              borderRadius: Radii.cardAll,
                              side: BorderSide(color: context.colors.border),
                            ),
                            child: ListTile(
                              shape: const RoundedRectangleBorder(borderRadius: Radii.cardAll),
                              title: Text(m.name ?? m.email ?? 'Staff', style: t.titleSmall),
                              subtitle: Text(
                                '${m.staffRole.label}${admin ? ' · ${m.branchName}' : ''} · ${m.email ?? ''}'
                                '${m.onDuty ? ' · on duty' : ''}',
                              ),
                              trailing: StatusBadge(
                                label: m.status.label,
                                tone: m.status == StaffStatus.active ? BadgeTone.success : BadgeTone.danger,
                                icon: m.status == StaffStatus.active
                                    ? Icons.check_rounded
                                    : Icons.block_rounded,
                              ),
                              onTap: () async {
                                final saved = await Navigator.of(context).push<bool>(
                                  MaterialPageRoute(
                                    builder: (_) => StaffForm(admin: admin, branchId: m.branchId, member: m),
                                  ),
                                );
                                if (saved == true) ref.invalidate(staffListProvider);
                              },
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Create or edit a staff member.
class StaffForm extends ConsumerStatefulWidget {
  const StaffForm({super.key, required this.admin, this.branchId, this.member});

  final bool admin;
  final String? branchId;
  final StaffMember? member;

  @override
  ConsumerState<StaffForm> createState() => _StaffFormState();
}

class _StaffFormState extends ConsumerState<StaffForm> {
  final _form = GlobalKey<FormState>();
  late final _name = TextEditingController(text: widget.member?.name ?? '');
  late final _email = TextEditingController(text: widget.member?.email ?? '');
  late final _phone = TextEditingController(text: displayPhone(widget.member?.phone).replaceAll(' ', ''));
  final _password = TextEditingController();
  late StaffRoleWire _role = widget.member?.staffRole ?? StaffRoleWire.cashier;
  late StaffStatus _status = widget.member?.status ?? StaffStatus.active;
  late String? _branchId = widget.member?.branchId ?? widget.branchId;
  bool _busy = false;

  bool get _editing => widget.member != null;

  @override
  void dispose() {
    for (final c in [_name, _email, _phone, _password]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    if (widget.admin && _branchId == null) return;
    setState(() => _busy = true);
    final repo = ref.read(peopleRepositoryProvider);
    final phone = _phone.text.trim().isEmpty ? null : normalizePhoneInput(_phone.text);
    final ok = await runAction(context, () async {
      if (_editing) {
        final m = widget.member!;
        await repo.updateStaff(
          m.id,
          branchId: m.branchId,
          admin: widget.admin,
          patch: {
            if (_name.text.trim() != (m.name ?? '')) 'name': _name.text.trim(),
            'phone': phone,
            if (_role != m.staffRole) 'staffRole': _role.wire,
            if (_status != m.status) 'status': _status.wire,
            if (widget.admin && _branchId != m.branchId) 'branchId': _branchId,
            if (_password.text.isNotEmpty) 'resetPassword': _password.text,
          },
        );
      } else {
        await repo.createStaff(
          branchId: widget.branchId,
          admin: widget.admin,
          body: {
            'name': _name.text.trim(),
            'email': _email.text.trim(),
            'phone': ?phone,
            'staffRole': _role.wire,
            if (widget.admin) 'branchId': _branchId,
            'temporaryPassword': _password.text,
          },
        );
      }
    }, success: _editing ? 'Saved' : 'Staff member added. Share the temporary password with them.');
    if (!mounted) return;
    setState(() => _busy = false);
    if (ok) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final branches = widget.admin
        ? ref.watch(adminBranchesProvider).value ?? const <BranchAdmin>[]
        : const <BranchAdmin>[];
    final m = widget.member;
    return Scaffold(
      appBar: AppBar(title: Text(_editing ? (m!.name ?? 'Staff member') : 'Add staff')),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(Space.gutter),
          children: [
            TextFormField(
              controller: _name,
              maxLength: 80,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Full name'),
              validator: (v) => (v ?? '').trim().length < 2 ? 'Enter a name' : null,
            ),
            const SizedBox(height: Space.x3),
            TextFormField(
              controller: _email,
              enabled: !_editing,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email (used to sign in)',
                helperText: _editing ? 'Email can’t be changed here' : null,
              ),
              validator: (v) => RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch((v ?? '').trim())
                  ? null
                  : 'Enter a valid email',
            ),
            const SizedBox(height: Space.x3),
            TextFormField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Mobile (optional)', hintText: 'e.g. 03001234567'),
              validator: (v) =>
                  (v ?? '').trim().isEmpty || isValidPakMobile(v!) ? null : 'Enter a number like 03001234567',
            ),
            const SizedBox(height: Space.x4),
            DropdownButtonFormField<StaffRoleWire>(
              isExpanded: true,
              initialValue: _role,
              decoration: const InputDecoration(labelText: 'Role'),
              items: [
                for (final r in StaffRoleWire.assignable)
                  // Branch managers are created by the owner only (sign-off decision).
                  if (widget.admin || r != StaffRoleWire.branchManager || m?.staffRole == r)
                    DropdownMenuItem(value: r, child: Text(r.label)),
              ],
              onChanged: (r) => setState(() => _role = r ?? _role),
            ),
            if (widget.admin) ...[
              const SizedBox(height: Space.x4),
              DropdownButtonFormField<String>(
                isExpanded: true,
                initialValue: branches.any((b) => b.id == _branchId) ? _branchId : null,
                decoration: const InputDecoration(labelText: 'Branch'),
                items: [for (final b in branches) DropdownMenuItem(value: b.id, child: Text(b.name))],
                validator: (v) => v == null ? 'Choose a branch' : null,
                onChanged: (v) => setState(() => _branchId = v),
              ),
            ],
            if (_editing) ...[
              const SizedBox(height: Space.x4),
              DropdownButtonFormField<StaffStatus>(
                isExpanded: true,
                initialValue: _status,
                decoration: const InputDecoration(
                  labelText: 'Status',
                  helperText: 'Suspended staff cannot sign in',
                ),
                items: [
                  for (final s in [StaffStatus.active, StaffStatus.suspended, StaffStatus.inactive])
                    DropdownMenuItem(value: s, child: Text(s.label)),
                ],
                onChanged: (s) => setState(() => _status = s ?? _status),
              ),
            ],
            const SizedBox(height: Space.x4),
            TextFormField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: _editing ? 'Reset password (optional)' : 'Temporary password',
                helperText: 'At least 10 characters. Tell the person in person, not by SMS.',
              ),
              validator: (v) {
                if (_editing && (v ?? '').isEmpty) return null;
                return (v ?? '').length < 10 ? 'At least 10 characters' : null;
              },
            ),
            if (_editing && m!.phone != null) ...[
              const SizedBox(height: Space.x3),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () => callNumber(context, m.phone!),
                  icon: const Icon(Icons.call_rounded),
                  label: Text('Call ${displayPhone(m.phone)}'),
                ),
              ),
            ],
            const SizedBox(height: Space.x6),
            FilledButton(
              onPressed: _busy ? null : _save,
              child: Text(_editing ? 'Save changes' : 'Add staff member'),
            ),
          ],
        ),
      ),
    );
  }
}
