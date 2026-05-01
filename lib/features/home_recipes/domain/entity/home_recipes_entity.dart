class HomeRecipesEntity {
  HomeRecipesEntity({
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
}
