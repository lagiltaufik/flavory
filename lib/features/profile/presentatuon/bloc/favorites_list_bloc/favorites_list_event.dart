part of 'favorites_list_bloc.dart';

@immutable
sealed class FavoritesListEvent {
  const FavoritesListEvent();
}

class WatchFavoritesListEvent extends FavoritesListEvent {
  const WatchFavoritesListEvent();
}

class ToggleIsCookedEvent extends FavoritesListEvent {
  const ToggleIsCookedEvent({required this.id, required this.isCooked});
  final bool isCooked;
  final int id;
}

class RemoveFavoriteEvent extends FavoritesListEvent {
  const RemoveFavoriteEvent({required this.id});
  final int id;
}
