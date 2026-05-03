import 'package:flavory/features/search/data/model/search_recipe_model.dart';
import 'package:flavory/features/search/domain/entity/search_recipe_entity.dart';

extension SearchRecipeMapper on SearchRecipeModel {
  SearchRecipeEntity toEntity() {
    return SearchRecipeEntity(
      id: id,
      title: title,
      image: image,
    );
  }
}
