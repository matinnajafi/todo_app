String convertToPersianNumberWithPercent(double number) {
  const List<String> persianDigits = [
    '۰',
    '۱',
    '۲',
    '۳',
    '۴',
    '۵',
    '۶',
    '۷',
    '۸',
    '۹',
  ];
  String persianNumber = "";
  String percentageStr = (number * 100).toInt().toString();
  for (var digit in percentageStr.split('')) {
    persianNumber += persianDigits[int.parse(digit)];
  }
  return '$persianNumber٪'; // Persian percent sign
}

String convertToPersianNumber(int number) {
  const List<String> persianDigits = [
    '۰',
    '۱',
    '۲',
    '۳',
    '۴',
    '۵',
    '۶',
    '۷',
    '۸',
    '۹',
  ];
  return number
      .toString()
      .split('')
      .map((digit) {
        return persianDigits[int.parse(digit)];
      })
      .join('');
}

// example: 22:30 => ۲۲:۳۰
String toPersianDigits(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], persian[i]);
  }
  return input;
}
