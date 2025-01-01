import 'package:numbers/numbers.dart';
import 'package:test/test.dart';

import 'smoke_test_helper.dart';

void main() {
  group('MayanNumeralsConverter', () {
    final sut = MayanNumberConverter();
    test('Smoke test', () {
      smokeTest(sut);
    });
    test('Basic convert test', () {
      expect(sut.format(0), '\u{1D2E0}');
      expect(sut.format(1), '\u{1D2E1}');
      expect(sut.format(2), '\u{1D2E2}');
      expect(sut.format(3), '\u{1D2E3}');
      expect(sut.format(4), '\u{1D2E4}');
      expect(sut.format(5), '\u{1D2E5}');
      expect(sut.format(6), '\u{1D2E6}');
      expect(sut.format(7), '\u{1D2E7}');
      expect(sut.format(8), '\u{1D2E8}');
      expect(sut.format(9), '\u{1D2E9}');
      expect(sut.format(10), '\u{1D2EA}');
      expect(sut.format(11), '\u{1D2EB}');
      expect(sut.format(12), '\u{1D2EC}');
      expect(sut.format(13), '\u{1D2ED}');
      expect(sut.format(14), '\u{1D2EE}');
      expect(sut.format(15), '\u{1D2EF}');
      expect(sut.format(16), '\u{1D2F0}');
      expect(sut.format(17), '\u{1D2F1}');
      expect(sut.format(18), '\u{1D2F2}');
      expect(sut.format(19), '\u{1D2F3}');
      expect(sut.format(1234), '\u{1D2E3}\u{1D2E7}\u{1D2EE}');
      // Wikipedia examples:
      expect(sut.format(32), '\u{1D2E1}\u{1D2EC}');
      expect(sut.format(389), '\u{1D2E1}\u{1D2E1}\u{1D2E9}');
      expect(sut.format(4645), '\u{1D2EC}\u{1D2F0}\u{1D2E5}');
      expect(sut.format(63264), '\u{1D2E8}\u{1D2EF}\u{1D2ED}\u{1D2E4}');
      expect(
          sut.format(1081086), '\u{1D2E7}\u{1D2EA}\u{1D2E3}\u{1D2E0}\u{1D2E6}');
    });
    test('Basic parse test', () {
      expect(sut.tryParse('\u{1D2E0}'), 0);
      expect(sut.tryParse('\u{1D2E1}'), 1);
      expect(sut.tryParse('\u{1D2E2}'), 2);
      expect(sut.tryParse('\u{1D2E3}'), 3);
      expect(sut.tryParse('\u{1D2E4}'), 4);
      expect(sut.tryParse('\u{1D2E5}'), 5);
      expect(sut.tryParse('\u{1D2E6}'), 6);
      expect(sut.tryParse('\u{1D2E7}'), 7);
      expect(sut.tryParse('\u{1D2E8}'), 8);
      expect(sut.tryParse('\u{1D2E9}'), 9);
      expect(sut.tryParse('\u{1D2EA}'), 10);
      expect(sut.tryParse('\u{1D2EB}'), 11);
      expect(sut.tryParse('\u{1D2EC}'), 12);
      expect(sut.tryParse('\u{1D2ED}'), 13);
      expect(sut.tryParse('\u{1D2EE}'), 14);
      expect(sut.tryParse('\u{1D2EF}'), 15);
      expect(sut.tryParse('\u{1D2F0}'), 16);
      expect(sut.tryParse('\u{1D2F1}'), 17);
      expect(sut.tryParse('\u{1D2F2}'), 18);
      expect(sut.tryParse('\u{1D2F3}'), 19);
      expect(sut.tryParse('\u{1D2E3}\u{1D2E7}\u{1D2EE}'), 1234);
      // Wikipedia examples:
      expect(sut.tryParse('\u{1D2E1}\u{1D2EC}'), 32);
      expect(sut.tryParse('\u{1D2E1}\u{1D2E1}\u{1D2E9}'), 389);
      expect(sut.tryParse('\u{1D2EC}\u{1D2F0}\u{1D2E5}'), 4645);
      expect(sut.tryParse('\u{1D2E8}\u{1D2EF}\u{1D2ED}\u{1D2E4}'), 63264);
      expect(sut.tryParse('\u{1D2E7}\u{1D2EA}\u{1D2E3}\u{1D2E0}\u{1D2E6}'),
          1081086);
    });
  });
}
