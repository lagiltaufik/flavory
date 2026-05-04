part of 'auth_form_cubit.dart';

@immutable
final class AuthFormState {
  const AuthFormState({
    this.error,
    this.status = .initial,
    this.obscure = true,
  });
  final Statuses status;
  final String? error;
  final bool obscure;

  AuthFormState copyWith({Statuses? status, String? error, bool? obscure}) {
    return AuthFormState(
      status: status ?? this.status,
      error: error,
      obscure: obscure ?? this.obscure,
    );
  }
}
