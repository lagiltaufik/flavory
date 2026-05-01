import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_recipes_event.dart';
part 'home_recipes_state.dart';

class HomeRecipesBloc extends Bloc<HomeRecipesEvent, HomeRecipesState> {
  HomeRecipesBloc() : super(HomeRecipesInitial()) {
    on<HomeRecipesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
