import 'package:flavory/features/recipe_details/data/model/analized_instruction_model.dart';
import 'package:flavory/features/recipe_details/data/model/ingredient_model.dart';
import 'package:flavory/features/recipe_details/data/model/instructions_step_model.dart';

class RecipeDetailModel {
  final int id;
  final String title;
  final String image;
  final int readyInMinutes;

  final List<IngredientModel> extendedIngredients;
  final List<AnalizedInstructionModel> analyzedInstructions;

  final double healthScore;
  final int aggregateLikes;

  final bool vegetarian;
  final bool vegan;
  final bool glutenFree;

  List<InstructionsStepModel> get steps =>
      analyzedInstructions.isNotEmpty ? analyzedInstructions.first.steps : [];

  RecipeDetailModel({
    required this.id,
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.extendedIngredients,
    required this.analyzedInstructions,
    required this.healthScore,
    required this.aggregateLikes,
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      readyInMinutes: json['readyInMinutes'] ?? 0,

      extendedIngredients: (json['extendedIngredients'] as List? ?? [])
          .map((e) => IngredientModel.fromJson(e))
          .toList(),

      analyzedInstructions: (json['analyzedInstructions'] as List? ?? [])
          .map((e) => AnalizedInstructionModel.fromJson(e))
          .toList(),

      healthScore: (json['healthScore'] ?? 0).toDouble(),
      aggregateLikes: json['aggregateLikes'] ?? 0,

      vegetarian: json['vegetarian'] ?? false,
      vegan: json['vegan'] ?? false,
      glutenFree: json['glutenFree'] ?? false,
    );
  }
}
