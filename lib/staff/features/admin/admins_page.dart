import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/format/phone.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/status_badge.dart';
import '../../data/admin_repository.dart';
import '../../domain/admin_models.dart';
import '../../widgets/staff_ui.dart';

final adminsProvider = FutureProvider.autoDispose<List<AdminUser>>(
  (ref) => ref.watch(adminRepositoryProvider).admins(),
);

/// Super Admin (owner-level) logins.
class AdminsPage extends ConsumerWidget {
  const AdminsPage({super.key});

  Future<void> _form(BuildContext context, WidgetRef ref, [AdminUser? a]) async {
    final name = TextEditingController(text: a?.name ?? '');
    final email = TextEditingController(text: a?.email ?? '');
    final phone = TextEditingController(text: displayPhone(a?.phone).replaceAll(' ', ''));
    final password = TextEditingController();
    final form = GlobalKey<FormState>();
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(a == null ? 'New owner login' : 'Edit ${a.name ?? 'login'}'),
        content: Form(
          key: form,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (v) => (v ?? '').trim().length < 2 ? 'Required' : null,
                ),
                const SizedBox(height: Space.x3),
                TextFormField(
                  controller: email,
                  enabled: a == null,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (v) => RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch((v ?? '').trim())
                      ? null
                      : 'Enter a valid email',
                ),
                const SizedBox(height: Space.x3),
                TextFormField(
                  controller: phone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Mobile (optional)'),
                  validator: (v) => (v ?? '').trim().isEmpty || isValidPakMobile(v!)
                      ? null
                      : 'Enter a number like 03001234567',
                ),
                const SizedBox(height: Space.x3),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: a == null ? 'Password' : 'Reset password (optional)',
                    helperText: 'At least 10 characters',
                  ),
                  validator: (v) => (a != null && (v ?? '').isEmpty) || (v ?? '').length >= 10
                      ? null
                      : 'At least 10 characters',
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(
            onPressed: () => form.currentState!.validate() ? Navigator.pop(context, true) : null,
            child: const Text('Save'),
          ),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    final repo = ref.read(adminRepositoryProvider);
    final p = phone.text.trim().isEmpty ? null : normalizePhoneInput(phone.text);
    await runAction(
      context,
      () => a == null
          ? repo.createAdmin({
              'name': name.text.trim(),
              'email': email.text.trim(),
              'phone': ?p,
              'password': password.text,
            })
          : repo.updateAdmin(a.id, {
              'name': name.text.trim(),
              'phone': p,
              if (password.text.isNotEmpty) 'resetPassword': password.text,
            }),
      success: 'Saved',
    );
    ref.invalidate(adminsProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(adminsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Owner logins')),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: null,
        onPressed: () => _form(context, ref),
        icon: const Icon(Icons.person_add_alt_1_rounded),
        label: const Text('New login'),
      ),
      body: AsyncBody(
        value: list,
        onRetry: () => ref.invalidate(adminsProvider),
        data: (items) => ListView(
          padding: const EdgeInsets.only(bottom: 96),
          children: [
            const Padding(
              padding: EdgeInsets.all(Space.gutter),
              child: Text('These accounts can change everything, at every branch. Keep the list short.'),
            ),
            for (final a in items)
              ListTile(
                title: Text('${a.name ?? a.email ?? 'Login'}${a.isYou ? ' (you)' : ''}'),
                subtitle: Text(
                  '${a.email ?? ''}${a.lastLoginAt != null ? ' · last sign-in ${shortDate(a.lastLoginAt!)}' : ''}',
                ),
                onTap: () => _form(context, ref, a),
                trailing: a.isYou
                    ? null
                    : TextButton(
                        onPressed: () async {
                          final disable = a.status == 'ACTIVE';
                          final ok = await confirm(
                            context,
                            title: disable ? 'Disable ${a.name}?' : 'Enable ${a.name}?',
                            message: disable
                                ? 'They will be signed out and can’t sign in until re-enabled.'
                                : 'They will be able to sign in again.',
                            confirmLabel: disable ? 'Disable login' : 'Enable login',
                            destructive: disable,
                          );
                          if (!ok || !context.mounted) return;
                          await runAction(
                            context,
                            () => ref.read(adminRepositoryProvider).updateAdmin(a.id, {
                              'status': disable ? 'DISABLED' : 'ACTIVE',
                            }),
                            success: disable ? 'Disabled' : 'Enabled',
                          );
                          ref.invalidate(adminsProvider);
                        },
                        child: StatusBadge(
                          label: a.status == 'ACTIVE' ? 'Active' : 'Disabled',
                          tone: a.status == 'ACTIVE' ? BadgeTone.success : BadgeTone.danger,
                          icon: a.status == 'ACTIVE' ? Icons.check_rounded : Icons.block_rounded,
                        ),
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
