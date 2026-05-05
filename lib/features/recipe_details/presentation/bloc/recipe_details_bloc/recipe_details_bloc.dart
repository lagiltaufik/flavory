import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flavory/core/services/auth_service.dart';
import 'package:flavory/core/utils/failure/failure.dart';
import 'package:flavory/core/utils/statuses/statuses.dart';
import 'package:flavory/features/recipe_details/data/mapper/favorite_recipe_mapper.dart';
import 'package:flavory/features/recipe_details/data/source/local/favorites_local.dart';
import 'package:flavory/features/recipe_details/domain/entity/recipe_detail_entity.dart';
import 'package:flavory/features/recipe_details/domain/usecase/get_detail_recipe_usecase.dart';
import 'package:meta/meta.dart';

part 'recipe_details_event.dart';
part 'recipe_details_state.dart';

class RecipeDetailsBloc extends Bloc<RecipeDetailsEvent, RecipeDetailsState> {
  final GetDetailRecipeUsecase _usecase;
  final FavoritesLocal _favoritesLocal;
  final AuthService _authService;

  RecipeDetailsBloc({
    required GetDetailRecipeUsecase usecase,
    required FavoritesLocal favoritesLocal,
    required AuthService authService,
  }) : _usecase = usecase,
       _favoritesLocal = favoritesLocal,
       _authService = authService,
       super(RecipeDetailsState()) {
    on<GetRecipeDetailEvent>(_onGetRecipesDetail);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
    on<ToggleCookedEvent>(_onToggleCooked);
  }

  Future<void> _onGetRecipesDetail(
    GetRecipeDetailEvent event,
    Emitter<RecipeDetailsState> emit,
  ) async {
    log("DETAIL BLOC STARTED");

    emit(state.copyWith(status: Statuses.loading, error: null));

    try {
      final recipe = await _usecase.call(event.id);
      final isfav = await _favoritesLocal.isFavorite(event.id);

      final list = [];
      if (recipe.glutenFree == true) list.add("Gluten free");
      if (recipe.vegan == true) list.add("Vegan");
      if (recipe.vegetarian == true) list.add("Vegetarian");
      emit(
        state.copyWith(
          status: Statuses.success,
          recipe: recipe,
          dietType: list,
          isFavorite: isfav,
        ),
      );
    } catch (e) {
      String message;

      final error = (e is DioException) ? e.error : e;

      if (error is Failure) {
        message = error.message;
      } else {
        message = e.toString();
      }

      emit(
        state.copyWith(
          status: Statuses.error,
          error: message,
        ),
      );

      log("DETAIL ERROR: $message");
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavoriteEvent event,
    Emitter<RecipeDetailsState> emit,
  ) async {
    final user = _authService.currentUser;

    if (user == null) {
      emit(state.copyWith(requireAuth: true));
      return;
    }

    final recipe = state.recipe;
    if (recipe == null) return;
    final isFav = state.isFavorite;

    try {
      if (isFav) {
        await _favoritesLocal.removeFavorite(
          recipeId: recipe.id,
          userId: user.uid,
        );
        emit(state.copyWith(isFavorite: false, isCooked: false));
      } else {
        await _favoritesLocal.addFavorite(
          recipe.toCompanion(userId: user.uid, isCooked: state.isCooked),
        );
        emit(state.copyWith(isFavorite: true));
      }
    } catch (e) {
      emit(state.copyWith(status: .error, error: e.toString()));
    }
  }

  Future<void> _onToggleCooked(
    ToggleCookedEvent event,
    Emitter<RecipeDetailsState> emit,
  ) async {
    final user = _authService.currentUser;
    final recipe = state.recipe;

    if (user == null) {
      emit(state.copyWith(requireAuth: true));
      return;
    }

    if (recipe == null) return;

    try {
      final isFav = await _favoritesLocal.isFavorite(recipe.id);
      if (!isFav) {
        await _favoritesLocal.addFavorite(
          recipe.toCompanion(userId: user.uid, isCooked: event.isCooked),
        );
        emit(state.copyWith(isFavorite: true));

        await _favoritesLocal.updateCookedStatus(recipe.id, event.isCooked);
        emit(state.copyWith(isCooked: event.isCooked));
      }
    } catch (e) {
      emit(state.copyWith(status: .error, error: e.toString()));
    }
  }
}
