// ignore_for_file: file_names

import 'package:intl/intl.dart';

extension ViewCountExtension on int {
  String getAbbrCount() {
    var formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'tr',
    ).format(this).replaceAll(' ', '');

    return formattedNumber;
  }
}

extension BasicExtension on DateTime {
  String differenceLong() {
    DateTime today = DateTime.now();

    return today.difference(this).inSeconds < 60
        ? "${today.difference(this).inSeconds} saniye önce"
        : today.difference(this).inMinutes < 60
            ? "${today.difference(this).inMinutes} dakika önce"
            : today.difference(this).inHours < 24
                ? "${today.difference(this).inHours} saat önce"
                : today.difference(this).inDays < 30
                    ? "${today.difference(this).inDays} gün önce"
                    : today.difference(this).inDays / 30 < 12
                        ? "${today.difference(this).inDays ~/ 30} ay önce"
                        : "${today.difference(this).inDays ~/ 365.25} yıl önce";
  }
}
