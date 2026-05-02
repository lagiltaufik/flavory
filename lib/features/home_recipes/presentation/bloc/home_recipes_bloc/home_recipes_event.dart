part of 'home_recipes_bloc.dart';

@immutable
sealed class HomeRecipesEvent {
  const HomeRecipesEvent();
}

class GetHomeRecipesEvent extends HomeRecipesEvent {
  const GetHomeRecipesEvent();
}
