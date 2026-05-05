part of 'recipe_details_bloc.dart';

@immutable
final class RecipeDetailsState {
  const RecipeDetailsState({
    this.status = .initial,
    this.recipe,
    this.error,
    this.dietType = const [],
    this.isFavorite = false,
    this.isCooked = false,
    this.requireAuth = false
  });
  final RecipeDetailEntity? recipe;
  final Statuses status;
  final String? error;
  final List dietType;
  final bool isFavorite;
  final bool isCooked;
  final bool requireAuth;

  RecipeDetailsState copyWith({
    RecipeDetailEntity? recipe,
    Statuses? status,
    String? error,
    List? dietType,
    bool? isFavorite,
    bool? isCooked,
    bool? requireAuth
  }) {
    return RecipeDetailsState(
      recipe: recipe ?? this.recipe,
      status: status ?? this.status,
      error: error ?? this.error,
      dietType: dietType ?? this.dietType,
      isFavorite: isFavorite ?? this.isFavorite,
      isCooked: isCooked ?? this.isCooked,
      requireAuth: requireAuth?? this.requireAuth
    );
  }
}
