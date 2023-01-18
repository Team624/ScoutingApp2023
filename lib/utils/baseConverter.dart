import 'package:b/b.dart';

final BaseConversion converter = BaseConversion(
  from: base5,
  to: base16,
);

String toHEX(List<int> list) {
  String given = "";
  for (int number in list) {
    given += number.toString();
  }
  return converter(given);
}
