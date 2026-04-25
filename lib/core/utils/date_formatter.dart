import 'package:intl/intl.dart';

class DateFormatter {
  static String getMarketFormattedTime() {
    final now = DateTime.now();

    final day = _getDayWithSuffix(now.day);
    final month = DateFormat('MMM').format(now);

    final hour = now.hour.toString()[0];

    return "$day $month $hour... BSE";
  }

  static String _getDayWithSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }

    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }
}