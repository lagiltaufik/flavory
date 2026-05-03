class SearchRecipeModel {
  final int id;
  final String title;
  final String image;

  SearchRecipeModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory SearchRecipeModel.fromJson(Map<String, dynamic> json) {
    return SearchRecipeModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
    );
  }
}
