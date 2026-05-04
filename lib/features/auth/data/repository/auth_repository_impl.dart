import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavory/features/auth/data/sources/auth_remote_data_source.dart';
import 'package:flavory/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthRemoteDataSource remote}) : _remote = remote;
  final AuthRemoteDataSource _remote;

  @override
  Stream<User?> authStateChanges() => _remote.authStateChanges();

  @override
  User? get currentUser => _remote.currentUser;

  @override
  Future<void> login(String email, String password) =>
      _remote.login(email, password);

  @override
  Future<void> logout() => _remote.logout();

  @override
  Future<void> register(String email, String password) =>
      _remote.register(email, password);
}
