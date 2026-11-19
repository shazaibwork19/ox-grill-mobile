import 'package:intl/intl.dart';

/// The restaurants are in `Asia/Karachi` (PKT, UTC+05:00, no daylight saving
/// since 2009). Times are shown in restaurant time regardless of the phone's
/// zone, so "ready at 20:15" means the same thing to the customer and the branch.
const _pktOffset = Duration(hours: 5);

DateTime toKarachi(DateTime t) => t.toUtc().add(_pktOffset);

/// `8:15 pm`
String formatLocalTime(DateTime t) => DateFormat('h:mm a', 'en_US').format(toKarachi(t)).toLowerCase();

/// `Tue 28 Oct, 8:15 pm`, or `Today, 8:15 pm`.
String formatLocalDateTime(DateTime t, {DateTime? now}) {
  final local = toKarachi(t);
  final today = toKarachi(now ?? DateTime.now());
  final sameDay = local.year == today.year && local.month == today.month && local.day == today.day;
  final day = sameDay ? 'Today' : DateFormat('EEE d MMM', 'en_US').format(local);
  return '$day, ${formatLocalTime(t)}';
}
