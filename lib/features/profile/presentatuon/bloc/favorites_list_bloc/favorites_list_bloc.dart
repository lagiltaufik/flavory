import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavory/core/services/auth_service.dart';
import 'package:flavory/core/utils/statuses/statuses.dart';
import 'package:flavory/features/profile/domain/entity/favorites_list_entity.dart';
import 'package:flavory/features/profile/domain/usecase/get_favorites_list_usecase.dart';
import 'package:flavory/features/profile/domain/usecase/remove_favorite_usecase.dart';
import 'package:flavory/features/profile/domain/usecase/update_is_cooked_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'favorites_list_event.dart';
part 'favorites_list_state.dart';

class FavoritesListBloc extends Bloc<FavoritesListEvent, FavoritesListState> {
  final GetFavoritesListUsecase _usecase;
  final UpdateIsCookedUsecase _updateIsCookedUsecase;
  final RemoveFavoriteUsecase _removeUsecase;

  FavoritesListBloc({
    required GetFavoritesListUsecase usecase,
    required UpdateIsCookedUsecase updIsCookedUc,
    required RemoveFavoriteUsecase remove,
  }) : _updateIsCookedUsecase = updIsCookedUc,
       _removeUsecase = remove,
       _usecase = usecase,
       super(FavoritesListState()) {
    on<WatchFavoritesListEvent>(_onWatchFavorites);
    on<ToggleIsCookedEvent>(_onToggleIsCooked);
    on<RemoveFavoriteEvent>(_onRemoveFavorite);
  }

  final String userId = AuthService(FirebaseAuth.instance).uid.toString();

  Future<void> _onWatchFavorites(
    WatchFavoritesListEvent event,
    Emitter<FavoritesListState> emit,
  ) async {
    emit(state.copyWith(status: .loading, error: null));
    await emit.forEach(
      _usecase.call(userId: userId!),
      onData: (data) => state.copyWith(
        favorites: data,
        status: .success,
      ),
      onError: (error, stackTrace) =>
          state.copyWith(status: .error, error: error.toString()),
    );
  }

  Future<void> _onToggleIsCooked(
    ToggleIsCookedEvent event,
    Emitter<FavoritesListState> emit,
  ) async {
    try {
      await _updateIsCookedUsecase.call(event.id, userId, event.isCooked);
    } catch (e) {
      emit(state.copyWith(status: .error, error: e.toString()));
    }
  }

  Future<void> _onRemoveFavorite(
    RemoveFavoriteEvent event,
    Emitter<FavoritesListState> emit,
  ) async {
    try {
      await _removeUsecase.removeFavorite(id: event.id, userId: userId);
    } catch (e) {
      emit(state.copyWith(status: .error, error: e.toString()));
    }
  }
}
