import 'package:intl/intl.dart';

String formatDate(String date) {
  final format = DateFormat("dd-MM-yyyy / HH:mm");
  final dateFormat = DateTime.parse(date);
  return format.format(dateFormat);
}
