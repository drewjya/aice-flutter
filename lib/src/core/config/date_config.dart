import 'package:intl/intl.dart';

String formatDate(String date) {
  final format = DateFormat("dd-MM-yyyy / HH:mm");
  final dateFormat = DateTime.tryParse(date);
  final dateF = format.format(dateFormat?.toLocal() ?? DateTime.now());
  return dateF;
}
