// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RecipeTableTable extends RecipeTable
    with TableInfo<$RecipeTableTable, RecipeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _readyInMinutesMeta = const VerificationMeta(
    'readyInMinutes',
  );
  @override
  late final GeneratedColumn<int> readyInMinutes = GeneratedColumn<int>(
    'ready_in_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _glutenFreeMeta = const VerificationMeta(
    'glutenFree',
  );
  @override
  late final GeneratedColumn<bool> glutenFree = GeneratedColumn<bool>(
    'gluten_free',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("gluten_free" IN (0, 1))',
    ),
  );
  static const VerificationMeta _healthScoreMeta = const VerificationMeta(
    'healthScore',
  );
  @override
  late final GeneratedColumn<double> healthScore = GeneratedColumn<double>(
    'health_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vegetarianMeta = const VerificationMeta(
    'vegetarian',
  );
  @override
  late final GeneratedColumn<bool> vegetarian = GeneratedColumn<bool>(
    'vegetarian',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("vegetarian" IN (0, 1))',
    ),
  );
  static const VerificationMeta _aggregateLikesMeta = const VerificationMeta(
    'aggregateLikes',
  );
  @override
  late final GeneratedColumn<int> aggregateLikes = GeneratedColumn<int>(
    'aggregate_likes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    image,
    readyInMinutes,
    glutenFree,
    healthScore,
    vegetarian,
    aggregateLikes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('ready_in_minutes')) {
      context.handle(
        _readyInMinutesMeta,
        readyInMinutes.isAcceptableOrUnknown(
          data['ready_in_minutes']!,
          _readyInMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_readyInMinutesMeta);
    }
    if (data.containsKey('gluten_free')) {
      context.handle(
        _glutenFreeMeta,
        glutenFree.isAcceptableOrUnknown(data['gluten_free']!, _glutenFreeMeta),
      );
    } else if (isInserting) {
      context.missing(_glutenFreeMeta);
    }
    if (data.containsKey('health_score')) {
      context.handle(
        _healthScoreMeta,
        healthScore.isAcceptableOrUnknown(
          data['health_score']!,
          _healthScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_healthScoreMeta);
    }
    if (data.containsKey('vegetarian')) {
      context.handle(
        _vegetarianMeta,
        vegetarian.isAcceptableOrUnknown(data['vegetarian']!, _vegetarianMeta),
      );
    } else if (isInserting) {
      context.missing(_vegetarianMeta);
    }
    if (data.containsKey('aggregate_likes')) {
      context.handle(
        _aggregateLikesMeta,
        aggregateLikes.isAcceptableOrUnknown(
          data['aggregate_likes']!,
          _aggregateLikesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_aggregateLikesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      )!,
      readyInMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ready_in_minutes'],
      )!,
      glutenFree: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}gluten_free'],
      )!,
      healthScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}health_score'],
      )!,
      vegetarian: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}vegetarian'],
      )!,
      aggregateLikes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}aggregate_likes'],
      )!,
    );
  }

  @override
  $RecipeTableTable createAlias(String alias) {
    return $RecipeTableTable(attachedDatabase, alias);
  }
}

class RecipeTableData extends DataClass implements Insertable<RecipeTableData> {
  final int id;
  final String title;
  final String image;
  final int readyInMinutes;
  final bool glutenFree;
  final double healthScore;
  final bool vegetarian;
  final int aggregateLikes;
  const RecipeTableData({
    required this.id,
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.glutenFree,
    required this.healthScore,
    required this.vegetarian,
    required this.aggregateLikes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['image'] = Variable<String>(image);
    map['ready_in_minutes'] = Variable<int>(readyInMinutes);
    map['gluten_free'] = Variable<bool>(glutenFree);
    map['health_score'] = Variable<double>(healthScore);
    map['vegetarian'] = Variable<bool>(vegetarian);
    map['aggregate_likes'] = Variable<int>(aggregateLikes);
    return map;
  }

  RecipeTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeTableCompanion(
      id: Value(id),
      title: Value(title),
      image: Value(image),
      readyInMinutes: Value(readyInMinutes),
      glutenFree: Value(glutenFree),
      healthScore: Value(healthScore),
      vegetarian: Value(vegetarian),
      aggregateLikes: Value(aggregateLikes),
    );
  }

  factory RecipeTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      image: serializer.fromJson<String>(json['image']),
      readyInMinutes: serializer.fromJson<int>(json['readyInMinutes']),
      glutenFree: serializer.fromJson<bool>(json['glutenFree']),
      healthScore: serializer.fromJson<double>(json['healthScore']),
      vegetarian: serializer.fromJson<bool>(json['vegetarian']),
      aggregateLikes: serializer.fromJson<int>(json['aggregateLikes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'image': serializer.toJson<String>(image),
      'readyInMinutes': serializer.toJson<int>(readyInMinutes),
      'glutenFree': serializer.toJson<bool>(glutenFree),
      'healthScore': serializer.toJson<double>(healthScore),
      'vegetarian': serializer.toJson<bool>(vegetarian),
      'aggregateLikes': serializer.toJson<int>(aggregateLikes),
    };
  }

  RecipeTableData copyWith({
    int? id,
    String? title,
    String? image,
    int? readyInMinutes,
    bool? glutenFree,
    double? healthScore,
    bool? vegetarian,
    int? aggregateLikes,
  }) => RecipeTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    image: image ?? this.image,
    readyInMinutes: readyInMinutes ?? this.readyInMinutes,
    glutenFree: glutenFree ?? this.glutenFree,
    healthScore: healthScore ?? this.healthScore,
    vegetarian: vegetarian ?? this.vegetarian,
    aggregateLikes: aggregateLikes ?? this.aggregateLikes,
  );
  RecipeTableData copyWithCompanion(RecipeTableCompanion data) {
    return RecipeTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      image: data.image.present ? data.image.value : this.image,
      readyInMinutes: data.readyInMinutes.present
          ? data.readyInMinutes.value
          : this.readyInMinutes,
      glutenFree: data.glutenFree.present
          ? data.glutenFree.value
          : this.glutenFree,
      healthScore: data.healthScore.present
          ? data.healthScore.value
          : this.healthScore,
      vegetarian: data.vegetarian.present
          ? data.vegetarian.value
          : this.vegetarian,
      aggregateLikes: data.aggregateLikes.present
          ? data.aggregateLikes.value
          : this.aggregateLikes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('readyInMinutes: $readyInMinutes, ')
          ..write('glutenFree: $glutenFree, ')
          ..write('healthScore: $healthScore, ')
          ..write('vegetarian: $vegetarian, ')
          ..write('aggregateLikes: $aggregateLikes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    image,
    readyInMinutes,
    glutenFree,
    healthScore,
    vegetarian,
    aggregateLikes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.image == this.image &&
          other.readyInMinutes == this.readyInMinutes &&
          other.glutenFree == this.glutenFree &&
          other.healthScore == this.healthScore &&
          other.vegetarian == this.vegetarian &&
          other.aggregateLikes == this.aggregateLikes);
}

class RecipeTableCompanion extends UpdateCompanion<RecipeTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> image;
  final Value<int> readyInMinutes;
  final Value<bool> glutenFree;
  final Value<double> healthScore;
  final Value<bool> vegetarian;
  final Value<int> aggregateLikes;
  const RecipeTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.readyInMinutes = const Value.absent(),
    this.glutenFree = const Value.absent(),
    this.healthScore = const Value.absent(),
    this.vegetarian = const Value.absent(),
    this.aggregateLikes = const Value.absent(),
  });
  RecipeTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String image,
    required int readyInMinutes,
    required bool glutenFree,
    required double healthScore,
    required bool vegetarian,
    required int aggregateLikes,
  }) : title = Value(title),
       image = Value(image),
       readyInMinutes = Value(readyInMinutes),
       glutenFree = Value(glutenFree),
       healthScore = Value(healthScore),
       vegetarian = Value(vegetarian),
       aggregateLikes = Value(aggregateLikes);
  static Insertable<RecipeTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? image,
    Expression<int>? readyInMinutes,
    Expression<bool>? glutenFree,
    Expression<double>? healthScore,
    Expression<bool>? vegetarian,
    Expression<int>? aggregateLikes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (readyInMinutes != null) 'ready_in_minutes': readyInMinutes,
      if (glutenFree != null) 'gluten_free': glutenFree,
      if (healthScore != null) 'health_score': healthScore,
      if (vegetarian != null) 'vegetarian': vegetarian,
      if (aggregateLikes != null) 'aggregate_likes': aggregateLikes,
    });
  }

  RecipeTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? image,
    Value<int>? readyInMinutes,
    Value<bool>? glutenFree,
    Value<double>? healthScore,
    Value<bool>? vegetarian,
    Value<int>? aggregateLikes,
  }) {
    return RecipeTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      readyInMinutes: readyInMinutes ?? this.readyInMinutes,
      glutenFree: glutenFree ?? this.glutenFree,
      healthScore: healthScore ?? this.healthScore,
      vegetarian: vegetarian ?? this.vegetarian,
      aggregateLikes: aggregateLikes ?? this.aggregateLikes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (readyInMinutes.present) {
      map['ready_in_minutes'] = Variable<int>(readyInMinutes.value);
    }
    if (glutenFree.present) {
      map['gluten_free'] = Variable<bool>(glutenFree.value);
    }
    if (healthScore.present) {
      map['health_score'] = Variable<double>(healthScore.value);
    }
    if (vegetarian.present) {
      map['vegetarian'] = Variable<bool>(vegetarian.value);
    }
    if (aggregateLikes.present) {
      map['aggregate_likes'] = Variable<int>(aggregateLikes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('readyInMinutes: $readyInMinutes, ')
          ..write('glutenFree: $glutenFree, ')
          ..write('healthScore: $healthScore, ')
          ..write('vegetarian: $vegetarian, ')
          ..write('aggregateLikes: $aggregateLikes')
          ..write(')'))
        .toString();
  }
}

class $FavoriteRecipesTableTable extends FavoriteRecipesTable
    with TableInfo<$FavoriteRecipesTableTable, FavoriteRecipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteRecipesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stepsJsonMeta = const VerificationMeta(
    'stepsJson',
  );
  @override
  late final GeneratedColumn<String> stepsJson = GeneratedColumn<String>(
    'steps_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ingredientsJsonMeta = const VerificationMeta(
    'ingredientsJson',
  );
  @override
  late final GeneratedColumn<String> ingredientsJson = GeneratedColumn<String>(
    'ingredients_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _healthScoreMeta = const VerificationMeta(
    'healthScore',
  );
  @override
  late final GeneratedColumn<double> healthScore = GeneratedColumn<double>(
    'health_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _likesMeta = const VerificationMeta('likes');
  @override
  late final GeneratedColumn<int> likes = GeneratedColumn<int>(
    'likes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vegetarianMeta = const VerificationMeta(
    'vegetarian',
  );
  @override
  late final GeneratedColumn<bool> vegetarian = GeneratedColumn<bool>(
    'vegetarian',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("vegetarian" IN (0, 1))',
    ),
  );
  static const VerificationMeta _veganMeta = const VerificationMeta('vegan');
  @override
  late final GeneratedColumn<bool> vegan = GeneratedColumn<bool>(
    'vegan',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("vegan" IN (0, 1))',
    ),
  );
  static const VerificationMeta _glutenFreeMeta = const VerificationMeta(
    'glutenFree',
  );
  @override
  late final GeneratedColumn<bool> glutenFree = GeneratedColumn<bool>(
    'gluten_free',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("gluten_free" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isCookedMeta = const VerificationMeta(
    'isCooked',
  );
  @override
  late final GeneratedColumn<bool> isCooked = GeneratedColumn<bool>(
    'is_cooked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_cooked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    title,
    image,
    instructions,
    stepsJson,
    ingredientsJson,
    healthScore,
    likes,
    vegetarian,
    vegan,
    glutenFree,
    isCooked,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_recipes_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteRecipe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_instructionsMeta);
    }
    if (data.containsKey('steps_json')) {
      context.handle(
        _stepsJsonMeta,
        stepsJson.isAcceptableOrUnknown(data['steps_json']!, _stepsJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_stepsJsonMeta);
    }
    if (data.containsKey('ingredients_json')) {
      context.handle(
        _ingredientsJsonMeta,
        ingredientsJson.isAcceptableOrUnknown(
          data['ingredients_json']!,
          _ingredientsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientsJsonMeta);
    }
    if (data.containsKey('health_score')) {
      context.handle(
        _healthScoreMeta,
        healthScore.isAcceptableOrUnknown(
          data['health_score']!,
          _healthScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_healthScoreMeta);
    }
    if (data.containsKey('likes')) {
      context.handle(
        _likesMeta,
        likes.isAcceptableOrUnknown(data['likes']!, _likesMeta),
      );
    } else if (isInserting) {
      context.missing(_likesMeta);
    }
    if (data.containsKey('vegetarian')) {
      context.handle(
        _vegetarianMeta,
        vegetarian.isAcceptableOrUnknown(data['vegetarian']!, _vegetarianMeta),
      );
    } else if (isInserting) {
      context.missing(_vegetarianMeta);
    }
    if (data.containsKey('vegan')) {
      context.handle(
        _veganMeta,
        vegan.isAcceptableOrUnknown(data['vegan']!, _veganMeta),
      );
    } else if (isInserting) {
      context.missing(_veganMeta);
    }
    if (data.containsKey('gluten_free')) {
      context.handle(
        _glutenFreeMeta,
        glutenFree.isAcceptableOrUnknown(data['gluten_free']!, _glutenFreeMeta),
      );
    } else if (isInserting) {
      context.missing(_glutenFreeMeta);
    }
    if (data.containsKey('is_cooked')) {
      context.handle(
        _isCookedMeta,
        isCooked.isAcceptableOrUnknown(data['is_cooked']!, _isCookedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, userId};
  @override
  FavoriteRecipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteRecipe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      )!,
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      )!,
      stepsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}steps_json'],
      )!,
      ingredientsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredients_json'],
      )!,
      healthScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}health_score'],
      )!,
      likes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}likes'],
      )!,
      vegetarian: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}vegetarian'],
      )!,
      vegan: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}vegan'],
      )!,
      glutenFree: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}gluten_free'],
      )!,
      isCooked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_cooked'],
      )!,
    );
  }

  @override
  $FavoriteRecipesTableTable createAlias(String alias) {
    return $FavoriteRecipesTableTable(attachedDatabase, alias);
  }
}

class FavoriteRecipe extends DataClass implements Insertable<FavoriteRecipe> {
  final int id;
  final String userId;
  final String title;
  final String image;
  final String instructions;
  final String stepsJson;
  final String ingredientsJson;
  final double healthScore;
  final int likes;
  final bool vegetarian;
  final bool vegan;
  final bool glutenFree;
  final bool isCooked;
  const FavoriteRecipe({
    required this.id,
    required this.userId,
    required this.title,
    required this.image,
    required this.instructions,
    required this.stepsJson,
    required this.ingredientsJson,
    required this.healthScore,
    required this.likes,
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
    required this.isCooked,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['title'] = Variable<String>(title);
    map['image'] = Variable<String>(image);
    map['instructions'] = Variable<String>(instructions);
    map['steps_json'] = Variable<String>(stepsJson);
    map['ingredients_json'] = Variable<String>(ingredientsJson);
    map['health_score'] = Variable<double>(healthScore);
    map['likes'] = Variable<int>(likes);
    map['vegetarian'] = Variable<bool>(vegetarian);
    map['vegan'] = Variable<bool>(vegan);
    map['gluten_free'] = Variable<bool>(glutenFree);
    map['is_cooked'] = Variable<bool>(isCooked);
    return map;
  }

  FavoriteRecipesTableCompanion toCompanion(bool nullToAbsent) {
    return FavoriteRecipesTableCompanion(
      id: Value(id),
      userId: Value(userId),
      title: Value(title),
      image: Value(image),
      instructions: Value(instructions),
      stepsJson: Value(stepsJson),
      ingredientsJson: Value(ingredientsJson),
      healthScore: Value(healthScore),
      likes: Value(likes),
      vegetarian: Value(vegetarian),
      vegan: Value(vegan),
      glutenFree: Value(glutenFree),
      isCooked: Value(isCooked),
    );
  }

  factory FavoriteRecipe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteRecipe(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      image: serializer.fromJson<String>(json['image']),
      instructions: serializer.fromJson<String>(json['instructions']),
      stepsJson: serializer.fromJson<String>(json['stepsJson']),
      ingredientsJson: serializer.fromJson<String>(json['ingredientsJson']),
      healthScore: serializer.fromJson<double>(json['healthScore']),
      likes: serializer.fromJson<int>(json['likes']),
      vegetarian: serializer.fromJson<bool>(json['vegetarian']),
      vegan: serializer.fromJson<bool>(json['vegan']),
      glutenFree: serializer.fromJson<bool>(json['glutenFree']),
      isCooked: serializer.fromJson<bool>(json['isCooked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'title': serializer.toJson<String>(title),
      'image': serializer.toJson<String>(image),
      'instructions': serializer.toJson<String>(instructions),
      'stepsJson': serializer.toJson<String>(stepsJson),
      'ingredientsJson': serializer.toJson<String>(ingredientsJson),
      'healthScore': serializer.toJson<double>(healthScore),
      'likes': serializer.toJson<int>(likes),
      'vegetarian': serializer.toJson<bool>(vegetarian),
      'vegan': serializer.toJson<bool>(vegan),
      'glutenFree': serializer.toJson<bool>(glutenFree),
      'isCooked': serializer.toJson<bool>(isCooked),
    };
  }

  FavoriteRecipe copyWith({
    int? id,
    String? userId,
    String? title,
    String? image,
    String? instructions,
    String? stepsJson,
    String? ingredientsJson,
    double? healthScore,
    int? likes,
    bool? vegetarian,
    bool? vegan,
    bool? glutenFree,
    bool? isCooked,
  }) => FavoriteRecipe(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    image: image ?? this.image,
    instructions: instructions ?? this.instructions,
    stepsJson: stepsJson ?? this.stepsJson,
    ingredientsJson: ingredientsJson ?? this.ingredientsJson,
    healthScore: healthScore ?? this.healthScore,
    likes: likes ?? this.likes,
    vegetarian: vegetarian ?? this.vegetarian,
    vegan: vegan ?? this.vegan,
    glutenFree: glutenFree ?? this.glutenFree,
    isCooked: isCooked ?? this.isCooked,
  );
  FavoriteRecipe copyWithCompanion(FavoriteRecipesTableCompanion data) {
    return FavoriteRecipe(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      title: data.title.present ? data.title.value : this.title,
      image: data.image.present ? data.image.value : this.image,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      stepsJson: data.stepsJson.present ? data.stepsJson.value : this.stepsJson,
      ingredientsJson: data.ingredientsJson.present
          ? data.ingredientsJson.value
          : this.ingredientsJson,
      healthScore: data.healthScore.present
          ? data.healthScore.value
          : this.healthScore,
      likes: data.likes.present ? data.likes.value : this.likes,
      vegetarian: data.vegetarian.present
          ? data.vegetarian.value
          : this.vegetarian,
      vegan: data.vegan.present ? data.vegan.value : this.vegan,
      glutenFree: data.glutenFree.present
          ? data.glutenFree.value
          : this.glutenFree,
      isCooked: data.isCooked.present ? data.isCooked.value : this.isCooked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteRecipe(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('instructions: $instructions, ')
          ..write('stepsJson: $stepsJson, ')
          ..write('ingredientsJson: $ingredientsJson, ')
          ..write('healthScore: $healthScore, ')
          ..write('likes: $likes, ')
          ..write('vegetarian: $vegetarian, ')
          ..write('vegan: $vegan, ')
          ..write('glutenFree: $glutenFree, ')
          ..write('isCooked: $isCooked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    title,
    image,
    instructions,
    stepsJson,
    ingredientsJson,
    healthScore,
    likes,
    vegetarian,
    vegan,
    glutenFree,
    isCooked,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteRecipe &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.image == this.image &&
          other.instructions == this.instructions &&
          other.stepsJson == this.stepsJson &&
          other.ingredientsJson == this.ingredientsJson &&
          other.healthScore == this.healthScore &&
          other.likes == this.likes &&
          other.vegetarian == this.vegetarian &&
          other.vegan == this.vegan &&
          other.glutenFree == this.glutenFree &&
          other.isCooked == this.isCooked);
}

class FavoriteRecipesTableCompanion extends UpdateCompanion<FavoriteRecipe> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> title;
  final Value<String> image;
  final Value<String> instructions;
  final Value<String> stepsJson;
  final Value<String> ingredientsJson;
  final Value<double> healthScore;
  final Value<int> likes;
  final Value<bool> vegetarian;
  final Value<bool> vegan;
  final Value<bool> glutenFree;
  final Value<bool> isCooked;
  final Value<int> rowid;
  const FavoriteRecipesTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.instructions = const Value.absent(),
    this.stepsJson = const Value.absent(),
    this.ingredientsJson = const Value.absent(),
    this.healthScore = const Value.absent(),
    this.likes = const Value.absent(),
    this.vegetarian = const Value.absent(),
    this.vegan = const Value.absent(),
    this.glutenFree = const Value.absent(),
    this.isCooked = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoriteRecipesTableCompanion.insert({
    required int id,
    required String userId,
    required String title,
    required String image,
    required String instructions,
    required String stepsJson,
    required String ingredientsJson,
    required double healthScore,
    required int likes,
    required bool vegetarian,
    required bool vegan,
    required bool glutenFree,
    this.isCooked = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       title = Value(title),
       image = Value(image),
       instructions = Value(instructions),
       stepsJson = Value(stepsJson),
       ingredientsJson = Value(ingredientsJson),
       healthScore = Value(healthScore),
       likes = Value(likes),
       vegetarian = Value(vegetarian),
       vegan = Value(vegan),
       glutenFree = Value(glutenFree);
  static Insertable<FavoriteRecipe> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? title,
    Expression<String>? image,
    Expression<String>? instructions,
    Expression<String>? stepsJson,
    Expression<String>? ingredientsJson,
    Expression<double>? healthScore,
    Expression<int>? likes,
    Expression<bool>? vegetarian,
    Expression<bool>? vegan,
    Expression<bool>? glutenFree,
    Expression<bool>? isCooked,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (instructions != null) 'instructions': instructions,
      if (stepsJson != null) 'steps_json': stepsJson,
      if (ingredientsJson != null) 'ingredients_json': ingredientsJson,
      if (healthScore != null) 'health_score': healthScore,
      if (likes != null) 'likes': likes,
      if (vegetarian != null) 'vegetarian': vegetarian,
      if (vegan != null) 'vegan': vegan,
      if (glutenFree != null) 'gluten_free': glutenFree,
      if (isCooked != null) 'is_cooked': isCooked,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoriteRecipesTableCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? title,
    Value<String>? image,
    Value<String>? instructions,
    Value<String>? stepsJson,
    Value<String>? ingredientsJson,
    Value<double>? healthScore,
    Value<int>? likes,
    Value<bool>? vegetarian,
    Value<bool>? vegan,
    Value<bool>? glutenFree,
    Value<bool>? isCooked,
    Value<int>? rowid,
  }) {
    return FavoriteRecipesTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      image: image ?? this.image,
      instructions: instructions ?? this.instructions,
      stepsJson: stepsJson ?? this.stepsJson,
      ingredientsJson: ingredientsJson ?? this.ingredientsJson,
      healthScore: healthScore ?? this.healthScore,
      likes: likes ?? this.likes,
      vegetarian: vegetarian ?? this.vegetarian,
      vegan: vegan ?? this.vegan,
      glutenFree: glutenFree ?? this.glutenFree,
      isCooked: isCooked ?? this.isCooked,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (stepsJson.present) {
      map['steps_json'] = Variable<String>(stepsJson.value);
    }
    if (ingredientsJson.present) {
      map['ingredients_json'] = Variable<String>(ingredientsJson.value);
    }
    if (healthScore.present) {
      map['health_score'] = Variable<double>(healthScore.value);
    }
    if (likes.present) {
      map['likes'] = Variable<int>(likes.value);
    }
    if (vegetarian.present) {
      map['vegetarian'] = Variable<bool>(vegetarian.value);
    }
    if (vegan.present) {
      map['vegan'] = Variable<bool>(vegan.value);
    }
    if (glutenFree.present) {
      map['gluten_free'] = Variable<bool>(glutenFree.value);
    }
    if (isCooked.present) {
      map['is_cooked'] = Variable<bool>(isCooked.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteRecipesTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('instructions: $instructions, ')
          ..write('stepsJson: $stepsJson, ')
          ..write('ingredientsJson: $ingredientsJson, ')
          ..write('healthScore: $healthScore, ')
          ..write('likes: $likes, ')
          ..write('vegetarian: $vegetarian, ')
          ..write('vegan: $vegan, ')
          ..write('glutenFree: $glutenFree, ')
          ..write('isCooked: $isCooked, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RecipeTableTable recipeTable = $RecipeTableTable(this);
  late final $FavoriteRecipesTableTable favoriteRecipesTable =
      $FavoriteRecipesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    recipeTable,
    favoriteRecipesTable,
  ];
}

typedef $$RecipeTableTableCreateCompanionBuilder =
    RecipeTableCompanion Function({
      Value<int> id,
      required String title,
      required String image,
      required int readyInMinutes,
      required bool glutenFree,
      required double healthScore,
      required bool vegetarian,
      required int aggregateLikes,
    });
typedef $$RecipeTableTableUpdateCompanionBuilder =
    RecipeTableCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> image,
      Value<int> readyInMinutes,
      Value<bool> glutenFree,
      Value<double> healthScore,
      Value<bool> vegetarian,
      Value<int> aggregateLikes,
    });

class $$RecipeTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get readyInMinutes => $composableBuilder(
    column: $table.readyInMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get glutenFree => $composableBuilder(
    column: $table.glutenFree,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get healthScore => $composableBuilder(
    column: $table.healthScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get vegetarian => $composableBuilder(
    column: $table.vegetarian,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get aggregateLikes => $composableBuilder(
    column: $table.aggregateLikes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RecipeTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get readyInMinutes => $composableBuilder(
    column: $table.readyInMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get glutenFree => $composableBuilder(
    column: $table.glutenFree,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get healthScore => $composableBuilder(
    column: $table.healthScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get vegetarian => $composableBuilder(
    column: $table.vegetarian,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get aggregateLikes => $composableBuilder(
    column: $table.aggregateLikes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecipeTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<int> get readyInMinutes => $composableBuilder(
    column: $table.readyInMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get glutenFree => $composableBuilder(
    column: $table.glutenFree,
    builder: (column) => column,
  );

  GeneratedColumn<double> get healthScore => $composableBuilder(
    column: $table.healthScore,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get vegetarian => $composableBuilder(
    column: $table.vegetarian,
    builder: (column) => column,
  );

  GeneratedColumn<int> get aggregateLikes => $composableBuilder(
    column: $table.aggregateLikes,
    builder: (column) => column,
  );
}

class $$RecipeTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeTableTable,
          RecipeTableData,
          $$RecipeTableTableFilterComposer,
          $$RecipeTableTableOrderingComposer,
          $$RecipeTableTableAnnotationComposer,
          $$RecipeTableTableCreateCompanionBuilder,
          $$RecipeTableTableUpdateCompanionBuilder,
          (
            RecipeTableData,
            BaseReferences<_$AppDatabase, $RecipeTableTable, RecipeTableData>,
          ),
          RecipeTableData,
          PrefetchHooks Function()
        > {
  $$RecipeTableTableTableManager(_$AppDatabase db, $RecipeTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<int> readyInMinutes = const Value.absent(),
                Value<bool> glutenFree = const Value.absent(),
                Value<double> healthScore = const Value.absent(),
                Value<bool> vegetarian = const Value.absent(),
                Value<int> aggregateLikes = const Value.absent(),
              }) => RecipeTableCompanion(
                id: id,
                title: title,
                image: image,
                readyInMinutes: readyInMinutes,
                glutenFree: glutenFree,
                healthScore: healthScore,
                vegetarian: vegetarian,
                aggregateLikes: aggregateLikes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String image,
                required int readyInMinutes,
                required bool glutenFree,
                required double healthScore,
                required bool vegetarian,
                required int aggregateLikes,
              }) => RecipeTableCompanion.insert(
                id: id,
                title: title,
                image: image,
                readyInMinutes: readyInMinutes,
                glutenFree: glutenFree,
                healthScore: healthScore,
                vegetarian: vegetarian,
                aggregateLikes: aggregateLikes,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RecipeTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeTableTable,
      RecipeTableData,
      $$RecipeTableTableFilterComposer,
      $$RecipeTableTableOrderingComposer,
      $$RecipeTableTableAnnotationComposer,
      $$RecipeTableTableCreateCompanionBuilder,
      $$RecipeTableTableUpdateCompanionBuilder,
      (
        RecipeTableData,
        BaseReferences<_$AppDatabase, $RecipeTableTable, RecipeTableData>,
      ),
      RecipeTableData,
      PrefetchHooks Function()
    >;
typedef $$FavoriteRecipesTableTableCreateCompanionBuilder =
    FavoriteRecipesTableCompanion Function({
      required int id,
      required String userId,
      required String title,
      required String image,
      required String instructions,
      required String stepsJson,
      required String ingredientsJson,
      required double healthScore,
      required int likes,
      required bool vegetarian,
      required bool vegan,
      required bool glutenFree,
      Value<bool> isCooked,
      Value<int> rowid,
    });
typedef $$FavoriteRecipesTableTableUpdateCompanionBuilder =
    FavoriteRecipesTableCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> title,
      Value<String> image,
      Value<String> instructions,
      Value<String> stepsJson,
      Value<String> ingredientsJson,
      Value<double> healthScore,
      Value<int> likes,
      Value<bool> vegetarian,
      Value<bool> vegan,
      Value<bool> glutenFree,
      Value<bool> isCooked,
      Value<int> rowid,
    });

class $$FavoriteRecipesTableTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteRecipesTableTable> {
  $$FavoriteRecipesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stepsJson => $composableBuilder(
    column: $table.stepsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ingredientsJson => $composableBuilder(
    column: $table.ingredientsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get healthScore => $composableBuilder(
    column: $table.healthScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get likes => $composableBuilder(
    column: $table.likes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get vegetarian => $composableBuilder(
    column: $table.vegetarian,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get vegan => $composableBuilder(
    column: $table.vegan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get glutenFree => $composableBuilder(
    column: $table.glutenFree,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCooked => $composableBuilder(
    column: $table.isCooked,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteRecipesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteRecipesTableTable> {
  $$FavoriteRecipesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stepsJson => $composableBuilder(
    column: $table.stepsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredientsJson => $composableBuilder(
    column: $table.ingredientsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get healthScore => $composableBuilder(
    column: $table.healthScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get likes => $composableBuilder(
    column: $table.likes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get vegetarian => $composableBuilder(
    column: $table.vegetarian,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get vegan => $composableBuilder(
    column: $table.vegan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get glutenFree => $composableBuilder(
    column: $table.glutenFree,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCooked => $composableBuilder(
    column: $table.isCooked,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteRecipesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteRecipesTableTable> {
  $$FavoriteRecipesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stepsJson =>
      $composableBuilder(column: $table.stepsJson, builder: (column) => column);

  GeneratedColumn<String> get ingredientsJson => $composableBuilder(
    column: $table.ingredientsJson,
    builder: (column) => column,
  );

  GeneratedColumn<double> get healthScore => $composableBuilder(
    column: $table.healthScore,
    builder: (column) => column,
  );

  GeneratedColumn<int> get likes =>
      $composableBuilder(column: $table.likes, builder: (column) => column);

  GeneratedColumn<bool> get vegetarian => $composableBuilder(
    column: $table.vegetarian,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get vegan =>
      $composableBuilder(column: $table.vegan, builder: (column) => column);

  GeneratedColumn<bool> get glutenFree => $composableBuilder(
    column: $table.glutenFree,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCooked =>
      $composableBuilder(column: $table.isCooked, builder: (column) => column);
}

class $$FavoriteRecipesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteRecipesTableTable,
          FavoriteRecipe,
          $$FavoriteRecipesTableTableFilterComposer,
          $$FavoriteRecipesTableTableOrderingComposer,
          $$FavoriteRecipesTableTableAnnotationComposer,
          $$FavoriteRecipesTableTableCreateCompanionBuilder,
          $$FavoriteRecipesTableTableUpdateCompanionBuilder,
          (
            FavoriteRecipe,
            BaseReferences<
              _$AppDatabase,
              $FavoriteRecipesTableTable,
              FavoriteRecipe
            >,
          ),
          FavoriteRecipe,
          PrefetchHooks Function()
        > {
  $$FavoriteRecipesTableTableTableManager(
    _$AppDatabase db,
    $FavoriteRecipesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteRecipesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteRecipesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FavoriteRecipesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<String> instructions = const Value.absent(),
                Value<String> stepsJson = const Value.absent(),
                Value<String> ingredientsJson = const Value.absent(),
                Value<double> healthScore = const Value.absent(),
                Value<int> likes = const Value.absent(),
                Value<bool> vegetarian = const Value.absent(),
                Value<bool> vegan = const Value.absent(),
                Value<bool> glutenFree = const Value.absent(),
                Value<bool> isCooked = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteRecipesTableCompanion(
                id: id,
                userId: userId,
                title: title,
                image: image,
                instructions: instructions,
                stepsJson: stepsJson,
                ingredientsJson: ingredientsJson,
                healthScore: healthScore,
                likes: likes,
                vegetarian: vegetarian,
                vegan: vegan,
                glutenFree: glutenFree,
                isCooked: isCooked,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String userId,
                required String title,
                required String image,
                required String instructions,
                required String stepsJson,
                required String ingredientsJson,
                required double healthScore,
                required int likes,
                required bool vegetarian,
                required bool vegan,
                required bool glutenFree,
                Value<bool> isCooked = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteRecipesTableCompanion.insert(
                id: id,
                userId: userId,
                title: title,
                image: image,
                instructions: instructions,
                stepsJson: stepsJson,
                ingredientsJson: ingredientsJson,
                healthScore: healthScore,
                likes: likes,
                vegetarian: vegetarian,
                vegan: vegan,
                glutenFree: glutenFree,
                isCooked: isCooked,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteRecipesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteRecipesTableTable,
      FavoriteRecipe,
      $$FavoriteRecipesTableTableFilterComposer,
      $$FavoriteRecipesTableTableOrderingComposer,
      $$FavoriteRecipesTableTableAnnotationComposer,
      $$FavoriteRecipesTableTableCreateCompanionBuilder,
      $$FavoriteRecipesTableTableUpdateCompanionBuilder,
      (
        FavoriteRecipe,
        BaseReferences<
          _$AppDatabase,
          $FavoriteRecipesTableTable,
          FavoriteRecipe
        >,
      ),
      FavoriteRecipe,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RecipeTableTableTableManager get recipeTable =>
      $$RecipeTableTableTableManager(_db, _db.recipeTable);
  $$FavoriteRecipesTableTableTableManager get favoriteRecipesTable =>
      $$FavoriteRecipesTableTableTableManager(_db, _db.favoriteRecipesTable);
}
