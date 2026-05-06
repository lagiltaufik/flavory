import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flavory/core/services/auth_service.dart';
import 'package:flavory/core/utils/failure/failure.dart';
import 'package:flavory/core/utils/statuses/statuses.dart';
import 'package:flavory/features/recipe_details/data/mapper/favorite_recipe_mapper.dart';
import 'package:flavory/features/recipe_details/domain/entity/fav_counter_req_param_entity.dart';
import 'package:flavory/features/recipe_details/domain/entity/recipe_detail_entity.dart';
import 'package:flavory/features/recipe_details/domain/repository/favorite_repository.dart';
import 'package:flavory/features/recipe_details/domain/usecase/get_detail_recipe_usecase.dart';
import 'package:meta/meta.dart';

part 'recipe_details_event.dart';
part 'recipe_details_state.dart';

class RecipeDetailsBloc extends Bloc<RecipeDetailsEvent, RecipeDetailsState> {
  final GetDetailRecipeUsecase _usecase;
  final FavoriteRepository _repository;
  final AuthService _authService;

  RecipeDetailsBloc({
    required GetDetailRecipeUsecase usecase,
    required FavoriteRepository repository,
    required AuthService authService,
  }) : _usecase = usecase,
       _repository = repository,
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
      final isfav = await _repository.isFavorite(event.id);

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
        await _repository.removeFavorite(
          recipeId: recipe.id,
          userId: user.uid,
        );
        emit(state.copyWith(isFavorite: false, isCooked: false));
      } else {
        await _repository.addFavorite(
          recipe.toCompanion(userId: user.uid, isCooked: state.isCooked),
        );

        final now = DateTime.now();
        final FavCounterReqParamEntity param = (
          recipeId: recipe.id,
          userId: user.uid,
          createdAt: now,
        );
        await _repository.countFavorites(param);
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
      final isFav = await _repository.isFavorite(recipe.id);
      if (!isFav) {
        await _repository.addFavorite(
          recipe.toCompanion(userId: user.uid, isCooked: event.isCooked),
        );
        final now = DateTime.now();
        final FavCounterReqParamEntity param = (
          recipeId: recipe.id,
          userId: user.uid,
          createdAt: now,
        );
        emit(state.copyWith(isFavorite: true));

        await _repository.updateCookedStatus(recipe.id, event.isCooked);
        emit(state.copyWith(isCooked: event.isCooked));
      }
      if (isFav) {
        await _repository.updateCookedStatus(recipe.id, event.isCooked);
        emit(state.copyWith(isCooked: event.isCooked));
      }
    } catch (e) {
      emit(state.copyWith(status: .error, error: e.toString()));
    }
  }
}
