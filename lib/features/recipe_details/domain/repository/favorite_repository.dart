import 'package:flavory/core/data/sources/local/app_database.dart';
import 'package:flavory/features/recipe_details/domain/entity/fav_counter_req_param_entity.dart';

abstract interface class FavoriteRepository {
  Future<void> addFavorite(FavoriteRecipesTableCompanion recipe);
  Future<void> removeFavorite({required int recipeId, required String userId});
  Future<bool> isFavorite(int id);
  Future<void> updateCookedStatus(int id, bool isCooked);
  Future<void> countFavorites(FavCounterReqParamEntity param);
  
}
