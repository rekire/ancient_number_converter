import 'package:numbers/numbers.dart';
import 'package:test/test.dart';

import 'smoke_test_helper.dart';

void main() {
  group('RomanNumberConverter', () {
    final sut = RomanNumberConverter();
    test('Smoke test', () {
      smokeTest(sut);
    });
    test('Basic convert test', () {
      expect(sut.format(1), 'I');
      expect(sut.format(2), 'II');
      expect(sut.format(3), 'III');
      expect(sut.format(4), 'IV');
      expect(sut.format(5), 'V');
      expect(sut.format(6), 'VI');
      expect(sut.format(7), 'VII');
      expect(sut.format(8), 'VIII');
      expect(sut.format(9), 'IX');
      expect(sut.format(10), 'X');
      expect(sut.format(11), 'XI');
      expect(sut.format(12), 'XII');
      expect(sut.format(50), 'L');
      expect(sut.format(100), 'C');
      expect(sut.format(500), 'D');
      expect(sut.format(1000), 'M');
      expect(sut.format(1234), 'MCCXXXIV');
    });
    test('Basic parse test', () {
      expect(sut.tryParse('I'), 1);
      expect(sut.tryParse('II'), 2);
      expect(sut.tryParse('III'), 3);
      expect(sut.tryParse('IV'), 4);
      expect(sut.tryParse('V'), 5);
      expect(sut.tryParse('VI'), 6);
      expect(sut.tryParse('VII'), 7);
      expect(sut.tryParse('VIII'), 8);
      expect(sut.tryParse('IX'), 9);
      expect(sut.tryParse('X'), 10);
      expect(sut.tryParse('XI'), 11);
      expect(sut.tryParse('XII'), 12);
      expect(sut.tryParse('L'), 50);
      expect(sut.tryParse('C'), 100);
      expect(sut.tryParse('D'), 500);
      expect(sut.tryParse('M'), 1000);
      expect(sut.tryParse('MCCXXXIV'), 1234);
    });
    test('Basic parse test (lower case)', () {
      expect(sut.tryParse('i'), 1);
      expect(sut.tryParse('ii'), 2);
      expect(sut.tryParse('iii'), 3);
      expect(sut.tryParse('iv'), 4);
      expect(sut.tryParse('v'), 5);
      expect(sut.tryParse('vi'), 6);
      expect(sut.tryParse('vii'), 7);
      expect(sut.tryParse('viii'), 8);
      expect(sut.tryParse('ix'), 9);
      expect(sut.tryParse('x'), 10);
      expect(sut.tryParse('xi'), 11);
      expect(sut.tryParse('xii'), 12);
      expect(sut.tryParse('mccxxxiv'), 1234);
    });
  });
}
