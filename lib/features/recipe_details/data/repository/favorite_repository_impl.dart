import 'package:flavory/core/data/sources/local/app_database.dart';
import 'package:flavory/features/recipe_details/data/mapper/recipe_detail_mapper.dart';
import 'package:flavory/features/recipe_details/data/source/local/favorite_local.dart';
import 'package:flavory/features/recipe_details/domain/entity/fav_counter_req_param_entity.dart';
import 'package:flavory/features/recipe_details/domain/entity/recipe_detail_entity.dart';
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

  @override
  Future<void> countFavorites(FavCounterReqParamEntity param) async {
    await _local.countFavorites(param);
  }

  @override
  Future<RecipeDetailEntity> getFavoriteById(int id, String userId
  ) async {
    final data = await _local.getFavoriteById(id, userId);
    return data.toEntity();
  }
}
