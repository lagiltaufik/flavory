import 'package:flavory/features/home_recipes/domain/entity/home_recipes_entity.dart';
import 'package:flavory/features/home_recipes/domain/repository/home_recipes_repository.dart';

class GetHomeRecipesUsecase {
  GetHomeRecipesUsecase({required HomeRecipesRepository repository})
    : _repository = repository;
  final HomeRecipesRepository _repository;

  Future<(List<HomeRecipesEntity>, String?)> getHomeRecipes() async {
    final result = await _repository.getRecipes();
    return result;
  }
}
