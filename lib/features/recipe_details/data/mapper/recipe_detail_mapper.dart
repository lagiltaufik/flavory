import 'package:flavory/features/recipe_details/data/mapper/analized_instruction_mapper.dart';
import 'package:flavory/features/recipe_details/data/mapper/ingredient_mapper.dart';
import 'package:flavory/features/recipe_details/data/model/recipe_detail_model.dart';
import 'package:flavory/features/recipe_details/domain/entity/instructions_step_entity.dart';
import 'package:flavory/features/recipe_details/domain/entity/recipe_detail_entity.dart';

extension RecipeDetailMapper on RecipeDetailModel {
  RecipeDetailEntity toEntity() {
    return RecipeDetailEntity(
      id: id,
      title: title,
      image: image,
      readyInMinutes: readyInMinutes,
      analyzedInstructions: analyzedInstructions
          .map((e) => e.toEntity())
          .toList(),
      extendedIngredients: extendedIngredients
          .map((e) => e.toEntity())
          .toList(),
      healthScore: healthScore,
      aggregateLikes: aggregateLikes,
      vegetarian: vegetarian,
      vegan: vegan,
      glutenFree: glutenFree,
      instructions: instructions,
    );
  }
}
