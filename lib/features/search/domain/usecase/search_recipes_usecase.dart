import 'package:flavory/features/search/domain/entity/search_recipe_entity.dart';
import 'package:flavory/features/search/domain/repository/search_repository.dart';
import 'package:flavory/features/search/domain/search_filter.dart';

class SearchRecipesUsecase {
  SearchRecipesUsecase({required SearchRepository repository})
    : _repository = repository;
  final SearchRepository _repository;

  Future<List<SearchRecipeEntity>> call({
    required String query,
    required SearchFilter filter,
    required int offset,
  }) async {
    final list = await _repository.search(
      query: query,
      filter: filter,
      offset: offset,
    );
    return list;
  }
}
