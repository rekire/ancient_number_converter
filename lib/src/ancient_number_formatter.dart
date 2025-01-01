/// Interface to format ancient numbers, leaned on NumberFormatter.
abstract class AncientNumberConverter {
  /// Formats a number to a `String` if possible. In most cases it will be
  /// casted to an int. If the number cannot be converted e.g. the number
  /// system does not support so many digits a `null` value will be returned.
  String? format(num number);

  /// Tries to parse the given number. The returned value won't have decimals
  /// in most cases.
  double? tryParse(String number);
}
