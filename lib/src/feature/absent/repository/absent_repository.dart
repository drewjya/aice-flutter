import 'package:aice/src/feature/absent/model/absensi_detail_model.dart';
import 'package:aice/src/src.dart';

abstract class AbsentRepository {
  Future checkIn({required CheckInModel checkInModel});
  Future checkOut({required int absensiId});
  Future postFormAbsensi({required CheckOutModel checkOutModel});
  Future<AbsensiModel> getAbsensiToday();
  Future postGambar({required FotoDto fotoDto, required int absensiId});
  Future<AbsensiDetailModel> getAbsensiDetail();
}
