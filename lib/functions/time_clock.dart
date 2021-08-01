String getTimeStringFromDouble(double value) {
  if (value < 0) return 'Invalid Value';
  int flooredValue = value.floor();
  double decimalValue = value - flooredValue;
  String hourValue = getHourString(flooredValue);
  String minuteString = getMinuteString(decimalValue);

  return '$hourValue:$minuteString';
}

String getMinuteString(double decimalValue) {
  return '${(decimalValue * 60).toInt()}'.padLeft(2, '0');
}

String getHourString(int flooredValue) {
  return '${flooredValue % 24}'.padLeft(2, '0');
}

String getTimeStringFromInt(int _value) {
  if (_value < 0) return 'Invalid Value';
  double value = _value.toDouble()/60;
  int flooredValue = value.floor();
  double decimalValue = value - flooredValue;
  String hourValue = getHourString(flooredValue);
  String minuteString = getMinuteString(decimalValue);

  return '$hourValue:$minuteString';
}
