import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavory/features/auth/domain/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  StreamSubscription<User?>? _subscription;

  AuthBloc({required AuthRepository repository})
    : _repository = repository,
      super(AuthInitial()) {
    on<AuthStarted>(_onAuthStarted);
    on<AuthUserChanged>(_onAuthChanged);
    on<LogoutRequested>(_onLogout);
  }

  void _onAuthStarted(AuthStarted event, Emitter<AuthState> emit) async {
    final user = _repository.currentUser;

    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }

    _subscription?.cancel();
    _subscription = _repository.authStateChanges().listen((user) {
      add(AuthUserChanged(user));
    });
  }

  void _onAuthChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    if (event.user != null) {
      emit(Authenticated(event.user!));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onLogout(LogoutRequested event, Emitter<AuthState> emit) async {
    await _repository.logout();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
