import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flavory/core/data/sources/local/app_database.dart';
import 'package:flavory/features/recipe_details/domain/entity/recipe_detail_entity.dart';

extension FavoriteRecipeMapper on RecipeDetailEntity {
  FavoriteRecipesTableCompanion toCompanion({
    required String userId,
    bool isCooked = false,
  }) {
    return FavoriteRecipesTableCompanion(
      id: Value(id),
      userId: Value(userId),
      isCooked: Value(isCooked),
      title: Value(title),
      image: Value(image),
      instructions: Value(instructions),

      stepsJson: Value(
        jsonEncode(
          steps
              .map(
                (e) => {
                  "number": e.number,
                  "step": e.step,
                },
              )
              .toList(),
        ),
      ),

      ingredientsJson: Value(
        jsonEncode(
          extendedIngredients
              .map(
                (e) => {
                  "name": e.name,
                  "original": e.original,
                },
              )
              .toList(),
        ),
      ),

      healthScore: Value(healthScore),
      likes: Value(aggregateLikes),

      vegetarian: Value(vegetarian),
      vegan: Value(vegan),
      glutenFree: Value(glutenFree),
    );
  }
}
