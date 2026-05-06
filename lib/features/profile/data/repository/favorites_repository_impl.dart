import 'package:flavory/features/profile/data/mapper/favorites_list_mapper.dart';
import 'package:flavory/features/profile/data/source/local/favorites_list_local.dart';
import 'package:flavory/features/profile/domain/entity/favorites_list_entity.dart';
import 'package:flavory/features/profile/domain/repository/favorites_list_repository.dart';

class FavoritesRepositoryImpl implements FavoritesListRepository {
  FavoritesRepositoryImpl({required FavoritesListLocal local}) : _local = local;
  final FavoritesListLocal _local;
  @override
  Stream<List<FavoritesListEntity>> watchFavorites(String userId) {
    final data = _local.watchFavorites(userId: userId);
    return data.map((k) => k.map((e) => e.toEntity()).toList());
  }

  @override
  Future<void> updateIsCooked(int id, String userId, bool isCooked) async {
    await _local.updateIsCooked(id, userId, isCooked);
  }

  @override
  Future<void> removeFavorite({required int id, required String userId}) async {
    await _local.removeFavorite(id: id, userId: userId);
  }

  
}
