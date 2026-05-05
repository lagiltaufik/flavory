import 'package:flavory/core/data/sources/remote/http_client.dart';
import 'package:flavory/features/recipe_details/data/model/recipe_detail_model.dart';

abstract interface class DetailRemote {
  Future<RecipeDetailModel> getRecipeDetail(int id);
}

class DetailRemoteImpl implements DetailRemote {
  DetailRemoteImpl({required HttpClient httpClient}) : _httpClient = httpClient;
  final HttpClient _httpClient;
  @override
  Future<RecipeDetailModel> getRecipeDetail(int id) async {
    final responce = await _httpClient.http.get("/recipes/$id/information");
    final data = responce.data as Map<String, dynamic>;
    return RecipeDetailModel.fromJson(data);
  }
}
