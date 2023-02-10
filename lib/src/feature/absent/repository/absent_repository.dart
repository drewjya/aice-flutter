import 'package:aice/src/feature/absent/model/absensi_model.dart';
import 'package:aice/src/src.dart';

abstract class AbsentRepository {
  Future<AbsensiModel> checkIn({required CheckInModel checkInModel});
  Future<String?> checkOut({required CheckOutModel checkInModel});
  Future<AbsensiModel> getAbsensiToday();
}
