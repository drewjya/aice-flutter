// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aice/src/src.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AbsentRepositoryImpl extends AbsentRepository {
  final Ref ref;
  AbsentRepositoryImpl({
    required this.ref,
  });
  @override
  Future<String?> checkIn({required CheckInModel checkInModel}) async {
    final uid = ref.read(firebaseAuthProvider).currentUser?.uid;
    final userName = ref.watch(userDataProvider).asData?.value ?? "";
    try {
      if (ref.watch(checkInAbsensiProvider).asData?.value != null ||
          ref.watch(checkInAbsensiProvider).hasError) {
        return "Sudah melakukan CheckIn";
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
          .collection("absensi/$uid/checkIn")
          .doc(DateFormat("yyyyMMdd").format(DateTime.now()))
          .set(checkInModel.toMap());
      return "Berhasil melakukan Check In";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  @override
  Future<String?> checkOut({required CheckOutModel checkInModel}) async {
    final uid = ref.read(firebaseAuthProvider).currentUser?.uid;
    final userName = ref.watch(userDataProvider).asData?.value ?? "";
    try {
      if (ref.watch(checkInAbsensiProvider).asData?.value == null) {
        return "Belum Melakukan Check In";
      }
      if (ref.watch(checkOutAbsensiProvider).asData?.value != null ||
          ref.watch(checkInAbsensiProvider).hasError) {
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
          .doc(DateFormat("yyyyMMdd").format(DateTime.now()))
          .set(checkInModel.toMap());
      return "Berhasil melakukan Check Out";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}

final absentRepositoryProvider = Provider<AbsentRepository>((ref) {
  return AbsentRepositoryImpl(ref: ref);
});
