import 'package:dio/dio.dart';
import 'package:flavory/core/utils/failure/failure.dart';
import 'package:flavory/features/home_recipes/data/mapper/home_recipe_mapper.dart';
import 'package:flavory/features/home_recipes/data/source/recipes_local.dart';
import 'package:flavory/features/home_recipes/data/source/recipes_remote.dart';
import 'package:flavory/features/home_recipes/domain/entity/home_recipes_entity.dart';
import 'package:flavory/features/home_recipes/domain/repository/home_recipes_repository.dart';

class HomeRecipesRepositoryImpl implements HomeRecipesRepository {
  HomeRecipesRepositoryImpl({
    required RecipesLocal local,
    required RecipesRemote remote,
  }) : _local = local,
       _remote = remote;

  final RecipesLocal _local;
  final RecipesRemote _remote;
  @override
  Future<(List<HomeRecipesEntity>, String?)> getRecipes() async {
    try {
      final remoteRecipes = await _remote.getRecipes();
      await _local.cacheRecipes(remoteRecipes);
      return (remoteRecipes.map((e) => e.toEntity()).toList(), null);
    } catch (e) {
      final cached = await _local.getRecipes();

      String message;
      final error = (e is DioException) ? e.error : e;
      if (error is Failure) {
        message = error.message;
      } else {
        message = e.toString();
      }

      if (cached.isNotEmpty) {
        return (cached.map((e) => e.toEntity()).toList(), message);
      }

      throw e;
      // if (cached.isNotEmpty) return cached.map((e)=>e.toEntity()).toList();
      // rethrow;
    }
  }
}
