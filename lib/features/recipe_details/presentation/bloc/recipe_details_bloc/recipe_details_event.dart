part of 'recipe_details_bloc.dart';

@immutable
sealed class RecipeDetailsEvent {
  const RecipeDetailsEvent();
}

class GetRecipeDetailEvent extends RecipeDetailsEvent {
  final int id;
  final String userId;
  const GetRecipeDetailEvent(
    this.id,
    this.userId);
}

class ToggleFavoriteEvent extends RecipeDetailsEvent {
  const ToggleFavoriteEvent();
}

class ToggleCookedEvent extends RecipeDetailsEvent {
  final bool isCooked;
  const ToggleCookedEvent(this.isCooked);
}

class RequireAuthEvent extends RecipeDetailsEvent {}
