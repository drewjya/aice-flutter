// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aice/src/feature/sales/model/sales_detail_model.dart';
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
}

final salesRepositoryProvider = Provider<SalesRepository>((ref) {
  return SalesRepositoryImpl(req: ref.read(requestProvider));
});
