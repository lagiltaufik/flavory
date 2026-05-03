import 'package:flavory/features/search/data/source/search_remote.dart';
import 'package:flavory/features/search/domain/entity/search_recipe_entity.dart';
import 'package:flavory/features/search/domain/repository/search_repository.dart';
import 'package:flavory/features/search/domain/search_filter.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({required SearchRemote remote}) : _remote = remote;
  final SearchRemote _remote;
  @override
  Future<List<SearchRecipeEntity>> search({
    required String query,
    required SearchFilter filter,
    required int offset,
  }) async {
    final list = await _remote.search(query: query, filter: filter, offset: offset,);
    return await 
  }
}
