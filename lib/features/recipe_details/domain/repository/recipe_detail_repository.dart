import 'package:flavory/features/recipe_details/domain/entity/recipe_detail_entity.dart';

abstract interface class RecipeDetailRepository {
  Future<RecipeDetailEntity> getRecipeDetail(int id);
}
