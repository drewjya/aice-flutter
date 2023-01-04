abstract class AuthRepository {
  Future<void> signIn({required String email, required String password});
  Future<void> register(
      {required String email,
      required String password,
      required String userName});
}
