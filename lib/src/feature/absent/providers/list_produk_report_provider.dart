import 'package:aice/src/feature/absent/model/produk_report_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListProdukReportNotifier extends Notifier<List<ProdukReportModel>> {
  @override
  build() {
    return [];
  }

  String? addProduk(ProdukReportModel produkReportModel) {
    final checkProduk = _checkProductContained(produkReportModel);
    if (checkProduk != null) {
      return checkProduk;
    }
    final temp = state;
    state = {...temp, produkReportModel}.toList();
    return null;
  }

  removeProduk(ProdukReportModel produkReportModel) {
    final temp = state
        .where((element) => element.kodeProduk != produkReportModel.kodeProduk);
    state = {...temp}.toList();
    return null;
  }

  String? _checkProductContained(ProdukReportModel produkReportModel) {
    final data = state
        .where((element) => element.kodeProduk == produkReportModel.kodeProduk);
    if (data.isNotEmpty) {
      return "Produk Sudah Ditambahkan";
    }

    return null;
  }
}

final listProdukReportProvider =
    NotifierProvider<ListProdukReportNotifier, List<ProdukReportModel>>(
        ListProdukReportNotifier.new);
