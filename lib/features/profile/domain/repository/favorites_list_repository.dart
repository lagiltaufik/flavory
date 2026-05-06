import 'package:flavory/features/profile/domain/entity/favorites_list_entity.dart';

abstract interface class FavoritesListRepository {
  Stream<List<FavoritesListEntity>> watchFavorites(String userId);
  Future<void> updateIsCooked(int id, String userId, bool isCooked);
  Future<void> removeFavorite({required int id, required String userId});
  
}
