import 'package:flavory/core/data/sources/local/app_database.dart';

abstract interface class FavoriteRepository {
  Future<void> addFavorite(FavoriteRecipesTableCompanion recipe);
  Future<void> removeFavorite({required int recipeId, required String userId});
  Future<bool> isFavorite(int id);
  Future<void> updateCookedStatus(int id, bool isCooked);
}
