import 'package:flavory/features/profile/domain/repository/favorites_statistic_repository.dart';

class GetFavoritesCountUsecase {
  GetFavoritesCountUsecase({required FavoritesStatisticRepository repo})
    : _repo = repo;
  final FavoritesStatisticRepository _repo;

  Future<List<DateTime>> getFavoritesCount(String userId) async {
    return await _repo.getFavoritesCount(userId);
  }
}
