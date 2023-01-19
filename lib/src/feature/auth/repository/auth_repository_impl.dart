import 'package:aice/src/feature/feature.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final Ref ref;
  AuthRepositoryImpl(this.ref);
  @override
  Future<void> register(
      {required String email,
      required String password,
      required String userName}) async {
    try {
      final authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await ref
          .read(databaseProvider)!
          .collection('users')
          .doc(authResult.user?.uid)
          .set({
        'username': userName,
        'email': email,
      });
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref);
});
