import 'package:flavory/features/home_recipes/data/model/home_recipes_model.dart';
import 'package:flavory/features/home_recipes/domain/entity/home_recipes_entity.dart';

extension RecipeMapper on HomeRecipesModel {
  HomeRecipesEntity toEntity() {
    return HomeRecipesEntity(
      id: id,
      title: title,
      image: image,
      glutenFree: glutenFree,
      healthScore: healthScore,
      readyInMinutes: readyInMinutes,
      vegetarian: vegetarian,
      aggregateLikes: aggregateLikes,
    );
  }
}
