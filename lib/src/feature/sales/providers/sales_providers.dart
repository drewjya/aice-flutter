import 'package:aice/src/src.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final salesHistoryTodayProvider =
    StreamProvider<List<SalesHistoryModel>>((ref) async* {
  final db = ref.watch(databaseProvider);
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  if (db != null) {
    final auth = ref.watch(authStateChangesProvider).asData?.value?.uid;
    final user = db.collection("forms").doc(auth).collection("form");
    dPrint(user.path);

    yield* user
        .where("Created At", isGreaterThanOrEqualTo: today)
        .where("Created At", isLessThanOrEqualTo: tomorrow)
        .orderBy("Created At", descending: true)
        .snapshots()
        .map((event) {
      dPrint("cak cuk");
      dPrint(event.docs.length);
      return event.docs
          .map((e) => SalesHistoryModel.fromMap(e.data()))
          .toList();
    });
  }

  return;
});
final salesHistoryLastWeekProvider =
    StreamProvider<List<SalesHistoryModel>>((ref) async* {
  final db = ref.watch(databaseProvider);
  final now = DateTime.now();
  final lastweek = DateTime(now.year, now.month, now.day - 7);
  if (db != null) {
    final auth = ref.watch(authStateChangesProvider).asData?.value?.uid;
    final user = db.collection("forms").doc(auth).collection("form");
    dPrint(user.path);

    yield* user
        .where("Created At", isGreaterThanOrEqualTo: lastweek)
        .where("Created At", isLessThanOrEqualTo: now)
        .orderBy("Created At", descending: true)
        .snapshots()
        .map((event) {
      dPrint(event.docs.length);
      return event.docs
          .map((e) => SalesHistoryModel.fromMap(e.data()))
          .toList();
    });
  }
  return;
});
