part of 'home_recipes_bloc.dart';

@immutable
final class HomeRecipesState {
  const HomeRecipesState({
    this.sections = const {},
    this.status = Statuses.initial,
    this.error,
  });

  final Map<String, List<HomeRecipesEntity>> sections;
  final Statuses status;
  final String? error;

  HomeRecipesState copuWith({
    Statuses? status,
    Map<String, List<HomeRecipesEntity>>? sections,
    String? error,
  }) {
    return HomeRecipesState(
      sections: sections ?? this.sections,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
