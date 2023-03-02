import 'package:aice/src/src.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ApiRequest req;
  final Ref ref;
  AuthRepositoryImpl(this.ref, this.req);

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
      final uuid = const Uuid().v4();
      final res = await req.post(
        url: ApiUrl.register,
        auth: true,
        body: {
          "email": email,
          "password": password,
          "jenisAkun": jenisAkun,
          'name': nama,
          "uid": uuid,
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
