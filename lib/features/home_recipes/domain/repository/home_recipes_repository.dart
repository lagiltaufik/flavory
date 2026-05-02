import 'package:flavory/features/home_recipes/domain/entity/home_recipes_entity.dart';

abstract interface class HomeRecipesRepository {
  Future<(List<HomeRecipesEntity>, String?)> getRecipes();
}
