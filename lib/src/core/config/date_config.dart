import 'package:intl/intl.dart';

String formatDate(String date) {
  final format = DateFormat("dd-MM-yyyy / HH:mm");
  final dateFormat = DateTime.tryParse(date);
  final dateF = format.format(dateFormat?.toLocal() ?? DateTime.now());
  return dateF;
}

String formatDate2(String? date) {
  if (date == null) {
    return "-";
  }
  final format = DateFormat("HH:mm\ndd-MM-yyyy");
  final dateFormat = DateTime.tryParse(date);
  final dateF = format.format(dateFormat?.toLocal() ?? DateTime.now());
  return dateF;
}
