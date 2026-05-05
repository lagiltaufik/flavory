import 'package:flavory/features/home_recipes/domain/usecase/get_home_recipes_usecase.dart';
import 'package:flavory/features/recipe_details/domain/entity/recipe_detail_entity.dart';
import 'package:flavory/features/recipe_details/domain/repository/recipe_detail_repository.dart';

class GetDetailRecipeUsecase {
  GetDetailRecipeUsecase({required RecipeDetailRepository repository})
    : _repository = repository;
  final RecipeDetailRepository _repository;

  Future<RecipeDetailEntity> call(int id) async {
    return await _repository.getRecipeDetail(id);
  }
}
