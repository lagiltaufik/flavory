import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recipe_details_event.dart';
part 'recipe_details_state.dart';

class RecipeDetailsBloc extends Bloc<RecipeDetailsEvent, RecipeDetailsState> {
  RecipeDetailsBloc() : super(RecipeDetailsInitial()) {
    on<RecipeDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
