import 'package:flavory/features/recipe_details/data/model/instructions_step_model.dart';
import 'package:flavory/features/recipe_details/domain/entity/instructions_step_entity.dart';

extension InstructionsStepMapper on InstructionsStepModel {
  InstructionsStepEntity toEntity() {
    return InstructionsStepEntity(number: number, step: step);
  }
}
