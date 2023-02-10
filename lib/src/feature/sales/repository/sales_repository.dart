import 'dart:io';

import 'package:aice/src/src.dart';

abstract class SalesRepository {
  Future<List<SalesHistoryModel>> getSalesHistoryToday();
  Future<List<SalesHistoryModel>> getSalesHistoryThisWeek();
  Future<SalesDetail> getSalesDetail({required int salesId});

  Future<String> sendGambarSales(
      {required int id, required String keterangan, required File foto});
  Future<SalesDetail> postSales({required SalesDto salesDto});
}
