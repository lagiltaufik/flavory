import 'package:flavory/core/data/sources/remote/http_client.dart';
import 'package:flavory/features/home_recipes/data/model/home_recipes_model.dart';

abstract interface class RecipesRemote {
  Future<List<HomeRecipesModel>> getRecipes();
}

class RecipesRemoteImpl implements RecipesRemote {
  RecipesRemoteImpl({required HttpClient httpClient})
    : _httpClient = httpClient;
  final HttpClient _httpClient;
  @override
  Future<List<HomeRecipesModel>> getRecipes() async {
    final responce = await _httpClient.http.get(
      "/recipes/random",
      queryParameters: {"number": 100},
    );
    final List<dynamic> list = responce.data['recipes'];
    return list.map((e) => HomeRecipesModel.fromJson(e)).toList();
  }
}
