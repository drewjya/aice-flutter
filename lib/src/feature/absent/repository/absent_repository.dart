import 'package:aice/src/src.dart';

abstract class AbsentRepository {
  Future checkIn({required CheckInModel checkInModel});
  Future checkOut({required int absensiId});
  Future postFormAbsensi({required CheckOutModel checkOutModel});
  Future<AbsensiModel> getAbsensiToday();
  Future postGambar({required FotoDto fotoDto, required int absensiId});
  Future<AbsensiDetailModel> getAbsensiDetail(int id);
  Future postProdukPenjualan({
    required List<ProdukReportModel> produkPenjualan,
    required int formAbsensiId,
    required int absensiSpgId,
  });
}
