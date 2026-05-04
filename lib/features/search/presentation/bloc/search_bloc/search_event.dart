part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {
  const SearchEvent();
}

class SearchRecipesEvent extends SearchEvent {
  const SearchRecipesEvent(this.query);
  final String query;
}

class LoadMoreRecipesEvent extends SearchEvent {
  const LoadMoreRecipesEvent();
}

class LoadInitialRecipesEvent extends SearchEvent {
  const LoadInitialRecipesEvent();
}

class ApplyFilterEvent extends SearchEvent {
  const ApplyFilterEvent();
}

class ToggleDietEvent extends SearchEvent {
  final String diet;
  const ToggleDietEvent(this.diet);
}

class ToggleCuisineEvent extends SearchEvent {
  final String cuisine;
  const ToggleCuisineEvent(this.cuisine);
}

class ToggleIntolearnceEvent extends SearchEvent {
  final String intolerance;
  const ToggleIntolearnceEvent(this.intolerance);
}

class SelectTypeEvent extends SearchEvent {
  final String type;
  const SelectTypeEvent(this.type);
}

class SelectSortEvent extends SearchEvent {
  final String sort;
  const SelectSortEvent(this.sort);
}

class SetMinCaloriesEvent extends SearchEvent {
  final int? minCalories;
  const SetMinCaloriesEvent(this.minCalories);
}

class SetMaxCaloriesEvent extends SearchEvent {
  final int? maxCalories;
  const SetMaxCaloriesEvent(this.maxCalories);
}
