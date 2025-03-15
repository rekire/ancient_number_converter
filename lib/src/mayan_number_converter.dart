import 'package:ancient_number_converter/ancient_number_converter.dart';
import 'package:flutter/services.dart';

/// Formats Mayan numbers. Accepts all positive numbers.
class MayanNumberConverter extends AncientNumberConverter {
  // source: https://en.wikipedia.org/wiki/Maya_numerals
  static const Map<int, String> _mayanNumeralsValues = {
    19: '\u{1D2F3}', // 𝋳
    18: '\u{1D2F2}', // 𝋲
    17: '\u{1D2F1}', // 𝋱
    16: '\u{1D2F0}', // 𝋰
    15: '\u{1D2EF}', // 𝋯
    14: '\u{1D2EE}', // 𝋮
    13: '\u{1D2ED}', // 𝋭
    12: '\u{1D2EC}', // 𝋬
    11: '\u{1D2EB}', // 𝋫
    10: '\u{1D2EA}', // 𝋪
    9: '\u{1D2E9}', // 𝋩
    8: '\u{1D2E8}', // 𝋨
    7: '\u{1D2E7}', // 𝋧
    6: '\u{1D2E6}', // 𝋦
    5: '\u{1D2E5}', // 𝋥
    4: '\u{1D2E4}', // 𝋤
    3: '\u{1D2E3}', // 𝋣
    2: '\u{1D2E2}', // 𝋢
    1: '\u{1D2E1}', // 𝋡
    0: '\u{1D2E0}', // 𝋠
  };

  static const Map<String, int> _integerValues = {
    '\u{1D2F3}': 19,
    '\u{1D2F2}': 18,
    '\u{1D2F1}': 17,
    '\u{1D2F0}': 16,
    '\u{1D2EF}': 15,
    '\u{1D2EE}': 14,
    '\u{1D2ED}': 13,
    '\u{1D2EC}': 12,
    '\u{1D2EB}': 11,
    '\u{1D2EA}': 10,
    '\u{1D2E9}': 9,
    '\u{1D2E8}': 8,
    '\u{1D2E7}': 7,
    '\u{1D2E6}': 6,
    '\u{1D2E5}': 5,
    '\u{1D2E4}': 4,
    '\u{1D2E3}': 3,
    '\u{1D2E2}': 2,
    '\u{1D2E1}': 1,
    '\u{1D2E0}': 0,
  };

  static final TextInputFormatter _inputFormatter =
      FilteringTextInputFormatter.allow(RegExp('(${_integerValues.keys.join('|')})'));

  @override
  String? format(num number) {
    String result = '';
    var rest = number.toInt();

    if (rest < 0) {
      return null;
    }

    if (rest == 0) {
      return _mayanNumeralsValues[0];
    }

    var position = 0;
    while (rest > 0) {
      // Modified vigesimal system in the Maya calendar
      // See https://en.wikipedia.org/wiki/Maya_numerals#Modified_vigesimal_system_in_the_Maya_calendar
      final factor = position == 1 ? 18 : 20;
      final digit = rest % factor;
      rest ~/= factor;
      result = _mayanNumeralsValues[digit]! + result;
      position++;
    }

    return result;
  }

  @override
  double? tryParse(String number) {
    double result = 0;

    final digits = number.replaceAll('\n', '').runes.map((rune) => String.fromCharCode(rune)).toList();

    for (int i = 0; i < digits.length; i++) {
      final digit = _integerValues[digits[i]];
      if (digit == null) {
        return null;
      }
      // Modified vigesimal system in the Maya calendar, in the parsing case the second last
      // digit need a special treatment.
      final factor = i == digits.length - 2 ? 18 : 20;
      result *= factor;
      result += digit;
    }

    return result;
  }

  @override
  TextInputFormatter get inputFormatter => _inputFormatter;
}
