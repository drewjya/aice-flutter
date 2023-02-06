import 'package:aice/src/core/config/logger.dart';
import 'package:intl/intl.dart';

String formatDate(String date) {
  final format = DateFormat("dd-MM-yyyy / HH:mm");
  dPrint(date);
  final dateFormat = DateTime.tryParse(date);

  return format.format(dateFormat ?? DateTime.now());
}
