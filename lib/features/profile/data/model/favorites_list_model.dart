class FavoritesListModel {
  final int id;
  final String userId;
  final String title;
  final String image;
  final bool isCooked;
  final double healthScore;
  final int likes;

  FavoritesListModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.image,
    required this.isCooked,
    required this.healthScore,
    required this.likes,
  });

  factory FavoritesListModel.fromJson(Map<String, dynamic> json) {
    return FavoritesListModel(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      image: json["image"],
      isCooked: json["isCooked"],
      healthScore: json["healthScore"],
      likes: json["likes"],
    );
  }
}
