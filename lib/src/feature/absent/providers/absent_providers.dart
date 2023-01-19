import 'package:aice/src/src.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final checkInAbsensiProvider = StreamProvider<CheckInModel?>((ref) async* {
  final db = ref.watch(databaseProvider);
  if (db != null) {
    final auth = ref.watch(authStateChangesProvider).asData?.value?.uid;
    final user = db
        .collection("absensi")
        .doc(auth)
        .collection("checkIn")
        .doc(DateFormat("yyyyMMdd").format(DateTime.now()));
    dPrint(user.path);

    yield* user.snapshots().map((event) {
      if (event.exists) {
        if (event.data() != null) {
          return CheckInModel.fromMap(event.data()!);
        }
      }
      return null;
    });
  }
  dPrint("cak cuk cik");
  return;
});

final checkOutAbsensiProvider = StreamProvider<CheckOutModel?>((ref) async* {
  final db = ref.watch(databaseProvider);
  if (db != null) {
    final auth = ref.watch(authStateChangesProvider).asData?.value?.uid;
    final user = db
        .collection("absensi")
        .doc(auth)
        .collection("checkOut")
        .doc(DateFormat("yyyyMMdd").format(DateTime.now()));
    dPrint(user.path);

    yield* user.snapshots().map((event) {
      if (event.exists) {
        if (event.data() != null) {
          return CheckOutModel.fromMap(event.data()!);
        }
      }
      return null;
    });
  }
  dPrint("cak cuk cik");
  return;
});
