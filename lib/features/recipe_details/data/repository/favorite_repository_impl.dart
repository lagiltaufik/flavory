import 'package:flavory/core/data/sources/local/app_database.dart';
import 'package:flavory/features/recipe_details/data/source/local/favorite_local.dart';
import 'package:flavory/features/recipe_details/domain/repository/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRepositoryImpl({required FavoriteLocal local}) : _local = local;
  final FavoriteLocal _local;
  @override
  Future<void> addFavorite(FavoriteRecipesTableCompanion recipe) async {
    await _local.addFavorite(recipe);
  }

  @override
  Future<bool> isFavorite(int id) async {
    bool isFav = await _local.isFavorite(id);
    return isFav;
  }

  @override
  Future<void> removeFavorite({
    required int recipeId,
    required String userId,
  }) async {
    await _local.removeFavorite(recipeId: recipeId, userId: userId);
  }

  @override
  Future<void> updateCookedStatus(int id, bool isCooked) async {
    await _local.updateCookedStatus(id, isCooked);
  }
}
