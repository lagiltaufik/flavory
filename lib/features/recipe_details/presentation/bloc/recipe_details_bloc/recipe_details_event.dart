part of 'recipe_details_bloc.dart';

@immutable
sealed class RecipeDetailsEvent {
  const RecipeDetailsEvent();
}

class GetRecipeDetailEvent extends RecipeDetailsEvent {
  final int id;

  const GetRecipeDetailEvent(this.id);
}

class ToggleFavoriteEvent extends RecipeDetailsEvent {
  const ToggleFavoriteEvent();
}

class ToggleCookedEvent extends RecipeDetailsEvent {
  final bool isCooked;
  const ToggleCookedEvent(this.isCooked);
}

class RequireAuthEvent extends RecipeDetailsEvent {}
