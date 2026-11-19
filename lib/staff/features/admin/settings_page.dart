import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/tokens.dart';
import '../../../features/bootstrap/data/config_repository.dart';
import '../../data/admin_repository.dart';
import '../../domain/admin_models.dart';
import '../../widgets/staff_ui.dart';

final settingsProvider = FutureProvider.autoDispose<List<SystemSetting>>(
  (ref) => ref.watch(adminRepositoryProvider).settings(),
);

/// Feature flags and system settings. Booleans are switches; other values are
/// edited as text. "Reset" returns a setting to the server's environment default.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  Future<void> _save(BuildContext context, WidgetRef ref, SystemSetting s, Object? value, String done) async {
    await runAction(
      context,
      () => ref.read(adminRepositoryProvider).updateSetting(s.key, value),
      success: done,
    );
    ref
      ..invalidate(settingsProvider)
      ..invalidate(clientConfigProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(settingsProvider);
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Settings & features')),
      body: AsyncBody(
        value: list,
        onRetry: () => ref.invalidate(settingsProvider),
        data: (items) => ListView(
          padding: const EdgeInsets.all(Space.gutter),
          children: [
            Text(
              'Changes apply to the website, the customer app and this app. Some modules (online payments, live GPS) '
              'also need provider setup on the server before they work.',
              style: t.bodySmall,
            ),
            const SizedBox(height: Space.x3),
            for (final s in items)
              Padding(
                padding: const EdgeInsets.only(bottom: Space.x3),
                child: SectionCard(
                  children: [
                    if (s.value is bool)
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(s.key),
                        subtitle: Text([s.description, 'from ${s.source}'].whereType<String>().join(' · ')),
                        value: s.value! as bool,
                        onChanged: (v) => _save(context, ref, s, v, '${s.key} ${v ? 'on' : 'off'}'),
                      )
                    else
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(s.key),
                        subtitle: Text(
                          '${s.value ?? '—'}\n${[s.description, 'from ${s.source}'].whereType<String>().join(' · ')}',
                        ),
                        isThreeLine: true,
                        trailing: const Icon(Icons.edit_outlined),
                        onTap: () async {
                          final v = await promptText(
                            context,
                            title: s.key,
                            label: 'Value',
                            initial: '${s.value ?? ''}',
                            maxLength: 500,
                          );
                          if (v == null || !context.mounted) return;
                          final Object parsed = s.value is num ? (num.tryParse(v) ?? v) : v;
                          await _save(context, ref, s, parsed, 'Saved');
                        },
                      ),
                    if (s.source == 'database')
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => _save(context, ref, s, null, '${s.key} reset to default'),
                          child: const Text('Reset to default'),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
