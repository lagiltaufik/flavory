part of 'favorites_list_bloc.dart';

@immutable
final class FavoritesListState {
  const FavoritesListState({this.favorites = const [], this.status = .initial, this.error});

  final List<FavoritesListEntity> favorites;
  final Statuses status;
  final String? error;

  FavoritesListState copyWith({
    List<FavoritesListEntity>? favorites,
    Statuses? status,
    String? error
  }) {
    return FavoritesListState(
      status: status ?? this.status,
      favorites: favorites ?? this.favorites,
      error: error??this.error
    );
  }
}
