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
