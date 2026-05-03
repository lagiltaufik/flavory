import 'package:flavory/features/search/data/model/search_recipe_model.dart';
import 'package:flavory/features/search/domain/search_filter.dart';

abstract interface class SearchRemote {
  Future<List<SearchRecipeModel>> search({
    required String? query,
    required SearchFilter filter,
    required int offset,
  });
}

class SearchRemoteImpl implements SearchRemote {
  @override
  Future<List<SearchRecipeModel>> search({
    required String? query,
    required SearchFilter filter,
    required int offset,
  }) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
