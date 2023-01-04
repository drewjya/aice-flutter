import 'package:aice/src/feature/auth/repository/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(firebaseAuthProvider).authStateChanges());

final databaseProvider = Provider<FirebaseFirestore?>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  if (auth.asData?.value?.uid != null) {
    return FirebaseFirestore.instance;
  }
  return null;
});

class AuthNotifier extends StateNotifier<AsyncValue> {
  AuthNotifier(this.ref) : super(AsyncError("", StackTrace.current));
  final Ref ref;
  signIn({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref
        .read(authRepositoryProvider)
        .signIn(email: email, password: password));
  }

  signOut() async {
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => ref.read(firebaseAuthProvider).signOut());
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue>((ref) {
  return AuthNotifier(ref);
});

final userDataProvider = StreamProvider<String>((ref) async* {
  final db = ref.watch(databaseProvider);
  if (db != null) {
    final user = db.collection("users");
    final auth = ref.watch(authStateChangesProvider).asData?.value?.uid;
    yield* user.doc(auth).snapshots().map((event) {
      final a = event.data();
      if (a != null) {
        return a["username"].toString();
      }
      return "";
    });
  }
  return;
});
