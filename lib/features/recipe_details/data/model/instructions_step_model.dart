class InstructionsStepModel {
  final int number;
  final String step;

  InstructionsStepModel({
    required this.number,
    required this.step,
  });

  factory InstructionsStepModel.fromJson(Map<String, dynamic> json) {
    return InstructionsStepModel(
      number: json['number'] ?? 0,
      step: json['step'] ?? '',
    );
  }
}
