part of 'recipe_details_bloc.dart';

@immutable
final class RecipeDetailsState {
  const RecipeDetailsState({
    this.status = .initial,
    this.recipe,
    this.error,
    this.dietType = const [],
  });
  final RecipeDetailEntity? recipe;
  final Statuses status;
  final String? error;
  final List dietType;

  RecipeDetailsState copyWith({
    RecipeDetailEntity? recipe,
    Statuses? status,
    String? error,
    List? dietType,
  }) {
    return RecipeDetailsState(
      recipe: recipe ?? this.recipe,
      status: status ?? this.status,
      error: error ?? this.error,
      dietType: dietType ?? this.dietType,
    );
  }
}
