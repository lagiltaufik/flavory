import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flavory/core/utils/failure/failure.dart';
import 'package:flavory/core/utils/statuses/statuses.dart';
import 'package:flavory/features/search/domain/entity/search_recipe_entity.dart';
import 'package:flavory/features/search/domain/search_filter.dart';
import 'package:flavory/features/search/domain/usecase/search_recipes_usecase.dart';
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
    on<UpdateFilterEvent>(_onUpdateFilter);
    on<LoadInitialRecipesEvent>(_onLoadInitialEvent);
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

  Future<void> _onUpdateFilter(
    UpdateFilterEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(filter: event.filter));

    add(SearchRecipesEvent(state.query));
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

  // String _mapError(dynamic e) {
  //   // final error = (e is DioException) ? e.error : e;
  //   if (e is Failure) return e.message;
  //   return e.toString();
  // }

  String _mapError(dynamic e) {
    final error = (e is DioException) ? e.error : e;
    if (error is Failure) return error.message;
    return e.toString();
  }
}

// String message;
//       final error = (e is DioException) ? e.error : e;
//       if (error is Failure) {
//         message = error.message;
//       } else {
//         message = e.toString();
//       }
