part of 'recipe_details_bloc.dart';

@immutable
sealed class RecipeDetailsEvent {
  const RecipeDetailsEvent();
}

class GetRecipeDetailEvent extends RecipeDetailsEvent {
  final int id;

  const GetRecipeDetailEvent(this.id);
}
