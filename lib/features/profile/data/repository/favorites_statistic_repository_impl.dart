import 'package:flavory/features/profile/data/source/local/favorites_statistic_local.dart';
import 'package:flavory/features/profile/domain/repository/favorites_statistic_repository.dart';

class FavoritesStatisticRepositoryImpl implements FavoritesStatisticRepository {
  FavoritesStatisticRepositoryImpl({required FavoritesStatisticLocal local})
    : _local = local;
  final FavoritesStatisticLocal _local;
  @override
  Future<List<DateTime>> getFavoritesCount(String userId) async {
    return await _local.getFavoritesCount(userId);
  }
}
