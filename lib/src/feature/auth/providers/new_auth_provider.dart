import 'package:aice/src/src.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNotifier extends StateNotifier<ProviderValue<AuthModel>> {
  AuthNotifier(this.ref)
      : super(ProviderValue.error(
            ErrorValue(status: ApiFailure.init, message: ''))) {
    getProfile(init: true);
  }

  final Ref ref;
  logIn({required String email, required String password}) async {
    dPrint("data");
    state = const ProviderValue.loading();
    state = await ProviderValue.guard(() => ref
        .read(authRepositoryProvider)
        .logIn(email: email, password: password));
    dPrint(state);
  }

  signUp(
      {required String email,
      required String password,
      required String name,
      required String jenisAkun}) async {
    state = const ProviderValue.loading();
    state = await ProviderValue.guard(() => ref
        .read(authRepositoryProvider)
        .signUp(
            nama: name,
            email: email,
            password: password,
            jenisAkun: jenisAkun));
  }

  getProfile({bool init = false}) async {
    state = const ProviderValue.loading();

    final val = await ProviderValue.guard(
        () => ref.read(authRepositoryProvider).profile());
    if (val.asData?.value != null) {
      state = val;
      return;
    }
    if (init) {
      ProviderValue.error(ErrorValue(
          status: ApiFailure.unauthorized,
          message: 'Session anda telah habis. Harap login kembali'));
    } else {
      state = val;
    }
  }

  logOut() async {
    await SharedPrefs.removeSession();
    state = ProviderValue.error(
        ErrorValue(status: ApiFailure.unauthorized, message: ''));
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, ProviderValue<AuthModel>>((ref) {
  return AuthNotifier(ref);
});
