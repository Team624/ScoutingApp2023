String parse(List<int> list) {
  String given = "";
  for (int number in list) {
    given += number.toString();
  }
  return given;
}

String convertBaseAto32(List<int> list, int baseA) {
  String number = parse(list);
  int decimal = int.parse(number, radix: baseA);
  return decimal.toRadixString(32);
}
