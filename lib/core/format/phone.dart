/// Removes spaces and dashes; otherwise the number is sent as typed.
String normalizePhoneInput(String input) => input.replaceAll(RegExp(r'[\s-]'), '');

/// Pakistani mobile in `03XXXXXXXXX` or `+923XXXXXXXXX` form.
bool isValidPakMobile(String input) => RegExp(r'^(03\d{9}|\+923\d{9})$').hasMatch(normalizePhoneInput(input));

/// `+923001234567` → `0300 1234567` for display.
String displayPhone(String? e164) {
  if (e164 == null || e164.isEmpty) return '';
  final local = e164.startsWith('+92') ? '0${e164.substring(3)}' : e164;
  if (RegExp(r'^03\d{9}$').hasMatch(local)) return '${local.substring(0, 4)} ${local.substring(4)}';
  return local;
}
