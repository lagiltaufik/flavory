import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flavory/core/utils/failure/failure.dart';
import 'package:flavory/core/utils/statuses/statuses.dart';
import 'package:flavory/features/home_recipes/domain/entity/home_recipes_entity.dart';
import 'package:flavory/features/home_recipes/domain/usecase/get_home_recipes_usecase.dart';
import 'package:meta/meta.dart';

part 'home_recipes_event.dart';
part 'home_recipes_state.dart';

class HomeRecipesBloc extends Bloc<HomeRecipesEvent, HomeRecipesState> {
  final GetHomeRecipesUsecase _usecase;
  HomeRecipesBloc({required GetHomeRecipesUsecase usecase})
    : _usecase = usecase,
      super(const HomeRecipesState()) {
    on<GetHomeRecipesEvent>(_onGetHomeRecipes);
  }

  _onGetHomeRecipes(
    GetHomeRecipesEvent event,
    Emitter<HomeRecipesState> emit,
  ) async {
    log("BLOC STARTED");
    emit(state.copuWith(status: Statuses.loading, error: null));
    try {
      final (recipes, errorMessage) = await _usecase.getHomeRecipes();
      final sections = {
        "popular": recipes.where((e) => e.aggregateLikes >= 80).toList(),
        "quick": recipes.where((e) => e.readyInMinutes <= 40).toList(),
        "healthy": recipes.where((e) => e.healthScore >= 60).toList(),
        "vegetarian": recipes.where((e) => e.vegetarian == true).toList(),
      };

      emit(
        state.copuWith(
          status: .success,
          sections: sections,
          error: errorMessage,
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

      emit(state.copuWith(status: .error, error: message));
      log("STATE AFTER ERROR");
      log(name: "status", "$Statuses.error");
      log(name: "error", message);
    }
  }
}
