import 'package:aice/src/feature/sales/model/sales_detail_model.dart';
import 'package:aice/src/feature/sales/model/sales_history_model.dart';
import 'package:aice/src/src.dart';

abstract class SalesRepository {
  Future<List<SalesHistoryModel>> getSalesHistoryToday();
  Future<List<SalesHistoryModel>> getSalesHistoryThisWeek();
  Future<SalesDetail> getSalesDetail({required int salesId});
}
