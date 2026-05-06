class FavoritesListEntity {
  final int id;
  final String userId;
  final String title;
  final String image;
  final bool isCooked;
  final double healthScore;
  final int likes;

  FavoritesListEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.image,
    required this.isCooked,
    required this.healthScore,
    required this.likes,
  });
}
