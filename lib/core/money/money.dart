import 'package:intl/intl.dart';

/// An amount of Pakistani Rupees held as integer paisa (PKR × 100).
///
/// The API sends every amount in paisa. Money is never a `double` in this app.
extension type const Money(int paisa) implements Object {
  static const zero = Money(0);

  Money operator +(Money other) => Money(paisa + other.paisa);
  Money operator -(Money other) => Money(paisa - other.paisa);
  Money operator *(int factor) => Money(paisa * factor);

  bool get isZero => paisa == 0;
  bool get isNegative => paisa < 0;

  static final NumberFormat _grouping = NumberFormat.decimalPattern('en_US');

  /// Whole rupees, rounded half up (away from zero for negatives):
  /// `244680` → `2447`, `244649` → `2446`.
  int get roundedRupees {
    final abs = paisa.abs();
    final rupees = (abs + 50) ~/ 100;
    return paisa < 0 ? -rupees : rupees;
  }

  /// `Rs 2,447`. Negative amounts render as `−Rs 150` (true minus sign).
  String format() {
    final rupees = roundedRupees;
    final body = 'Rs ${_grouping.format(rupees.abs())}';
    return rupees < 0 ? '−$body' : body;
  }

  /// Screen-reader friendly form: `2,447 rupees`.
  String get spoken => '${_grouping.format(roundedRupees)} rupees';
}
