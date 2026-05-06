import 'package:drift/drift.dart';

@DataClassName('FavoritesCounter')
class FavoritesCounterTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get userId => text()();
  IntColumn get recipeId => integer()();

  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
