class IngredientModel {
  final String name;
  final String original;

  IngredientModel({
    required this.name,
    required this.original,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      name: json['name'] ?? '',
      original: json['original'] ?? '',
    );
  }
}
