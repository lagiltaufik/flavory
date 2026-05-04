import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavory/core/utils/statuses/statuses.dart';
import 'package:flavory/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_form_state.dart';

class AuthFormCubit extends Cubit<AuthFormState> {
  AuthFormCubit({required AuthRepository repository})
    : _repository = repository,
      super(AuthFormState());

  final AuthRepository _repository;

  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: .loading));
      await _repository.login(email, password);
      emit(state.copyWith(status: .success));
    } catch (e) {
      emit(state.copyWith(status: .error, error: _wrapError(e)));
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      emit(state.copyWith(status: .loading));
      await _repository.register(email, password);
      emit(
        state.copyWith(
          status: .success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: .error, error: _wrapError(e)));
    }
  }

  changeObscure() {
    emit(state.copyWith(obscure: state.obscure ? false : true));
  }

  String _wrapError(Object e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'This email already exists. Please enter a different email';
        case 'wrong-password':
          return 'Wrong password. Try again';
        case 'user-not-found':
          return 'User not found. Try again';
        case 'weak-password':
          return 'Weak password';
        default:
          return 'Authentification error';
      }
    }
    return 'Connection error';
  }
}
