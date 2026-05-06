import 'package:flavory/core/data/sources/local/app_database.dart';

abstract interface class FavoritesStatisticLocal {
  Future<List<DateTime>> getFavoritesCount(String userId);
}

class FavoritesStatisticLocalImpl implements FavoritesStatisticLocal {
  final AppDatabase _db;
  FavoritesStatisticLocalImpl({required AppDatabase db}) : _db = db;
  @override
  Future<List<DateTime>> getFavoritesCount(String userId) async {
    final rows = await (_db.select(
      _db.favoritesCounterTable,
    )..where((t) => t.userId.equals(userId))).get();

    return rows.map((e) => e.createdAt).toList();
  }
}
