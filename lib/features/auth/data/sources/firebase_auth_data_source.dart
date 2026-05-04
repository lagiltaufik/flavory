import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavory/features/auth/data/sources/auth_remote_data_source.dart';

class FirebaseAuthDataSource implements AuthRemoteDataSource {
  final FirebaseAuth _auth;

  FirebaseAuthDataSource(FirebaseAuth auth) : _auth = auth;

  @override
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<void> login(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return _auth.signOut();
  }

  @override
  Future<void> register(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
