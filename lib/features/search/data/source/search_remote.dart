import 'package:flavory/core/data/sources/remote/http_client.dart';
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
  SearchRemoteImpl({required HttpClient httpClient}) : _httpClient = httpClient;
  final HttpClient _httpClient;
  @override
  Future<List<SearchRecipeModel>> search({
    required String? query,
    required SearchFilter filter,
    required int offset,
  }) async {
    final responce = await _httpClient.http.get(
      "/recipes/complexSearch",
      queryParameters: {
        "query": query,
        "number": 20,
        "offset": offset,
        "diet": filter.diets.join(","),
        "cuisine": filter.cuisines.join(","),
        "intolerances": filter.intolerances.join(","),
        "type": filter.type,
        "minCalories": filter.minCalories,
        "maxCalories": filter.maxCalories,
        "sort": _mapSort(filter.sort),
      }..removeWhere((k, v) => v == null || k == ""),
    );
    final list = responce.data['results'] as List;
    return list.map((e) => SearchRecipeModel.fromJson(e)).toList();
  }

  String _mapSort(String sort) {
    switch (sort) {
      case "Popularity":
        return "popularity";
      case "Healthiness":
        return "healthiness";
      case "Cooking time":
        return "time";
      default:
        return "popularity";
    }
  }
}
