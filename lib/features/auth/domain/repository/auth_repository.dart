import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepository {
  Stream<User?> authStateChanges();
  User? get currentUser;

  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();
}
