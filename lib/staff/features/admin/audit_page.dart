import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/tokens.dart';
import '../../../core/time/local_time.dart';
import '../../../core/widgets/panels.dart';
import '../../data/admin_repository.dart';
import '../../domain/admin_models.dart';
import '../../widgets/staff_ui.dart';

final auditProvider = FutureProvider.autoDispose.family<List<AuditLog>, int>(
  (ref, page) async => (await ref.watch(adminRepositoryProvider).auditLogs(page: page)).items,
);

/// Who changed what (sensitive actions are logged by the server).
class AuditPage extends ConsumerStatefulWidget {
  const AuditPage({super.key});

  @override
  ConsumerState<AuditPage> createState() => _AuditPageState();
}

class _AuditPageState extends ConsumerState<AuditPage> {
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(auditProvider(_page));
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Audit log')),
      body: AsyncBody(
        value: list,
        onRetry: () => ref.invalidate(auditProvider(_page)),
        data: (items) => ListView(
          padding: const EdgeInsets.only(bottom: Space.x8),
          children: [
            if (items.isEmpty)
              const SizedBox(
                height: 300,
                child: MessagePanel(
                  icon: Icons.history_rounded,
                  title: 'Nothing logged',
                  message: 'No entries on this page.',
                ),
              ),
            for (final e in items)
              ExpansionTile(
                title: Text('${e.action.toLowerCase().replaceAll('_', ' ')} · ${e.entityType}'),
                subtitle: Text(
                  '${formatLocalDateTime(e.createdAt)} · ${e.actorName ?? 'system'} (${e.actorRole.toLowerCase().replaceAll('_', ' ')})',
                ),
                childrenPadding: const EdgeInsets.fromLTRB(Space.gutter, 0, Space.gutter, Space.x3),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (e.entityId != null) Text('Record: ${e.entityId}', style: t.bodySmall),
                  if (e.before != null)
                    Text(
                      'Before: ${const JsonEncoder.withIndent('  ').convert(e.before)}',
                      style: t.bodySmall,
                    ),
                  if (e.after != null)
                    Text('After: ${const JsonEncoder.withIndent('  ').convert(e.after)}', style: t.bodySmall),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(Space.gutter),
              child: Row(
                children: [
                  OutlinedButton(
                    onPressed: _page > 1 ? () => setState(() => _page--) : null,
                    child: const Text('Newer'),
                  ),
                  Expanded(child: Text('Page $_page', textAlign: TextAlign.center)),
                  OutlinedButton(
                    onPressed: items.length >= 50 ? () => setState(() => _page++) : null,
                    child: const Text('Older'),
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
