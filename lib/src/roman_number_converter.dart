import 'package:numbers/numbers.dart';

/// Converts Roman numbers. Accepted range is 1-3999.
class RomanNumberConverter extends AncientNumberConverter {
  static const Map<int, String> _integerValues = {
    1000: 'M',
    900: 'CM',
    500: 'D',
    400: 'CD',
    100: 'C',
    90: 'XC',
    50: 'L',
    40: 'XL',
    10: 'X',
    9: 'IX',
    5: 'V',
    4: 'IV',
    1: 'I',
  };

  static const Map<String, int> _romanValues = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000,
  };

  @override
  String? format(num number) {
    var value = number.toInt();
    if (value < 1 || value > 3999) {
      return null;
    }

    String result = '';
    for (var entry in _integerValues.entries) {
      while (value >= entry.key) {
        result += entry.value;
        value -= entry.key;
      }
    }

    return result;
  }

  // FIXME the code partially accepted invalid inputs
  @override
  double? tryParse(String number) {
    final upperCase = number.toUpperCase();
    double result = 0;
    int prevValue = 0;

    for (int i = upperCase.length - 1; i >= 0; i--) {
      final currentValue = _romanValues[upperCase[i]];
      if (currentValue == null) {
        return null;
      }

      if (currentValue < prevValue) {
        result -= currentValue;
      } else {
        result += currentValue;
      }

      prevValue = currentValue;
    }

    return result;
  }
}
