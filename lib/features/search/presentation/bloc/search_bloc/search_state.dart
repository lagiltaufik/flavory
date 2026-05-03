part of 'search_bloc.dart';

@immutable
final class SearchState {
  SearchState({
    this.status = .initial,
    this.filter = const SearchFilter(),
    this.recipes = const [],
    this.query = "",
    this.error,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
  });
  final Statuses status;
  final List<SearchRecipeEntity> recipes;
  final SearchFilter filter;
  final String query;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final String? error;

  SearchState copyWith({
    Statuses? status,
    List<SearchRecipeEntity>? recipes,
    SearchFilter? filter,
    String? query,
    bool? isLoadingMore,
    bool? hasReachedMax,
    String? error,
  }) {
    return SearchState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
      filter: filter ?? this.filter,
      query: query ?? this.query,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      error: error,
    );
  }
}
