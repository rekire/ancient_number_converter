import 'package:ancient_number_converter/ancient_number_converter.dart';
import 'package:test/test.dart';

void smokeTest(AncientNumberConverter converter,
    {int min = 1, int max = 1111}) {
  for (int i = min; i <= max; i++) {
    final string = converter.format(i);
    // print('${converter.runtimeType}: $i -> $string');
    expect(
      converter.tryParse(string!),
      i,
      reason:
          'The input $i was converted to "$string", but cannot be parsed back as $i',
    );
  }
}
