class HomeRecipesModel {
  HomeRecipesModel({
    required this.id,
    required this.title,
    required this.image,
    required this.glutenFree,
    required this.healthScore,
    required this.readyInMinutes,
    required this.vegetarian,
    required this.aggregateLikes,
  });
  final String title;
  final int id;
  final String image;
  final int readyInMinutes;
  final bool glutenFree;
  final double healthScore;
  final bool vegetarian;
  final int aggregateLikes;

  factory HomeRecipesModel.fromJson(Map<String, dynamic> json) {
    return HomeRecipesModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      glutenFree: json["glutenFree"],
      healthScore: json["healthScore"] ?? 0,
      readyInMinutes: json["readyInMinutes"],
      vegetarian: json["vegetarian"],
      aggregateLikes: json["aggregateLikes"] ?? 0,
    );
  }
}
