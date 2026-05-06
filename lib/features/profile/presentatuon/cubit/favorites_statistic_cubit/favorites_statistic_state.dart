part of 'favorites_statistic_cubit.dart';

@immutable
final class FavoritesStatisticState {
  final List<FlSpot> spots;
  final Statuses status;
  final String? error;

  const FavoritesStatisticState({
    this.spots = const [],
    this.status = Statuses.initial,
    this.error,
  });

  FavoritesStatisticState copyWith({
    List<FlSpot>? spots,
    Statuses? status,
    String? error,
  }) {
    return FavoritesStatisticState(
      spots: spots ?? this.spots,
      status: status ?? this.status,
      error: error,
    );
  }

  bool get isLoading => status == Statuses.loading;
  bool get isSuccess => status == Statuses.success;
  bool get isError => status == Statuses.error;
}
