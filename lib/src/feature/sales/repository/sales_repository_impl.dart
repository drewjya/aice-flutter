// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:aice/src/src.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SalesRepositoryImpl extends SalesRepository {
  final ApiRequest req;
  SalesRepositoryImpl({
    required this.req,
  });

  @override
  Future<List<SalesHistoryModel>> getSalesHistoryToday() async {
    try {
      final res = await req.getList<SalesHistoryModel>(
        url: ApiUrl.getTransaksiHistoryToday,
        fromJson: SalesHistoryModel.fromMap,
      );
      return res!;
    } catch (e) {
      dPrint(e);
      rethrow;
    }
  }

  @override
  Future<List<SalesHistoryModel>> getSalesHistoryThisWeek() async {
    try {
      final res = await req.getList<SalesHistoryModel>(
        url: ApiUrl.getTransaksiHistoryThisWeek,
        fromJson: SalesHistoryModel.fromMap,
      );
      return res!;
    } catch (e) {
      dPrint(e);
      rethrow;
    }
  }

  @override
  Future<SalesDetail> getSalesDetail({required int salesId}) async {
    try {
      final res = await req.get(
        url: ApiUrl.getTransaksiDetail.replaceAll('x', '$salesId'),
        fromJson: (p0) => SalesDetail.fromMap(p0),
      );
      return res!;
    } catch (e) {
      dPrint(e);
      rethrow;
    }
  }

  @override
  Future<String> sendGambarSales(
      {required int id, required String keterangan, required File foto}) async {
    try {
      final res = await req.sendFile(
          file: foto,
          id: id,
          keteranganFoto: keterangan,
          idParam: "transaksiId",
          url: ApiUrl.postImageTransaksi);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SalesDetail> postSales({required SalesDto salesDto}) async {
    try {
      final res = await req.post(
        url: ApiUrl.postTransaksi,
        body: salesDto.toMap(),
        fromJson: (p0) => SalesDetail.fromMap(p0),
      );
      return res!;
    } catch (e) {
      rethrow;
    }
  }
}

final salesRepositoryProvider = Provider<SalesRepository>((ref) {
  return SalesRepositoryImpl(req: ref.read(requestProvider));
});
