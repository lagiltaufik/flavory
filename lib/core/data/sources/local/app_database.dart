import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flavory/core/data/sources/local/tables/favorite_recipes_table.dart';
import 'package:flavory/core/data/sources/local/tables/recipe_table.dart';
import 'package:flavory/core/data/sources/local/tables/favorites_counter_table.dart';
import 'package:path_provider/path_provider.dart';
part 'app_database.g.dart';

@DriftDatabase(tables: [RecipeTable, FavoriteRecipesTable, FavoritesCounterTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase._([QueryExecutor? executor])
    : super(executor ?? _openConnection());

  static AppDatabase? instance;

  factory AppDatabase([QueryExecutor? executor]) {
    instance ??= AppDatabase._(executor);

    return instance!;
  }


  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'app_db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
  
  @override
  int get schemaVersion => 3;

  
}


