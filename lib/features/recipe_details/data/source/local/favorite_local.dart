import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flavory/core/data/sources/local/app_database.dart';
import 'package:flavory/features/recipe_details/data/model/analized_instruction_model.dart';
import 'package:flavory/features/recipe_details/data/model/instructions_step_model.dart';
import 'package:flavory/features/recipe_details/data/model/recipe_detail_model.dart';
import 'package:flavory/features/recipe_details/domain/entity/fav_counter_req_param_entity.dart';

abstract interface class FavoriteLocal {
  Future<void> addFavorite(FavoriteRecipesTableCompanion recipe);
  Future<void> removeFavorite({required int recipeId, required String userId});
  Future<bool> isFavorite(int id);
  Future<void> updateCookedStatus(int id, bool isCooked);
  Future<void> countFavorites(FavCounterReqParamEntity param);
  Future<RecipeDetailModel> getFavoriteById(int id, String userId);
}

class FavoriteLocalImpl implements FavoriteLocal {
  FavoriteLocalImpl({required AppDatabase db}) : _db = db;

  final AppDatabase _db;

  @override
  Future<void> addFavorite(FavoriteRecipesTableCompanion recipe) async {
    await _db.into(_db.favoriteRecipesTable).insertOnConflictUpdate(recipe);
  }

  @override
  Future<void> removeFavorite({
    required int recipeId,
    required String userId,
  }) async {
    await (_db.delete(
          _db.favoriteRecipesTable,
        )..where((tbl) => tbl.id.equals(recipeId) & tbl.userId.equals(userId)))
        .go();
  }

  @override
  Future<bool> isFavorite(int id) async {
    final result = await (_db.select(
      _db.favoriteRecipesTable,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

    return result != null;
  }

  @override
  Future<void> updateCookedStatus(int id, bool isCooked) async {
    await (_db.update(
      _db.favoriteRecipesTable,
    )..where((tbl) => tbl.id.equals(id))).write(
      FavoriteRecipesTableCompanion(
        isCooked: Value(isCooked),
      ),
    );
  }

  @override
  Future<void> countFavorites(FavCounterReqParamEntity param) async {
    await _db
        .into(_db.favoritesCounterTable)
        .insert(
          FavoritesCounterTableCompanion.insert(
            userId: param.userId,
            recipeId: param.recipeId,
            createdAt: param.createdAt,
          ),
        );
  }

  @override
  Future<RecipeDetailModel> getFavoriteById(int id, String userId) async {
    final row = await (_db.select(
      _db.favoriteRecipesTable,
    )..where((t) => t.id.equals(id)&t.userId.equals(userId))).getSingleOrNull();
    if (row == null) {
      throw Exception('Recipe not found in local database');
    }
    final stepsList = (jsonDecode(row.stepsJson) as List)
        .map(
          (e) => InstructionsStepModel(
            number: e['number'] ?? 0,
            step: e['step'] ?? '',
          ),
        )
        .toList();
    return RecipeDetailModel(
      id: row.id,
      title: row.title,
      image: row.image,
      instructions: row.instructions,

      healthScore: row.healthScore,
      aggregateLikes: row.likes,
      vegetarian: row.vegetarian,
      vegan: row.vegan,
      glutenFree: row.glutenFree,
      readyInMinutes: row.readyInMinutes,
      analyzedInstructions: [
        AnalizedInstructionModel(
          name: '',
          steps: stepsList,
        ),
      ],
      extendedIngredients: [],
    );
  }
}
