import 'package:flavory/features/recipe_details/data/mapper/instructions_step_mapper.dart';
import 'package:flavory/features/recipe_details/data/model/analized_instruction_model.dart';
import 'package:flavory/features/recipe_details/domain/entity/analized_instruction_entity.dart';

extension AnalyzedInstructionMapper on AnalizedInstructionModel {
  AnalizedInstructionEntity toEntity() {
    return AnalizedInstructionEntity(
      steps: steps.map((e) => e.toEntity()).toList(),
    );
  }
}
