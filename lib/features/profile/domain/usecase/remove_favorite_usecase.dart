import 'package:flavory/features/profile/domain/repository/favorites_list_repository.dart';

class RemoveFavoriteUsecase {
  RemoveFavoriteUsecase({required FavoritesListRepository repo}) : _repo = repo;
  final FavoritesListRepository _repo;
  Future<void> removeFavorite({required int id, required String userId}) async {
    await _repo.removeFavorite(id: id, userId: userId);
  }
}
