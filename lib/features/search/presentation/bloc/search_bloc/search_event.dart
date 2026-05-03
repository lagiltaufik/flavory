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

class UpdateFilterEvent extends SearchEvent {
  const UpdateFilterEvent(this.filter);
  final SearchFilter filter;
}

class LoadInitialRecipesEvent extends SearchEvent {
  const LoadInitialRecipesEvent();
}
