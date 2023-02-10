// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aice/src/feature/absent/model/absensi_model.dart';
import 'package:aice/src/src.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AbsentRepositoryImpl extends AbsentRepository {
  final Ref ref;
  final ApiRequest req;
  AbsentRepositoryImpl({required this.ref, required this.req});
  @override
  Future<AbsensiModel> checkIn({required CheckInModel checkInModel}) async {
    try {
      final res = await req.post(
        url: ApiUrl.postCheckIn,
        body: checkInModel.toMap(),
        fromJson: (p0) => AbsensiModel.fromMap(p0),
      );
      dPrint(res);
      return res!;
    } catch (e) {
      rethrow;
    }
  
  }

  @override
  Future<String?> checkOut({required CheckOutModel checkInModel}) async {
    final uid = ref.read(firebaseAuthProvider).currentUser?.uid;
    final userName = ref.watch(userDataProvider).asData?.value ?? "";
    try {
      if (ref.watch(oldCheckInAbsensiProvider).asData?.value == null) {
        return "Belum Melakukan Check In";
      }
      if (ref.watch(oldCheckOutAbsensiProvider).asData?.value != null ||
          ref.watch(oldCheckInAbsensiProvider).hasError) {
        return "Sudah Melakukan Check Out";
      }
      final isRegistered = await ref
          .read(databaseProvider)!
          .collection("absensi")
          .doc(uid)
          .get();
      final data = isRegistered.data()?["namaSPG"];
      if (data == null) {
        await ref
            .read(databaseProvider)!
            .collection("absensi")
            .doc(uid)
            .set({"namaSPG": userName});
      }
      await ref
          .read(databaseProvider)!
          .collection("absensi/$uid/checkOut")
          .doc("${DateFormat("yyyyMMdd").format(DateTime.now())}|$uid")
          .set(checkInModel.toMap());
      return "Berhasil melakukan Check Out";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  @override
  Future<AbsensiModel> getAbsensiToday() async {
    try {
      final res = await req.get(
        url: ApiUrl.getAbsensiToday,
        fromJson: (p0) => AbsensiModel.fromMap(p0),
      );
      dPrint(res);
      return res!;
    } catch (e) {
      rethrow;
    }
  }
}

final absentRepositoryProvider = Provider<AbsentRepository>((ref) {
  return AbsentRepositoryImpl(ref: ref, req: ref.read(requestProvider));
});
