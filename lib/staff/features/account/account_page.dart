import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/tokens.dart';
import '../../core/session.dart';
import '../../data/people_repository.dart';
import '../../widgets/staff_ui.dart';
import '../rider/deliveries_page.dart';

/// Profile, duty, password and sign-out.
class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  Future<void> _editName(BuildContext context, WidgetRef ref, String current) async {
    final name = await promptText(
      context,
      title: 'Your name',
      label: 'Full name',
      initial: current,
      minLength: 2,
      maxLength: 80,
    );
    if (name == null || !context.mounted) return;
    await runAction(context, () async {
      final user = await ref.read(peopleRepositoryProvider).updateProfile(name: name);
      ref.read(sessionProvider.notifier).updateUser(user);
    }, success: 'Name updated');
  }

  Future<void> _changePassword(BuildContext context, WidgetRef ref) async {
    final current = TextEditingController();
    final next = TextEditingController();
    final again = TextEditingController();
    final form = GlobalKey<FormState>();
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change password'),
        content: Form(
          key: form,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: current,
                  obscureText: true,
                  autofillHints: const [AutofillHints.password],
                  decoration: const InputDecoration(labelText: 'Current password'),
                  validator: (v) => (v ?? '').isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: Space.x3),
                TextFormField(
                  controller: next,
                  obscureText: true,
                  autofillHints: const [AutofillHints.newPassword],
                  decoration: const InputDecoration(
                    labelText: 'New password',
                    helperText: 'At least 10 characters',
                  ),
                  validator: (v) => (v ?? '').length < 10 ? 'At least 10 characters' : null,
                ),
                const SizedBox(height: Space.x3),
                TextFormField(
                  controller: again,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'New password again'),
                  validator: (v) => v != next.text ? 'Passwords don’t match' : null,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(
            onPressed: () => form.currentState!.validate() ? Navigator.pop(context, true) : null,
            child: const Text('Change'),
          ),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    await runAction(
      context,
      () => ref
          .read(peopleRepositoryProvider)
          .changePassword(currentPassword: current.text, newPassword: next.text),
      success: 'Password changed',
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider).value;
    if (session == null) return const Scaffold();
    final u = session.user;
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: ListView(
        padding: const EdgeInsets.all(Space.gutter),
        children: [
          Text(u.displayName, style: t.headlineSmall),
          Text(
            '${session.role.label}${session.ownBranchName != null ? ' · ${session.ownBranchName}' : ' · all branches'}',
            style: t.bodyMedium,
          ),
          if (u.email != null) Text(u.email!, style: t.bodySmall),
          const SizedBox(height: Space.x4),
          if (u.staffProfile != null) ...[const DutySwitch(), const SizedBox(height: Space.x4)],
          ListTile(
            leading: const Icon(Icons.edit_outlined),
            title: const Text('Change name'),
            onTap: () => _editName(context, ref, u.name ?? ''),
          ),
          ListTile(
            leading: const Icon(Icons.password_rounded),
            title: const Text('Change password'),
            onTap: () => _changePassword(context, ref),
          ),
          ListTile(
            leading: const Icon(Icons.refresh_rounded),
            title: const Text('Reload my profile'),
            subtitle: const Text('After your role or branch was changed'),
            onTap: () => runAction(
              context,
              () => ref.read(sessionProvider.notifier).refreshProfile(),
              success: 'Profile reloaded',
            ),
          ),
          const Divider(height: Space.x8),
          OutlinedButton.icon(
            onPressed: () async {
              final ok = await confirm(
                context,
                title: 'Sign out?',
                message: 'You will need your email and password to sign in again.',
                confirmLabel: 'Sign out',
              );
              if (ok) await ref.read(sessionProvider.notifier).logout();
            },
            icon: const Icon(Icons.logout_rounded),
            label: const Text('Sign out'),
          ),
        ],
      ),
    );
  }
}
