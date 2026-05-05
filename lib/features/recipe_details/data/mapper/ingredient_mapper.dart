import 'package:flavory/features/recipe_details/data/model/ingredient_model.dart';
import 'package:flavory/features/recipe_details/domain/entity/ingredient_entity.dart';

extension IngredientMapper on IngredientModel {
  IngredientEntity toEntity() {
    return IngredientEntity(name: name, original: original);
  }
}
