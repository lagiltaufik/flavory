import 'package:drift/drift.dart';
import 'package:flavory/core/data/sources/local/app_database.dart';
import 'package:flavory/features/profile/data/model/favorites_list_model.dart';

abstract interface class FavoritesListLocal {
  Stream<List<FavoritesListModel>> watchFavorites({
    required String userId,
  });
  Future<void> updateIsCooked(int id, String userId, bool isCooked);
  Future<void> removeFavorite({required int id, required String userId});
  
}

class FavoritesListLocalImpl implements FavoritesListLocal {
  final AppDatabase _db;

  FavoritesListLocalImpl({required AppDatabase db}) : _db = db;

  @override
  Stream<List<FavoritesListModel>> watchFavorites({
    required String userId,
  }) {
    return (_db.select(
      _db.favoriteRecipesTable,
    )..where((tbl) => tbl.userId.equals(userId))).watch().map(
      (data) => data
          .map(
            (e) => FavoritesListModel(
              id: e.id,
              userId: e.userId,
              title: e.title,
              image: e.image,
              isCooked: e.isCooked,
              healthScore: e.healthScore,
              likes: e.likes,
            ),
          )
          .toList(),
    );
  }

  @override
  Future<void> updateIsCooked(int id, String userId, bool isCooked) async {
    await (_db.update(_db.favoriteRecipesTable)
          ..where((tbl) => tbl.id.equals(id) & tbl.userId.equals(userId)))
        .write(FavoriteRecipesTableCompanion(isCooked: Value(isCooked)));
  }

  @override
  Future<void> removeFavorite({required int id, required String userId}) async {
    await (_db.delete(
      _db.favoriteRecipesTable,
    )..where((tbl) => tbl.id.equals(id) & tbl.userId.equals(userId))).go();
  }

  
}
