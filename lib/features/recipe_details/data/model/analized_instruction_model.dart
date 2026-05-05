import 'package:flavory/features/recipe_details/data/model/instructions_step_model.dart';

class AnalizedInstructionModel {
  final List<InstructionsStepModel> steps;
  final String name;

  AnalizedInstructionModel({required this.steps, required this.name});

  factory AnalizedInstructionModel.fromJson(Map<String, dynamic> json) {
    return AnalizedInstructionModel(
      name: json['name'],
      steps: (json['steps'] as List? ?? [])
          .map((e) => InstructionsStepModel.fromJson(e))
          .toList(),
    );
  }
}
