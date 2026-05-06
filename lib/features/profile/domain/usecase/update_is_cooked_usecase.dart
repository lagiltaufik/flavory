import 'package:flavory/features/profile/domain/repository/favorites_list_repository.dart';

class UpdateIsCookedUsecase {
  UpdateIsCookedUsecase({required FavoritesListRepository repo}) : _repo = repo;
  final FavoritesListRepository _repo;
  Future<void> call(int id, String userId, bool isCooked) async {
    await _repo.updateIsCooked(id, userId, isCooked);
  }
}
