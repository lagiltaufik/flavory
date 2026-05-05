import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flavory/core/utils/failure/failure.dart';
import 'package:flavory/core/utils/statuses/statuses.dart';
import 'package:flavory/features/recipe_details/domain/entity/recipe_detail_entity.dart';
import 'package:flavory/features/recipe_details/domain/usecase/get_detail_recipe_usecase.dart';
import 'package:meta/meta.dart';

part 'recipe_details_event.dart';
part 'recipe_details_state.dart';

class RecipeDetailsBloc extends Bloc<RecipeDetailsEvent, RecipeDetailsState> {
  final GetDetailRecipeUsecase _usecase;
  RecipeDetailsBloc({required GetDetailRecipeUsecase usecase})
    : _usecase = usecase,
      super(RecipeDetailsState()) {
    on<GetRecipeDetailEvent>(_onGetRecipesDetail);
  }

  Future<void> _onGetRecipesDetail(
    GetRecipeDetailEvent event,
    Emitter<RecipeDetailsState> emit,
  ) async {
    log("DETAIL BLOC STARTED");

    emit(state.copyWith(status: Statuses.loading, error: null));

    try {
      final recipe = await _usecase.call(event.id);
      final list = [];
      if (recipe.glutenFree == true) list.add("Gluten free");
      if (recipe.vegan == true) list.add("Vegan");
      if (recipe.vegetarian == true) list.add("Vegetarian");
      emit(
        state.copyWith(
          status: Statuses.success,
          recipe: recipe,
          dietType: list,
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
}
