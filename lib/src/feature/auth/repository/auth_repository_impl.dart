import 'package:aice/src/src.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ApiRequest req;
  final Ref ref;
  AuthRepositoryImpl(this.ref, this.req);
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

  @override
  Future<AuthModel> logIn(
      {required String email, required String password}) async {
    try {
      final res = await req.post(
        url: ApiUrl.login,
        auth: true,
        body: {"email": email, "password": password},
        fromJson: (p0) => p0,
      );
      final auth = AuthModel.fromMap(res!);
      await SharedPrefs.setSession(res['token']);
      return auth;
    } catch (e) {
      dPrint(e);
      rethrow;
    }
  }

  @override
  Future<AuthModel> signUp(
      {required String nama,
      required String email,
      required String password,
      required String jenisAkun}) async {
    try {
      final res = await req.post(
        url: ApiUrl.register,
        auth: true,
        body: {
          "email": email,
          "password": password,
          "jenisAkun": jenisAkun,
          'name': nama
        },
        fromJson: (p0) => p0,
      );
      final auth = AuthModel.fromMap(res!);
      await SharedPrefs.setSession(res['token']);
      return auth;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> profile() async {
    try {
      final res = await req.get(
        url: ApiUrl.profile,
        fromJson: (p0) => AuthModel.fromMap(p0),
      );
      return res!;
    } catch (e) {
      dPrint(e);
      rethrow;
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref, ref.read(requestProvider));
});
