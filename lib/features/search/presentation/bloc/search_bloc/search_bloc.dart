import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flavory/core/utils/failure/failure.dart';
import 'package:flavory/core/utils/statuses/statuses.dart';
import 'package:flavory/features/search/domain/entity/search_recipe_entity.dart';
import 'package:flavory/features/search/domain/search_filter.dart';
import 'package:flavory/features/search/domain/usecase/search_recipes_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRecipesUsecase _usecase;
  SearchBloc({required SearchRecipesUsecase usecase})
    : _usecase = usecase,
      super(SearchState()) {
    on<SearchRecipesEvent>(_onSearch);
    on<LoadMoreRecipesEvent>(_onLoadMore);
    on<LoadInitialRecipesEvent>(_onLoadInitialEvent);
    on<ApplyFilterEvent>(_onApplyFilter);
    on<ToggleDietEvent>(_onToggleDiet);
    on<ToggleCuisineEvent>(_onToggleCuisine);
    on<ToggleIntolearnceEvent>(_onToggleIntolerance);
    on<SelectTypeEvent>(_onSelectType);
    on<SelectSortEvent>(_onSelectSort);
    on<SetMinCaloriesEvent>(_onMinCalories);
    on<SetMaxCaloriesEvent>(_onMaxCalories);
  }

  Future<void> _onSearch(
    SearchRecipesEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(
      state.copyWith(
        status: .loading,
        query: event.query,
        error: null,
        hasReachedMax: false,
        recipes: [],
      ),
    );

    if (event.query.isEmpty) {
      add(const LoadInitialRecipesEvent());
    }

    try {
      final result = await _usecase.call(
        query: event.query,
        filter: state.filter,
        offset: 0,
      );
      emit(
        state.copyWith(
          status: .success,
          recipes: result,
          hasReachedMax: result.length < 20,
        ),
      );
    } catch (e) {
      final message;
      e is Failure ? message = e.message : message = e.toString();

      emit(state.copyWith(status: .error, error: message));
    }
  }

  Future<void> _onLoadMore(
    LoadMoreRecipesEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (state.isLoadingMore || state.hasReachedMax) return;

    emit(state.copyWith(isLoadingMore: true));
    try {
      final result = await _usecase.call(
        query: state.query,
        filter: state.filter,
        offset: state.recipes.length,
      );
      emit(
        state.copyWith(
          recipes: [...state.recipes, ...result],
          isLoadingMore: false,
          hasReachedMax: result.length < 20,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: .error,
          isLoadingMore: false,
          error: _mapError(e),
        ),
      );
    }
  }

  Future<void> _onLoadInitialEvent(
    LoadInitialRecipesEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(
      state.copyWith(
        status: .loading,
        query: "",
        error: null,
        recipes: [],
        hasReachedMax: false,
      ),
    );

    try {
      final result = await _usecase.call(
        query: "",
        filter: state.filter,
        offset: 0,
      );
      emit(
        state.copyWith(
          status: .success,
          recipes: result,
          hasReachedMax: result.length < 20,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: .error, error: _mapError(e)));
    }
  }

  void _onApplyFilter(ApplyFilterEvent event, Emitter<SearchState> emit) {
    add(SearchRecipesEvent(state.query));
  }

  void _onToggleDiet(ToggleDietEvent event, Emitter<SearchState> emit) {
    final list = List<String>.from(state.filter.diets);

    list.contains(event.diet) ? list.remove(event.diet) : list.add(event.diet);

    emit(state.copyWith(filter: state.filter.copyWith(diets: list)));
  }

  void _onToggleCuisine(
    ToggleCuisineEvent event,
    Emitter<SearchState> emit,
  ) {
    final list = List<String>.from(state.filter.cuisines);
    list.contains(event.cuisine)
        ? list.remove(event.cuisine)
        : list.add(event.cuisine);
    emit(state.copyWith(filter: state.filter.copyWith(cuisines: list)));
  }

  void _onToggleIntolerance(
    ToggleIntolearnceEvent event,
    Emitter<SearchState> emit,
  ) {
    final list = List<String>.from(state.filter.intolerances);

    list.contains(event.intolerance)
        ? list.remove(event.intolerance)
        : list.add(event.intolerance);

    emit(
      state.copyWith(
        filter: state.filter.copyWith(intolerances: list),
      ),
    );
  }

  void _onSelectType(SelectTypeEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(filter: state.filter.copyWith(type: event.type)));
  }

  void _onSelectSort(SelectSortEvent event, Emitter<SearchState> emit) {
    emit(
      state.copyWith(
        filter: state.filter.copyWith(sort: event.sort),
      ),
    );
  }

  void _onMinCalories(SetMinCaloriesEvent event, Emitter<SearchState> emit) {
    emit(
      state.copyWith(
        filter: state.filter.copyWith(minCalories: event.minCalories),
      ),
    );
  }

  void _onMaxCalories(SetMaxCaloriesEvent event, Emitter<SearchState> emit) {
    emit(
      state.copyWith(
        filter: state.filter.copyWith(maxCalories: event.maxCalories),
      ),
    );
  }

  String _mapError(dynamic e) {
    final error = (e is DioException) ? e.error : e;
    if (error is Failure) return error.message;
    return e.toString();
  }
}
