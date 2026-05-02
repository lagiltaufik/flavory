import 'package:drift/drift.dart';

class RecipeTable extends Table{
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get image => text()();
  IntColumn get readyInMinutes => integer()();
  BoolColumn get glutenFree => boolean()();
  RealColumn get healthScore => real()();
  BoolColumn get vegetarian => boolean()();
  IntColumn get aggregateLikes => integer()();

  @override
  Set<Column> get primaryKey => {id};

}