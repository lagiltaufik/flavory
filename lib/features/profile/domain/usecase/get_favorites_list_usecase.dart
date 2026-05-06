import 'package:flavory/features/profile/domain/entity/favorites_list_entity.dart';
import 'package:flavory/features/profile/domain/repository/favorites_list_repository.dart';

class GetFavoritesListUsecase {
  final FavoritesListRepository _repository;
  GetFavoritesListUsecase({required FavoritesListRepository repository})
    : _repository = repository;

  Stream<List<FavoritesListEntity>> call({
    required String userId,
  }) {
    return _repository.watchFavorites(userId);
  }
}
