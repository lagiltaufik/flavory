import 'package:flavory/features/search/domain/entity/search_recipe_entity.dart';
import 'package:flavory/features/search/domain/search_filter.dart';

abstract interface class SearchRepository {
  Future<List<SearchRecipeEntity>> search({
    required String query,
    required SearchFilter filter,
    required int offset,
  });
}
