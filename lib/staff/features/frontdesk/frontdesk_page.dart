import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/format/phone.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/time/local_time.dart';
import '../../../core/widgets/launch.dart';
import '../../../core/widgets/panels.dart';
import '../../../core/widgets/status_badge.dart';
import '../../../features/bootstrap/data/config_repository.dart';
import '../../core/branch_scope.dart';
import '../../core/staff_socket.dart';
import '../../data/frontdesk_repository.dart';
import '../../domain/ops_models.dart';
import '../../widgets/staff_ui.dart';

final reservationsProvider = FutureProvider.autoDispose
    .family<List<Reservation>, ({String branchId, String date})>(
      (ref, k) async =>
          (await ref.watch(frontDeskRepositoryProvider).reservations(k.branchId, date: k.date)).items,
    );

final waitlistProvider = FutureProvider.autoDispose.family<List<WaitlistEntry>, String>(
  (ref, branchId) => ref.watch(frontDeskRepositoryProvider).waitlist(branchId),
);

/// Reservations and the walk-in waitlist. Each tab only appears when its
/// feature flag is on.
class FrontDeskPage extends ConsumerWidget {
  const FrontDeskPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branchId = ref.watch(activeBranchProvider);
    final f = ref.watch(clientConfigProvider).value?.features;
    final tabs = [if (f?.reservations ?? false) 'Reservations', if (f?.waitlist ?? false) 'Waitlist'];
    if (tabs.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Front desk')),
        body: const MessagePanel(
          icon: Icons.toggle_off_outlined,
          title: 'Switched off',
          message: 'Reservations and waitlist are turned off. The owner can enable them in Settings.',
        ),
      );
    }
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Front desk'),
          actions: const [BranchChip(allowAll: false)],
          bottom: TabBar(tabs: [for (final t in tabs) Tab(text: t)]),
        ),
        body: branchId == null
            ? const NeedsBranch()
            : TabBarView(
                children: [
                  if (tabs.contains('Reservations')) _Reservations(branchId: branchId),
                  if (tabs.contains('Waitlist')) _Waitlist(branchId: branchId),
                ],
              ),
      ),
    );
  }
}

// ---- Reservations -------------------------------------------------------------

class _Reservations extends ConsumerStatefulWidget {
  const _Reservations({required this.branchId});

  final String branchId;

  @override
  ConsumerState<_Reservations> createState() => _ReservationsState();
}

class _ReservationsState extends ConsumerState<_Reservations> {
  late String _date = karachiToday();

  String _pretty(String ymd) {
    final d = DateTime.parse(ymd);
    return ymd == karachiToday() ? 'Today' : DateFormat('EEE d MMM', 'en_US').format(d);
  }

  Future<void> _pickDate() async {
    final now = DateTime.parse(karachiToday());
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(_date),
      firstDate: now.subtract(const Duration(days: 60)),
      lastDate: now.add(const Duration(days: 180)),
    );
    if (picked != null) setState(() => _date = DateFormat('yyyy-MM-dd').format(picked));
  }

  Future<void> _setStatus(Reservation r, String status) async {
    String? reason;
    if (status == 'CANCELLED') {
      reason = await promptText(
        context,
        title: 'Cancel booking for ${r.name}?',
        label: 'Reason (optional)',
        confirmLabel: 'Cancel booking',
        destructive: true,
      );
      if (reason == null) return;
    }
    if (!mounted) return;
    await runAction(
      context,
      () => ref
          .read(frontDeskRepositoryProvider)
          .setReservationStatus(widget.branchId, r.id, status, reason: reason),
      success: 'Updated',
    );
    ref.invalidate(reservationsProvider);
  }

  @override
  Widget build(BuildContext context) {
    final k = (branchId: widget.branchId, date: _date);
    final list = ref.watch(reservationsProvider(k));
    final t = Theme.of(context).textTheme;
    return AutoRefresh(
      every: const Duration(seconds: 60),
      events: const {StaffEvent.reservationUpdated},
      onRefresh: () => ref.invalidate(reservationsProvider(k)),
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          heroTag: null,
          onPressed: () async {
            final ok = await Navigator.of(context).push<bool>(
              MaterialPageRoute(
                builder: (_) => _BookingForm(branchId: widget.branchId, date: _date),
              ),
            );
            if (ok == true) ref.invalidate(reservationsProvider);
          },
          icon: const Icon(Icons.add_rounded),
          label: const Text('Phone booking'),
        ),
        body: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.calendar_today_outlined),
              title: Text(_pretty(_date)),
              trailing: const Icon(Icons.edit_calendar_outlined),
              onTap: _pickDate,
            ),
            Expanded(
              child: AsyncBody(
                value: list,
                onRetry: () => ref.invalidate(reservationsProvider(k)),
                data: (items) => items.isEmpty
                    ? const MessagePanel(
                        icon: Icons.event_available_outlined,
                        title: 'No bookings',
                        message: 'No reservations for this day.',
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(Space.gutter, 0, Space.gutter, 96),
                        itemCount: items.length,
                        separatorBuilder: (_, _) => const SizedBox(height: Space.x3),
                        itemBuilder: (_, i) {
                          final r = items[i];
                          final next = switch (r.status) {
                            'PENDING' => ['CONFIRMED', 'CANCELLED'],
                            'CONFIRMED' => ['SEATED', 'NO_SHOW', 'CANCELLED'],
                            'SEATED' => ['COMPLETED'],
                            _ => const <String>[],
                          };
                          return SectionCard(
                            title: '${formatLocalTime(r.reservedFor)} · ${r.name}',
                            trailing: _statusBadge(r.status),
                            children: [
                              Text(
                                '${r.partySize} guests · ${r.durationMinutes} min · ${displayPhone(r.phone)}',
                                style: t.bodyMedium,
                              ),
                              if (r.notes != null) Text('Note: ${r.notes}', style: t.bodySmall),
                              const SizedBox(height: Space.x2),
                              Wrap(
                                spacing: Space.x2,
                                runSpacing: Space.x2,
                                children: [
                                  IconButton(
                                    tooltip: 'Call ${r.name}',
                                    onPressed: () => callNumber(context, r.phone),
                                    icon: const Icon(Icons.call_rounded),
                                  ),
                                  for (final s in next)
                                    OutlinedButton(
                                      style: s == 'CANCELLED' || s == 'NO_SHOW'
                                          ? OutlinedButton.styleFrom(
                                              foregroundColor: context.colors.danger500,
                                            )
                                          : null,
                                      onPressed: () => _setStatus(r, s),
                                      child: Text(_reservationAction(s)),
                                    ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _reservationAction(String s) => switch (s) {
  'CONFIRMED' => 'Confirm',
  'SEATED' => 'Seat',
  'COMPLETED' => 'Complete',
  'NO_SHOW' => 'No-show',
  'CANCELLED' => 'Cancel',
  _ => s,
};

Widget _statusBadge(String s) {
  final (tone, icon) = switch (s) {
    'PENDING' || 'WAITING' => (BadgeTone.warning, Icons.hourglass_top_rounded),
    'CONFIRMED' || 'NOTIFIED' => (BadgeTone.info, Icons.check_circle_outline_rounded),
    'SEATED' || 'COMPLETED' => (BadgeTone.success, Icons.event_seat_rounded),
    _ => (BadgeTone.danger, Icons.cancel_outlined),
  };
  final label = s[0] + s.substring(1).toLowerCase().replaceAll('_', '-');
  return StatusBadge(label: label, tone: tone, icon: icon);
}

class _BookingForm extends ConsumerStatefulWidget {
  const _BookingForm({required this.branchId, required this.date});

  final String branchId;
  final String date;

  @override
  ConsumerState<_BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends ConsumerState<_BookingForm> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _party = TextEditingController(text: '2');
  final _notes = TextEditingController();
  late String _date = widget.date;
  TimeOfDay _time = const TimeOfDay(hour: 20, minute: 0);
  bool _busy = false;

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    setState(() => _busy = true);
    final ok = await runAction(
      context,
      () => ref
          .read(frontDeskRepositoryProvider)
          .book(
            widget.branchId,
            date: _date,
            time: '${_time.hour.toString().padLeft(2, '0')}:${_time.minute.toString().padLeft(2, '0')}',
            partySize: int.parse(_party.text),
            name: _name.text.trim(),
            phone: normalizePhoneInput(_phone.text),
            notes: _notes.text,
          ),
      success: 'Booked',
    );
    if (!mounted) return;
    setState(() => _busy = false);
    if (ok) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone booking')),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(Space.gutter),
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_today_outlined),
              title: Text(DateFormat('EEE d MMM yyyy', 'en_US').format(DateTime.parse(_date))),
              onTap: () async {
                final now = DateTime.parse(karachiToday());
                final d = await showDatePicker(
                  context: context,
                  initialDate: DateTime.parse(_date),
                  firstDate: now,
                  lastDate: now.add(const Duration(days: 180)),
                );
                if (d != null) setState(() => _date = DateFormat('yyyy-MM-dd').format(d));
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.schedule_rounded),
              title: Text(_time.format(context)),
              onTap: () async {
                final t = await showTimePicker(context: context, initialTime: _time);
                if (t != null) setState(() => _time = t);
              },
            ),
            const SizedBox(height: Space.x3),
            IntField(controller: _party, label: 'Guests', min: 1, max: 40),
            const SizedBox(height: Space.x3),
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (v) => (v ?? '').trim().length < 2 ? 'Enter a name' : null,
            ),
            const SizedBox(height: Space.x3),
            TextFormField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Mobile number', hintText: 'e.g. 0300 1234567'),
              validator: (v) => isValidPakMobile(v ?? '') ? null : 'Enter a number like 03001234567',
            ),
            const SizedBox(height: Space.x3),
            TextFormField(
              controller: _notes,
              maxLength: 400,
              decoration: const InputDecoration(labelText: 'Notes (optional)'),
            ),
            const SizedBox(height: Space.x4),
            FilledButton(onPressed: _busy ? null : _save, child: const Text('Book table')),
            const SizedBox(height: Space.x2),
            Text('Phone bookings are confirmed immediately.', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

// ---- Waitlist -----------------------------------------------------------------

class _Waitlist extends ConsumerWidget {
  const _Waitlist({required this.branchId});

  final String branchId;

  Future<void> _addWalkIn(BuildContext context, WidgetRef ref) async {
    final name = TextEditingController();
    final phone = TextEditingController();
    final party = TextEditingController(text: '2');
    final form = GlobalKey<FormState>();
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add walk-in'),
        content: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => (v ?? '').trim().length < 2 ? 'Enter a name' : null,
              ),
              const SizedBox(height: Space.x3),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Mobile (optional, for SMS)'),
                validator: (v) => (v ?? '').trim().isEmpty || isValidPakMobile(v!)
                    ? null
                    : 'Enter a number like 03001234567',
              ),
              const SizedBox(height: Space.x3),
              IntField(controller: party, label: 'Guests', min: 1, max: 30),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(
            onPressed: () => form.currentState!.validate() ? Navigator.pop(context, true) : null,
            child: const Text('Add'),
          ),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    await runAction(
      context,
      () => ref
          .read(frontDeskRepositoryProvider)
          .addWalkIn(
            branchId,
            name: name.text.trim(),
            phone: normalizePhoneInput(phone.text),
            partySize: int.parse(party.text),
          ),
      success: 'Added to the waitlist',
    );
    ref.invalidate(waitlistProvider(branchId));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(waitlistProvider(branchId));
    final t = Theme.of(context).textTheme;
    final repo = ref.read(frontDeskRepositoryProvider);
    Future<void> act(Future<Object?> Function() f, String done) async {
      await runAction(context, f, success: done);
      ref.invalidate(waitlistProvider(branchId));
    }

    return AutoRefresh(
      every: const Duration(seconds: 30),
      events: const {StaffEvent.waitlistUpdated, StaffEvent.waitlistEntryUpdated},
      onRefresh: () => ref.invalidate(waitlistProvider(branchId)),
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          heroTag: null,
          onPressed: () => _addWalkIn(context, ref),
          icon: const Icon(Icons.person_add_alt_1_rounded),
          label: const Text('Walk-in'),
        ),
        body: AsyncBody(
          value: list,
          onRetry: () => ref.invalidate(waitlistProvider(branchId)),
          data: (items) {
            final active = items.where((e) => e.status == 'WAITING' || e.status == 'NOTIFIED').toList();
            return ListView(
              padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x3, Space.gutter, 96),
              children: [
                FilledButton.icon(
                  onPressed: active.any((e) => e.status == 'WAITING')
                      ? () => act(() => repo.notifyNext(branchId), 'Next party notified')
                      : null,
                  icon: const Icon(Icons.campaign_outlined),
                  label: const Text('Table ready · notify next'),
                ),
                const SizedBox(height: Space.x4),
                if (active.isEmpty)
                  const SizedBox(
                    height: 280,
                    child: MessagePanel(
                      icon: Icons.groups_outlined,
                      title: 'Nobody waiting',
                      message: 'Add walk-ins as they arrive.',
                    ),
                  ),
                for (final e in active) ...[
                  SectionCard(
                    title: '${e.position != null ? '#${e.position} · ' : ''}${e.name}',
                    trailing: _statusBadge(e.status),
                    children: [
                      Text(
                        '${e.partySize} guests · joined ${formatLocalTime(e.joinedAt)}'
                        '${e.estimatedWaitMinutes != null ? ' · ~${e.estimatedWaitMinutes} min' : ''}'
                        '${e.expiresAt != null ? ' · arrive by ${formatLocalTime(e.expiresAt!)}' : ''}',
                        style: t.bodyMedium,
                      ),
                      const SizedBox(height: Space.x2),
                      Wrap(
                        spacing: Space.x2,
                        runSpacing: Space.x2,
                        children: [
                          if (e.phone != null)
                            IconButton(
                              tooltip: 'Call ${e.name}',
                              onPressed: () => callNumber(context, e.phone!),
                              icon: const Icon(Icons.call_rounded),
                            ),
                          if (e.status == 'WAITING')
                            OutlinedButton(
                              onPressed: () =>
                                  act(() => repo.setWaitlistStatus(branchId, e.id, 'NOTIFIED'), 'Notified'),
                              child: const Text('Notify'),
                            ),
                          OutlinedButton(
                            onPressed: () =>
                                act(() => repo.setWaitlistStatus(branchId, e.id, 'SEATED'), 'Seated'),
                            child: const Text('Seat'),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(foregroundColor: context.colors.danger500),
                            onPressed: () =>
                                act(() => repo.setWaitlistStatus(branchId, e.id, 'CANCELLED'), 'Removed'),
                            child: const Text('Remove'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: Space.x3),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
