import 'package:drift/drift.dart';
import 'package:flavory/core/data/sources/local/app_database.dart';
import 'package:flavory/features/home_recipes/data/model/home_recipes_model.dart';

abstract interface class RecipesLocal {
  Future<void> cacheRecipes(List<HomeRecipesModel> recipes);
  Future<List<HomeRecipesModel>> getRecipes();
}

class RecipesLocalImpl implements RecipesLocal {
  RecipesLocalImpl({required AppDatabase db}) : _db = db;
  final AppDatabase _db;
  @override
  Future<void> cacheRecipes(List<HomeRecipesModel> recipes) async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(
        _db.recipeTable,
        recipes.map((e) {
          return RecipeTableCompanion.insert(
            id: Value(e.id),
            title: e.title,
            image: e.image,
            readyInMinutes: e.readyInMinutes,
            glutenFree: e.glutenFree,
            healthScore: e.healthScore,
            vegetarian: e.vegetarian,
            aggregateLikes: e.aggregateLikes,
          );
        }).toList(),
      );
    });
  }

  @override
  Future<List<HomeRecipesModel>> getRecipes() async {
    final recipes = await _db.select(_db.recipeTable).get();
    return recipes
        .map(
          (e) => HomeRecipesModel(
            id: e.id,
            title: e.title,
            image: e.image,
            glutenFree: e.glutenFree,
            healthScore: e.healthScore,
            readyInMinutes: e.readyInMinutes,
            vegetarian: e.vegetarian,
            aggregateLikes: e.aggregateLikes,
          ),
        )
        .toList();
  }
}
