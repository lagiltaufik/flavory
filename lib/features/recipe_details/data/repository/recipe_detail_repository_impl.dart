import 'package:flavory/features/recipe_details/data/mapper/recipe_detail_mapper.dart';
import 'package:flavory/features/recipe_details/data/source/remote/detail_remote.dart';
import 'package:flavory/features/recipe_details/domain/entity/recipe_detail_entity.dart';
import 'package:flavory/features/recipe_details/domain/repository/recipe_detail_repository.dart';

class RecipeDetailRepositoryImpl implements RecipeDetailRepository {
  RecipeDetailRepositoryImpl({required DetailRemote remote}) : _remote = remote;
  final DetailRemote _remote;
  @override
  Future<RecipeDetailEntity> getRecipeDetail(int id) async {
    final responce = await _remote.getRecipeDetail(id);
    return responce.toEntity();
  }
}
