import 'package:numbers/numbers.dart';

void main() {
  final roman = RomanNumberConverter();
  final year = 'MMXXV';
  print('Example ${roman.format(1)}:');
  print('This lib was first published in $year (${roman.tryParse(year)?.toInt()})');
}
