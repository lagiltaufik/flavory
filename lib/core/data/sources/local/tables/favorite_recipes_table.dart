import 'package:drift/drift.dart';

@DataClassName('FavoriteRecipe')
class FavoriteRecipesTable extends Table {
  IntColumn get id => integer()();
  TextColumn get userId => text()();
  TextColumn get title => text()();
  TextColumn get image => text()();

  TextColumn get instructions => text()();

  TextColumn get stepsJson => text()();
  TextColumn get ingredientsJson => text()();

  RealColumn get healthScore => real()();
  IntColumn get likes => integer()();

  BoolColumn get vegetarian => boolean()();
  BoolColumn get vegan => boolean()();
  BoolColumn get glutenFree => boolean()();
  BoolColumn get isCooked => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id, userId};
}
