import 'package:aice/src/src.dart';

abstract class AuthRepository {
  // Future<void> signIn({required String email, required String password});
  // Future<void> register(
  //     {required String email,
  //     required String password,
  //     required String userName});
  Future<AuthModel> logIn({required String email, required String password});
  Future<AuthModel> signUp(
      {required String nama,
      required String email,
      required String password,
      required String jenisAkun});

  Future<AuthModel> profile();
}
