import 'package:aice/src/src.dart';

abstract class AbsentRepository {
  Future<String?> checkIn({required CheckInModel checkInModel});
  Future<String?> checkOut({required CheckOutModel checkInModel});
}
