import 'package:flavory/features/recipe_details/domain/entity/analized_instruction_entity.dart';
import 'package:flavory/features/recipe_details/domain/entity/ingredient_entity.dart';
import 'package:flavory/features/recipe_details/domain/entity/instructions_step_entity.dart';

class RecipeDetailEntity {
  final int id;
  final String title;
  final String image;
  final int readyInMinutes;

  final List<AnalizedInstructionEntity> analyzedInstructions;
  final List<IngredientEntity> extendedIngredients;

  final double healthScore;
  final int aggregateLikes;

  final bool vegetarian;
  final bool vegan;
  final bool glutenFree;
  final List<InstructionsStepEntity> steps;

  RecipeDetailEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.analyzedInstructions,
    required this.extendedIngredients,
    required this.healthScore,
    required this.aggregateLikes,
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
    required this.steps,
  });
}
