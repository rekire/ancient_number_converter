import 'package:ancient_number_converter/ancient_number_converter.dart';
import 'package:flutter/services.dart';

/// The hieroglyph converter. Accepted range is 0-9999999.
///
/// Some important notes:
/// - For the value 0 will be returned "𓄤" F035. See https://en.wikipedia.org/wiki/Egyptian_numerals#Zero
/// - There is the assumption that the numbers 1-9 are no dates otherwise the result would be wrong
/// - The parser accepts also the dates hieroglyphes
class HieroglyphConverter extends AncientNumberConverter {
  // source: https://en.wikipedia.org/wiki/List_of_Egyptian_hieroglyphs
  static const Map<int, String> _hieroglyphValues = {
    1000000: '\u{13068}', // 𓁨 C011
    100000: '\u{13190}', // 𓆐 I008
    90000: '\u{130B5}', // 𓂵 D050H
    80000: '\u{130B4}', // 𓂴 D050G
    70000: '\u{130B3}', // 𓂳 D050F
    60000: '\u{130B2}', // 𓂲 D050E
    50000: '\u{130B1}', // 𓂱 D050D
    40000: '\u{130B0}', // 𓂰 D050C
    30000: '\u{130AF}', // 𓂯 D050B
    20000: '\u{130AE}', // 𓂮 D050A
    10000: '\u{130AD}', // 𓂭 D050
    9000: '\u{131C4}', // 𓇄 M012H
    8000: '\u{131C3}', // 𓇃 M012G
    7000: '\u{131C2}', // 𓇂 M012F
    6000: '\u{131C1}', // 𓇁 M012E
    5000: '\u{131C0}', // 𓇀 M012D
    4000: '\u{131BF}', // 𓆿 M012C
    3000: '\u{131BE}', // 𓆾 M012B
    2000: '\u{131BD}', // 𓆽 M012A
    1000: '\u{131BC}', // 𓆼 M012
    900: '\u{1336A}', // 𓍪 V001H
    800: '\u{13369}', // 𓍩 V001G
    700: '\u{13368}', // 𓍨  V001F
    600: '\u{13367}', // 𓍧 V001E
    500: '\u{13366}', // 𓍦  V001D
    400: '\u{13365}', // 𓍥 V001C
    300: '\u{13364}', // 𓍤 V001B
    200: '\u{13363}', // 𓍣 V001A
    100: '\u{13362}', // 𓍢 V001
    90: '\u{1338E}', // 𓎎 V020H
    80: '\u{1338D}', // 𓎍 V020G
    70: '\u{1338C}', // 𓎌 V020F
    60: '\u{1338B}', // 𓎋 V020E
    50: '\u{1338A}', // 𓎊 V020D
    40: '\u{13389}', // 𓎉 V020C
    30: '\u{13388}', // 𓎈 V020B
    20: '\u{13387}', // 𓎇 V020A
    10: '\u{13386}', // 𓎆 V020
    9: '\u{13402}', // 𓐂 Z015H also 𓐌 U+1340C/Z016H (for dates)
    8: '\u{13401}', // 𓐁 Z015G also 𓐋 U+1340B/Z016G (for dates)
    7: '\u{13400}', // 𓐀 Z015F also 𓐊 U+1340A/Z016F (for dates)
    6: '\u{133FF}', // 𓏿 Z015E also 𓐉 U+13409/Z016E (for dates)
    5: '\u{133FE}', // 𓏾 Z015D also 𓐈 U+13408/Z016D (for dates)
    4: '\u{133FD}', // 𓏤𓏽Z015C also 𓐇 U+13407/Z016C (for dates)
    3: '\u{133FC}', // 𓏼 Z015B also 𓐆 U+13406/Z016B (for dates)
    2: '\u{133FB}', // 𓏻 Z015A also 𓏮 U+133EE/Z04A and 𓐅 U+13405/Z016A (for dates)
    1: '\u{133FA}', // 𓏺 Z015 also 𓏤 U+133E4/Z001 and 𓐄 U+13404/Z016 (for dates)
    //0: '\u{13124}', // 𓄤 F035 (more or less, they had no zero)
  };

  static const Map<String, int> _integerValues = {
    '\u{13068}': 1000000,
    '\u{13190}': 100000,
    '\u{130B5}': 90000,
    '\u{130B4}': 80000,
    '\u{130B3}': 70000,
    '\u{130B2}': 60000,
    '\u{130B1}': 50000,
    '\u{130B0}': 40000,
    '\u{130AF}': 30000,
    '\u{130AE}': 20000,
    '\u{130AD}': 10000,
    '\u{131C4}': 9000,
    '\u{131C3}': 8000,
    '\u{131C2}': 7000,
    '\u{131C1}': 6000,
    '\u{131C0}': 5000,
    '\u{131BF}': 4000,
    '\u{131BE}': 3000,
    '\u{131BD}': 2000,
    '\u{131BC}': 1000,
    '\u{1336A}': 900,
    '\u{13369}': 800,
    '\u{13368}': 700,
    '\u{13367}': 600,
    '\u{13366}': 500,
    '\u{13365}': 400,
    '\u{13364}': 300,
    '\u{13363}': 200,
    '\u{13362}': 100,
    '\u{1338E}': 90,
    '\u{1338D}': 80,
    '\u{1338C}': 70,
    '\u{1338B}': 60,
    '\u{1338A}': 50,
    '\u{13389}': 40,
    '\u{13388}': 30,
    '\u{13387}': 20,
    '\u{13386}': 10,
    '\u{13402}': 9,
    '\u{1340C}': 9,
    '\u{13401}': 8,
    '\u{1340B}': 8,
    '\u{13400}': 7,
    '\u{1340A}': 7,
    '\u{133FF}': 6,
    '\u{13409}': 6,
    '\u{133FE}': 5,
    '\u{13408}': 5,
    '\u{133FD}': 4,
    '\u{13407}': 4,
    '\u{133FC}': 3,
    '\u{13406}': 3,
    '\u{133FB}': 2,
    '\u{133EE}': 2,
    '\u{13405}': 2,
    '\u{133FA}': 1,
    '\u{133E4}': 1,
    '\u{13404}': 1,
    '\u{13124}': 0,
  };

  static final TextInputFormatter _inputFormatter =
      FilteringTextInputFormatter.allow(RegExp('(${_integerValues.keys.join('|')})'));

  @override
  String? format(num number) {
    var value = number.toInt();
    if (value == 0) {
      return '\u{13124}';
    }
    if (value < 1 || value > 9999999) {
      return null;
    }

    String result = '';
    for (var entry in _hieroglyphValues.entries) {
      while (value >= entry.key) {
        result += entry.value;
        value -= entry.key;
      }
    }

    return result;
  }

  @override
  double? tryParse(String number) {
    int result = 0;

    final chars = number.replaceAll('\n', '').runes.map((rune) => String.fromCharCode(rune)).toList();

    for (int i = chars.length - 1; i >= 0; i--) {
      final currentValue = _integerValues[chars[i]];
      if (currentValue == null) {
        return null;
      }

      result += currentValue;
    }

    return result.toDouble();
  }

  @override
  TextInputFormatter get inputFormatter => _inputFormatter;
}
