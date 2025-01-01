This library allows you to format and parse ancient numbers.

## Features

You can format and parse the numbers of the Romans, ancient Egyptians and Mayas.

## Getting started

The interface is `AncientNumberConverter` which has the methods `String? format(num number)` and
`double? tryParse(String number)`. The available implementation are:
- `HieroglyphConverter`
- `MayanNumberConverter`
- `RomanNumberConverter`

## Usage

```dart
final roman = RomanNumberConverter();
final year = 'MMXXV';
print('Example ${roman.format(1)}:');
print('This lib was first published in $year (${roman.tryParse(year)?.toInt()})');
```

