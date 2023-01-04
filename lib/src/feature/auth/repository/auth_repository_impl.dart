import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> register(
      {required String email,
      required String password,
      required String userName}) async {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      final res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});
