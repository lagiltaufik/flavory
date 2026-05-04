part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

class AuthStarted extends AuthEvent {}

class AuthUserChanged extends AuthEvent {
  const AuthUserChanged(this.user);
  final User? user;
}

class LogoutRequested extends AuthEvent {}
