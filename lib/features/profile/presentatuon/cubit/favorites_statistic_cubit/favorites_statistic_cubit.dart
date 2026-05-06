import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flavory/core/utils/statuses/statuses.dart';
import 'package:flavory/features/profile/domain/repository/favorites_statistic_repository.dart';
import 'package:meta/meta.dart';

part 'favorites_statistic_state.dart';

class FavoritesStatisticCubit extends Cubit<FavoritesStatisticState> {
  FavoritesStatisticCubit({required FavoritesStatisticRepository repo})
    : _repo = repo,
      super(FavoritesStatisticState());

  final FavoritesStatisticRepository _repo;

  Future<void> load(String userId) async {
    emit(state.copyWith(status: Statuses.loading, error: null));

    try {
      final events = await _repo.getFavoritesCount(userId);

      final grouped = _groupByDay(events);
      final spots = _toSpots(grouped);

      emit(
        state.copyWith(
          spots: spots,
          status: Statuses.success,
        ),
      );
      log("spots: $spots");
    } catch (e) {
      emit(
        state.copyWith(
          status: Statuses.error,
          error: e.toString(),
        ),
      );
    }
    ;
  }

  Map<String, int> _groupByDay(List<DateTime> dates) {
    final map = <String, int>{};

    for (final d in dates) {
      final key = "${d.year}-${d.month}-${d.day}";
      map[key] = (map[key] ?? 0) + 1;
    }

    return map;
  }

  List<FlSpot> _toSpots(Map<String, int> grouped) {
    final keys = grouped.keys.toList()..sort();

    int sum = 0;

    return List.generate(keys.length, (i) {
      sum += grouped[keys[i]]!;
      return FlSpot(i.toDouble(), sum.toDouble());
    });
  }
}
