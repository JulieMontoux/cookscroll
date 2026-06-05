// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CachedRecipesTable extends CachedRecipes
    with TableInfo<$CachedRecipesTable, CachedRecipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedRecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
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
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
    'area',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
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
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _prepTimeMinutesMeta = const VerificationMeta(
    'prepTimeMinutes',
  );
  @override
  late final GeneratedColumn<int> prepTimeMinutes = GeneratedColumn<int>(
    'prep_time_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _servingsMeta = const VerificationMeta(
    'servings',
  );
  @override
  late final GeneratedColumn<int> servings = GeneratedColumn<int>(
    'servings',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(2),
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('easy'),
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('catalog'),
  );
  static const VerificationMeta _youtubeUrlMeta = const VerificationMeta(
    'youtubeUrl',
  );
  @override
  late final GeneratedColumn<String> youtubeUrl = GeneratedColumn<String>(
    'youtube_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsJsonMeta = const VerificationMeta(
    'tagsJson',
  );
  @override
  late final GeneratedColumn<String> tagsJson = GeneratedColumn<String>(
    'tags_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _caloriesPerServingMeta =
      const VerificationMeta('caloriesPerServing');
  @override
  late final GeneratedColumn<double> caloriesPerServing =
      GeneratedColumn<double>(
        'calories_per_serving',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _proteinsGMeta = const VerificationMeta(
    'proteinsG',
  );
  @override
  late final GeneratedColumn<double> proteinsG = GeneratedColumn<double>(
    'proteins_g',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _carbsGMeta = const VerificationMeta('carbsG');
  @override
  late final GeneratedColumn<double> carbsG = GeneratedColumn<double>(
    'carbs_g',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fatsGMeta = const VerificationMeta('fatsG');
  @override
  late final GeneratedColumn<double> fatsG = GeneratedColumn<double>(
    'fats_g',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    imageUrl,
    category,
    area,
    ingredientsJson,
    stepsJson,
    prepTimeMinutes,
    servings,
    difficulty,
    source,
    youtubeUrl,
    tagsJson,
    caloriesPerServing,
    proteinsG,
    carbsG,
    fatsG,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedRecipe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    }
    if (data.containsKey('ingredients_json')) {
      context.handle(
        _ingredientsJsonMeta,
        ingredientsJson.isAcceptableOrUnknown(
          data['ingredients_json']!,
          _ingredientsJsonMeta,
        ),
      );
    }
    if (data.containsKey('steps_json')) {
      context.handle(
        _stepsJsonMeta,
        stepsJson.isAcceptableOrUnknown(data['steps_json']!, _stepsJsonMeta),
      );
    }
    if (data.containsKey('prep_time_minutes')) {
      context.handle(
        _prepTimeMinutesMeta,
        prepTimeMinutes.isAcceptableOrUnknown(
          data['prep_time_minutes']!,
          _prepTimeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('servings')) {
      context.handle(
        _servingsMeta,
        servings.isAcceptableOrUnknown(data['servings']!, _servingsMeta),
      );
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('youtube_url')) {
      context.handle(
        _youtubeUrlMeta,
        youtubeUrl.isAcceptableOrUnknown(data['youtube_url']!, _youtubeUrlMeta),
      );
    }
    if (data.containsKey('tags_json')) {
      context.handle(
        _tagsJsonMeta,
        tagsJson.isAcceptableOrUnknown(data['tags_json']!, _tagsJsonMeta),
      );
    }
    if (data.containsKey('calories_per_serving')) {
      context.handle(
        _caloriesPerServingMeta,
        caloriesPerServing.isAcceptableOrUnknown(
          data['calories_per_serving']!,
          _caloriesPerServingMeta,
        ),
      );
    }
    if (data.containsKey('proteins_g')) {
      context.handle(
        _proteinsGMeta,
        proteinsG.isAcceptableOrUnknown(data['proteins_g']!, _proteinsGMeta),
      );
    }
    if (data.containsKey('carbs_g')) {
      context.handle(
        _carbsGMeta,
        carbsG.isAcceptableOrUnknown(data['carbs_g']!, _carbsGMeta),
      );
    }
    if (data.containsKey('fats_g')) {
      context.handle(
        _fatsGMeta,
        fatsG.isAcceptableOrUnknown(data['fats_g']!, _fatsGMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedRecipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedRecipe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      area: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area'],
      ),
      ingredientsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredients_json'],
      )!,
      stepsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}steps_json'],
      )!,
      prepTimeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}prep_time_minutes'],
      ),
      servings: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}servings'],
      )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      youtubeUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}youtube_url'],
      ),
      tagsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags_json'],
      )!,
      caloriesPerServing: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calories_per_serving'],
      ),
      proteinsG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}proteins_g'],
      ),
      carbsG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbs_g'],
      ),
      fatsG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fats_g'],
      ),
    );
  }

  @override
  $CachedRecipesTable createAlias(String alias) {
    return $CachedRecipesTable(attachedDatabase, alias);
  }
}

class CachedRecipe extends DataClass implements Insertable<CachedRecipe> {
  final String id;
  final String title;
  final String? imageUrl;
  final String? category;
  final String? area;
  final String ingredientsJson;
  final String stepsJson;
  final int? prepTimeMinutes;
  final int servings;
  final String difficulty;
  final String source;
  final String? youtubeUrl;
  final String tagsJson;
  final double? caloriesPerServing;
  final double? proteinsG;
  final double? carbsG;
  final double? fatsG;
  const CachedRecipe({
    required this.id,
    required this.title,
    this.imageUrl,
    this.category,
    this.area,
    required this.ingredientsJson,
    required this.stepsJson,
    this.prepTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.source,
    this.youtubeUrl,
    required this.tagsJson,
    this.caloriesPerServing,
    this.proteinsG,
    this.carbsG,
    this.fatsG,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || area != null) {
      map['area'] = Variable<String>(area);
    }
    map['ingredients_json'] = Variable<String>(ingredientsJson);
    map['steps_json'] = Variable<String>(stepsJson);
    if (!nullToAbsent || prepTimeMinutes != null) {
      map['prep_time_minutes'] = Variable<int>(prepTimeMinutes);
    }
    map['servings'] = Variable<int>(servings);
    map['difficulty'] = Variable<String>(difficulty);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || youtubeUrl != null) {
      map['youtube_url'] = Variable<String>(youtubeUrl);
    }
    map['tags_json'] = Variable<String>(tagsJson);
    if (!nullToAbsent || caloriesPerServing != null) {
      map['calories_per_serving'] = Variable<double>(caloriesPerServing);
    }
    if (!nullToAbsent || proteinsG != null) {
      map['proteins_g'] = Variable<double>(proteinsG);
    }
    if (!nullToAbsent || carbsG != null) {
      map['carbs_g'] = Variable<double>(carbsG);
    }
    if (!nullToAbsent || fatsG != null) {
      map['fats_g'] = Variable<double>(fatsG);
    }
    return map;
  }

  CachedRecipesCompanion toCompanion(bool nullToAbsent) {
    return CachedRecipesCompanion(
      id: Value(id),
      title: Value(title),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      area: area == null && nullToAbsent ? const Value.absent() : Value(area),
      ingredientsJson: Value(ingredientsJson),
      stepsJson: Value(stepsJson),
      prepTimeMinutes: prepTimeMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(prepTimeMinutes),
      servings: Value(servings),
      difficulty: Value(difficulty),
      source: Value(source),
      youtubeUrl: youtubeUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(youtubeUrl),
      tagsJson: Value(tagsJson),
      caloriesPerServing: caloriesPerServing == null && nullToAbsent
          ? const Value.absent()
          : Value(caloriesPerServing),
      proteinsG: proteinsG == null && nullToAbsent
          ? const Value.absent()
          : Value(proteinsG),
      carbsG: carbsG == null && nullToAbsent
          ? const Value.absent()
          : Value(carbsG),
      fatsG: fatsG == null && nullToAbsent
          ? const Value.absent()
          : Value(fatsG),
    );
  }

  factory CachedRecipe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedRecipe(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      category: serializer.fromJson<String?>(json['category']),
      area: serializer.fromJson<String?>(json['area']),
      ingredientsJson: serializer.fromJson<String>(json['ingredientsJson']),
      stepsJson: serializer.fromJson<String>(json['stepsJson']),
      prepTimeMinutes: serializer.fromJson<int?>(json['prepTimeMinutes']),
      servings: serializer.fromJson<int>(json['servings']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
      source: serializer.fromJson<String>(json['source']),
      youtubeUrl: serializer.fromJson<String?>(json['youtubeUrl']),
      tagsJson: serializer.fromJson<String>(json['tagsJson']),
      caloriesPerServing: serializer.fromJson<double?>(
        json['caloriesPerServing'],
      ),
      proteinsG: serializer.fromJson<double?>(json['proteinsG']),
      carbsG: serializer.fromJson<double?>(json['carbsG']),
      fatsG: serializer.fromJson<double?>(json['fatsG']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'category': serializer.toJson<String?>(category),
      'area': serializer.toJson<String?>(area),
      'ingredientsJson': serializer.toJson<String>(ingredientsJson),
      'stepsJson': serializer.toJson<String>(stepsJson),
      'prepTimeMinutes': serializer.toJson<int?>(prepTimeMinutes),
      'servings': serializer.toJson<int>(servings),
      'difficulty': serializer.toJson<String>(difficulty),
      'source': serializer.toJson<String>(source),
      'youtubeUrl': serializer.toJson<String?>(youtubeUrl),
      'tagsJson': serializer.toJson<String>(tagsJson),
      'caloriesPerServing': serializer.toJson<double?>(caloriesPerServing),
      'proteinsG': serializer.toJson<double?>(proteinsG),
      'carbsG': serializer.toJson<double?>(carbsG),
      'fatsG': serializer.toJson<double?>(fatsG),
    };
  }

  CachedRecipe copyWith({
    String? id,
    String? title,
    Value<String?> imageUrl = const Value.absent(),
    Value<String?> category = const Value.absent(),
    Value<String?> area = const Value.absent(),
    String? ingredientsJson,
    String? stepsJson,
    Value<int?> prepTimeMinutes = const Value.absent(),
    int? servings,
    String? difficulty,
    String? source,
    Value<String?> youtubeUrl = const Value.absent(),
    String? tagsJson,
    Value<double?> caloriesPerServing = const Value.absent(),
    Value<double?> proteinsG = const Value.absent(),
    Value<double?> carbsG = const Value.absent(),
    Value<double?> fatsG = const Value.absent(),
  }) => CachedRecipe(
    id: id ?? this.id,
    title: title ?? this.title,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    category: category.present ? category.value : this.category,
    area: area.present ? area.value : this.area,
    ingredientsJson: ingredientsJson ?? this.ingredientsJson,
    stepsJson: stepsJson ?? this.stepsJson,
    prepTimeMinutes: prepTimeMinutes.present
        ? prepTimeMinutes.value
        : this.prepTimeMinutes,
    servings: servings ?? this.servings,
    difficulty: difficulty ?? this.difficulty,
    source: source ?? this.source,
    youtubeUrl: youtubeUrl.present ? youtubeUrl.value : this.youtubeUrl,
    tagsJson: tagsJson ?? this.tagsJson,
    caloriesPerServing: caloriesPerServing.present
        ? caloriesPerServing.value
        : this.caloriesPerServing,
    proteinsG: proteinsG.present ? proteinsG.value : this.proteinsG,
    carbsG: carbsG.present ? carbsG.value : this.carbsG,
    fatsG: fatsG.present ? fatsG.value : this.fatsG,
  );
  CachedRecipe copyWithCompanion(CachedRecipesCompanion data) {
    return CachedRecipe(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      category: data.category.present ? data.category.value : this.category,
      area: data.area.present ? data.area.value : this.area,
      ingredientsJson: data.ingredientsJson.present
          ? data.ingredientsJson.value
          : this.ingredientsJson,
      stepsJson: data.stepsJson.present ? data.stepsJson.value : this.stepsJson,
      prepTimeMinutes: data.prepTimeMinutes.present
          ? data.prepTimeMinutes.value
          : this.prepTimeMinutes,
      servings: data.servings.present ? data.servings.value : this.servings,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      source: data.source.present ? data.source.value : this.source,
      youtubeUrl: data.youtubeUrl.present
          ? data.youtubeUrl.value
          : this.youtubeUrl,
      tagsJson: data.tagsJson.present ? data.tagsJson.value : this.tagsJson,
      caloriesPerServing: data.caloriesPerServing.present
          ? data.caloriesPerServing.value
          : this.caloriesPerServing,
      proteinsG: data.proteinsG.present ? data.proteinsG.value : this.proteinsG,
      carbsG: data.carbsG.present ? data.carbsG.value : this.carbsG,
      fatsG: data.fatsG.present ? data.fatsG.value : this.fatsG,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedRecipe(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('category: $category, ')
          ..write('area: $area, ')
          ..write('ingredientsJson: $ingredientsJson, ')
          ..write('stepsJson: $stepsJson, ')
          ..write('prepTimeMinutes: $prepTimeMinutes, ')
          ..write('servings: $servings, ')
          ..write('difficulty: $difficulty, ')
          ..write('source: $source, ')
          ..write('youtubeUrl: $youtubeUrl, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('caloriesPerServing: $caloriesPerServing, ')
          ..write('proteinsG: $proteinsG, ')
          ..write('carbsG: $carbsG, ')
          ..write('fatsG: $fatsG')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    imageUrl,
    category,
    area,
    ingredientsJson,
    stepsJson,
    prepTimeMinutes,
    servings,
    difficulty,
    source,
    youtubeUrl,
    tagsJson,
    caloriesPerServing,
    proteinsG,
    carbsG,
    fatsG,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedRecipe &&
          other.id == this.id &&
          other.title == this.title &&
          other.imageUrl == this.imageUrl &&
          other.category == this.category &&
          other.area == this.area &&
          other.ingredientsJson == this.ingredientsJson &&
          other.stepsJson == this.stepsJson &&
          other.prepTimeMinutes == this.prepTimeMinutes &&
          other.servings == this.servings &&
          other.difficulty == this.difficulty &&
          other.source == this.source &&
          other.youtubeUrl == this.youtubeUrl &&
          other.tagsJson == this.tagsJson &&
          other.caloriesPerServing == this.caloriesPerServing &&
          other.proteinsG == this.proteinsG &&
          other.carbsG == this.carbsG &&
          other.fatsG == this.fatsG);
}

class CachedRecipesCompanion extends UpdateCompanion<CachedRecipe> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> imageUrl;
  final Value<String?> category;
  final Value<String?> area;
  final Value<String> ingredientsJson;
  final Value<String> stepsJson;
  final Value<int?> prepTimeMinutes;
  final Value<int> servings;
  final Value<String> difficulty;
  final Value<String> source;
  final Value<String?> youtubeUrl;
  final Value<String> tagsJson;
  final Value<double?> caloriesPerServing;
  final Value<double?> proteinsG;
  final Value<double?> carbsG;
  final Value<double?> fatsG;
  final Value<int> rowid;
  const CachedRecipesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.category = const Value.absent(),
    this.area = const Value.absent(),
    this.ingredientsJson = const Value.absent(),
    this.stepsJson = const Value.absent(),
    this.prepTimeMinutes = const Value.absent(),
    this.servings = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.source = const Value.absent(),
    this.youtubeUrl = const Value.absent(),
    this.tagsJson = const Value.absent(),
    this.caloriesPerServing = const Value.absent(),
    this.proteinsG = const Value.absent(),
    this.carbsG = const Value.absent(),
    this.fatsG = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedRecipesCompanion.insert({
    required String id,
    required String title,
    this.imageUrl = const Value.absent(),
    this.category = const Value.absent(),
    this.area = const Value.absent(),
    this.ingredientsJson = const Value.absent(),
    this.stepsJson = const Value.absent(),
    this.prepTimeMinutes = const Value.absent(),
    this.servings = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.source = const Value.absent(),
    this.youtubeUrl = const Value.absent(),
    this.tagsJson = const Value.absent(),
    this.caloriesPerServing = const Value.absent(),
    this.proteinsG = const Value.absent(),
    this.carbsG = const Value.absent(),
    this.fatsG = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title);
  static Insertable<CachedRecipe> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? imageUrl,
    Expression<String>? category,
    Expression<String>? area,
    Expression<String>? ingredientsJson,
    Expression<String>? stepsJson,
    Expression<int>? prepTimeMinutes,
    Expression<int>? servings,
    Expression<String>? difficulty,
    Expression<String>? source,
    Expression<String>? youtubeUrl,
    Expression<String>? tagsJson,
    Expression<double>? caloriesPerServing,
    Expression<double>? proteinsG,
    Expression<double>? carbsG,
    Expression<double>? fatsG,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (imageUrl != null) 'image_url': imageUrl,
      if (category != null) 'category': category,
      if (area != null) 'area': area,
      if (ingredientsJson != null) 'ingredients_json': ingredientsJson,
      if (stepsJson != null) 'steps_json': stepsJson,
      if (prepTimeMinutes != null) 'prep_time_minutes': prepTimeMinutes,
      if (servings != null) 'servings': servings,
      if (difficulty != null) 'difficulty': difficulty,
      if (source != null) 'source': source,
      if (youtubeUrl != null) 'youtube_url': youtubeUrl,
      if (tagsJson != null) 'tags_json': tagsJson,
      if (caloriesPerServing != null)
        'calories_per_serving': caloriesPerServing,
      if (proteinsG != null) 'proteins_g': proteinsG,
      if (carbsG != null) 'carbs_g': carbsG,
      if (fatsG != null) 'fats_g': fatsG,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedRecipesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? imageUrl,
    Value<String?>? category,
    Value<String?>? area,
    Value<String>? ingredientsJson,
    Value<String>? stepsJson,
    Value<int?>? prepTimeMinutes,
    Value<int>? servings,
    Value<String>? difficulty,
    Value<String>? source,
    Value<String?>? youtubeUrl,
    Value<String>? tagsJson,
    Value<double?>? caloriesPerServing,
    Value<double?>? proteinsG,
    Value<double?>? carbsG,
    Value<double?>? fatsG,
    Value<int>? rowid,
  }) {
    return CachedRecipesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      area: area ?? this.area,
      ingredientsJson: ingredientsJson ?? this.ingredientsJson,
      stepsJson: stepsJson ?? this.stepsJson,
      prepTimeMinutes: prepTimeMinutes ?? this.prepTimeMinutes,
      servings: servings ?? this.servings,
      difficulty: difficulty ?? this.difficulty,
      source: source ?? this.source,
      youtubeUrl: youtubeUrl ?? this.youtubeUrl,
      tagsJson: tagsJson ?? this.tagsJson,
      caloriesPerServing: caloriesPerServing ?? this.caloriesPerServing,
      proteinsG: proteinsG ?? this.proteinsG,
      carbsG: carbsG ?? this.carbsG,
      fatsG: fatsG ?? this.fatsG,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    if (ingredientsJson.present) {
      map['ingredients_json'] = Variable<String>(ingredientsJson.value);
    }
    if (stepsJson.present) {
      map['steps_json'] = Variable<String>(stepsJson.value);
    }
    if (prepTimeMinutes.present) {
      map['prep_time_minutes'] = Variable<int>(prepTimeMinutes.value);
    }
    if (servings.present) {
      map['servings'] = Variable<int>(servings.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (youtubeUrl.present) {
      map['youtube_url'] = Variable<String>(youtubeUrl.value);
    }
    if (tagsJson.present) {
      map['tags_json'] = Variable<String>(tagsJson.value);
    }
    if (caloriesPerServing.present) {
      map['calories_per_serving'] = Variable<double>(caloriesPerServing.value);
    }
    if (proteinsG.present) {
      map['proteins_g'] = Variable<double>(proteinsG.value);
    }
    if (carbsG.present) {
      map['carbs_g'] = Variable<double>(carbsG.value);
    }
    if (fatsG.present) {
      map['fats_g'] = Variable<double>(fatsG.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedRecipesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('category: $category, ')
          ..write('area: $area, ')
          ..write('ingredientsJson: $ingredientsJson, ')
          ..write('stepsJson: $stepsJson, ')
          ..write('prepTimeMinutes: $prepTimeMinutes, ')
          ..write('servings: $servings, ')
          ..write('difficulty: $difficulty, ')
          ..write('source: $source, ')
          ..write('youtubeUrl: $youtubeUrl, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('caloriesPerServing: $caloriesPerServing, ')
          ..write('proteinsG: $proteinsG, ')
          ..write('carbsG: $carbsG, ')
          ..write('fatsG: $fatsG, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SavedRecipeIdsTable extends SavedRecipeIds
    with TableInfo<$SavedRecipeIdsTable, SavedRecipeId> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavedRecipeIdsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [recipeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saved_recipe_ids';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavedRecipeId> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {recipeId};
  @override
  SavedRecipeId map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavedRecipeId(
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_id'],
      )!,
    );
  }

  @override
  $SavedRecipeIdsTable createAlias(String alias) {
    return $SavedRecipeIdsTable(attachedDatabase, alias);
  }
}

class SavedRecipeId extends DataClass implements Insertable<SavedRecipeId> {
  final String recipeId;
  const SavedRecipeId({required this.recipeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['recipe_id'] = Variable<String>(recipeId);
    return map;
  }

  SavedRecipeIdsCompanion toCompanion(bool nullToAbsent) {
    return SavedRecipeIdsCompanion(recipeId: Value(recipeId));
  }

  factory SavedRecipeId.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavedRecipeId(
      recipeId: serializer.fromJson<String>(json['recipeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'recipeId': serializer.toJson<String>(recipeId)};
  }

  SavedRecipeId copyWith({String? recipeId}) =>
      SavedRecipeId(recipeId: recipeId ?? this.recipeId);
  SavedRecipeId copyWithCompanion(SavedRecipeIdsCompanion data) {
    return SavedRecipeId(
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavedRecipeId(')
          ..write('recipeId: $recipeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => recipeId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavedRecipeId && other.recipeId == this.recipeId);
}

class SavedRecipeIdsCompanion extends UpdateCompanion<SavedRecipeId> {
  final Value<String> recipeId;
  final Value<int> rowid;
  const SavedRecipeIdsCompanion({
    this.recipeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SavedRecipeIdsCompanion.insert({
    required String recipeId,
    this.rowid = const Value.absent(),
  }) : recipeId = Value(recipeId);
  static Insertable<SavedRecipeId> custom({
    Expression<String>? recipeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (recipeId != null) 'recipe_id': recipeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SavedRecipeIdsCompanion copyWith({
    Value<String>? recipeId,
    Value<int>? rowid,
  }) {
    return SavedRecipeIdsCompanion(
      recipeId: recipeId ?? this.recipeId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedRecipeIdsCompanion(')
          ..write('recipeId: $recipeId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedRecipesTable cachedRecipes = $CachedRecipesTable(this);
  late final $SavedRecipeIdsTable savedRecipeIds = $SavedRecipeIdsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cachedRecipes,
    savedRecipeIds,
  ];
}

typedef $$CachedRecipesTableCreateCompanionBuilder =
    CachedRecipesCompanion Function({
      required String id,
      required String title,
      Value<String?> imageUrl,
      Value<String?> category,
      Value<String?> area,
      Value<String> ingredientsJson,
      Value<String> stepsJson,
      Value<int?> prepTimeMinutes,
      Value<int> servings,
      Value<String> difficulty,
      Value<String> source,
      Value<String?> youtubeUrl,
      Value<String> tagsJson,
      Value<double?> caloriesPerServing,
      Value<double?> proteinsG,
      Value<double?> carbsG,
      Value<double?> fatsG,
      Value<int> rowid,
    });
typedef $$CachedRecipesTableUpdateCompanionBuilder =
    CachedRecipesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> imageUrl,
      Value<String?> category,
      Value<String?> area,
      Value<String> ingredientsJson,
      Value<String> stepsJson,
      Value<int?> prepTimeMinutes,
      Value<int> servings,
      Value<String> difficulty,
      Value<String> source,
      Value<String?> youtubeUrl,
      Value<String> tagsJson,
      Value<double?> caloriesPerServing,
      Value<double?> proteinsG,
      Value<double?> carbsG,
      Value<double?> fatsG,
      Value<int> rowid,
    });

class $$CachedRecipesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedRecipesTable> {
  $$CachedRecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ingredientsJson => $composableBuilder(
    column: $table.ingredientsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stepsJson => $composableBuilder(
    column: $table.stepsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get prepTimeMinutes => $composableBuilder(
    column: $table.prepTimeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get youtubeUrl => $composableBuilder(
    column: $table.youtubeUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagsJson => $composableBuilder(
    column: $table.tagsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get caloriesPerServing => $composableBuilder(
    column: $table.caloriesPerServing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get proteinsG => $composableBuilder(
    column: $table.proteinsG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbsG => $composableBuilder(
    column: $table.carbsG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fatsG => $composableBuilder(
    column: $table.fatsG,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedRecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedRecipesTable> {
  $$CachedRecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredientsJson => $composableBuilder(
    column: $table.ingredientsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stepsJson => $composableBuilder(
    column: $table.stepsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get prepTimeMinutes => $composableBuilder(
    column: $table.prepTimeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get youtubeUrl => $composableBuilder(
    column: $table.youtubeUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagsJson => $composableBuilder(
    column: $table.tagsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get caloriesPerServing => $composableBuilder(
    column: $table.caloriesPerServing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get proteinsG => $composableBuilder(
    column: $table.proteinsG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbsG => $composableBuilder(
    column: $table.carbsG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fatsG => $composableBuilder(
    column: $table.fatsG,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedRecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedRecipesTable> {
  $$CachedRecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<String> get ingredientsJson => $composableBuilder(
    column: $table.ingredientsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stepsJson =>
      $composableBuilder(column: $table.stepsJson, builder: (column) => column);

  GeneratedColumn<int> get prepTimeMinutes => $composableBuilder(
    column: $table.prepTimeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get servings =>
      $composableBuilder(column: $table.servings, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get youtubeUrl => $composableBuilder(
    column: $table.youtubeUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tagsJson =>
      $composableBuilder(column: $table.tagsJson, builder: (column) => column);

  GeneratedColumn<double> get caloriesPerServing => $composableBuilder(
    column: $table.caloriesPerServing,
    builder: (column) => column,
  );

  GeneratedColumn<double> get proteinsG =>
      $composableBuilder(column: $table.proteinsG, builder: (column) => column);

  GeneratedColumn<double> get carbsG =>
      $composableBuilder(column: $table.carbsG, builder: (column) => column);

  GeneratedColumn<double> get fatsG =>
      $composableBuilder(column: $table.fatsG, builder: (column) => column);
}

class $$CachedRecipesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedRecipesTable,
          CachedRecipe,
          $$CachedRecipesTableFilterComposer,
          $$CachedRecipesTableOrderingComposer,
          $$CachedRecipesTableAnnotationComposer,
          $$CachedRecipesTableCreateCompanionBuilder,
          $$CachedRecipesTableUpdateCompanionBuilder,
          (
            CachedRecipe,
            BaseReferences<_$AppDatabase, $CachedRecipesTable, CachedRecipe>,
          ),
          CachedRecipe,
          PrefetchHooks Function()
        > {
  $$CachedRecipesTableTableManager(_$AppDatabase db, $CachedRecipesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedRecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedRecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedRecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> area = const Value.absent(),
                Value<String> ingredientsJson = const Value.absent(),
                Value<String> stepsJson = const Value.absent(),
                Value<int?> prepTimeMinutes = const Value.absent(),
                Value<int> servings = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> youtubeUrl = const Value.absent(),
                Value<String> tagsJson = const Value.absent(),
                Value<double?> caloriesPerServing = const Value.absent(),
                Value<double?> proteinsG = const Value.absent(),
                Value<double?> carbsG = const Value.absent(),
                Value<double?> fatsG = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedRecipesCompanion(
                id: id,
                title: title,
                imageUrl: imageUrl,
                category: category,
                area: area,
                ingredientsJson: ingredientsJson,
                stepsJson: stepsJson,
                prepTimeMinutes: prepTimeMinutes,
                servings: servings,
                difficulty: difficulty,
                source: source,
                youtubeUrl: youtubeUrl,
                tagsJson: tagsJson,
                caloriesPerServing: caloriesPerServing,
                proteinsG: proteinsG,
                carbsG: carbsG,
                fatsG: fatsG,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> area = const Value.absent(),
                Value<String> ingredientsJson = const Value.absent(),
                Value<String> stepsJson = const Value.absent(),
                Value<int?> prepTimeMinutes = const Value.absent(),
                Value<int> servings = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> youtubeUrl = const Value.absent(),
                Value<String> tagsJson = const Value.absent(),
                Value<double?> caloriesPerServing = const Value.absent(),
                Value<double?> proteinsG = const Value.absent(),
                Value<double?> carbsG = const Value.absent(),
                Value<double?> fatsG = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedRecipesCompanion.insert(
                id: id,
                title: title,
                imageUrl: imageUrl,
                category: category,
                area: area,
                ingredientsJson: ingredientsJson,
                stepsJson: stepsJson,
                prepTimeMinutes: prepTimeMinutes,
                servings: servings,
                difficulty: difficulty,
                source: source,
                youtubeUrl: youtubeUrl,
                tagsJson: tagsJson,
                caloriesPerServing: caloriesPerServing,
                proteinsG: proteinsG,
                carbsG: carbsG,
                fatsG: fatsG,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedRecipesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedRecipesTable,
      CachedRecipe,
      $$CachedRecipesTableFilterComposer,
      $$CachedRecipesTableOrderingComposer,
      $$CachedRecipesTableAnnotationComposer,
      $$CachedRecipesTableCreateCompanionBuilder,
      $$CachedRecipesTableUpdateCompanionBuilder,
      (
        CachedRecipe,
        BaseReferences<_$AppDatabase, $CachedRecipesTable, CachedRecipe>,
      ),
      CachedRecipe,
      PrefetchHooks Function()
    >;
typedef $$SavedRecipeIdsTableCreateCompanionBuilder =
    SavedRecipeIdsCompanion Function({
      required String recipeId,
      Value<int> rowid,
    });
typedef $$SavedRecipeIdsTableUpdateCompanionBuilder =
    SavedRecipeIdsCompanion Function({
      Value<String> recipeId,
      Value<int> rowid,
    });

class $$SavedRecipeIdsTableFilterComposer
    extends Composer<_$AppDatabase, $SavedRecipeIdsTable> {
  $$SavedRecipeIdsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get recipeId => $composableBuilder(
    column: $table.recipeId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SavedRecipeIdsTableOrderingComposer
    extends Composer<_$AppDatabase, $SavedRecipeIdsTable> {
  $$SavedRecipeIdsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get recipeId => $composableBuilder(
    column: $table.recipeId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SavedRecipeIdsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavedRecipeIdsTable> {
  $$SavedRecipeIdsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get recipeId =>
      $composableBuilder(column: $table.recipeId, builder: (column) => column);
}

class $$SavedRecipeIdsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavedRecipeIdsTable,
          SavedRecipeId,
          $$SavedRecipeIdsTableFilterComposer,
          $$SavedRecipeIdsTableOrderingComposer,
          $$SavedRecipeIdsTableAnnotationComposer,
          $$SavedRecipeIdsTableCreateCompanionBuilder,
          $$SavedRecipeIdsTableUpdateCompanionBuilder,
          (
            SavedRecipeId,
            BaseReferences<_$AppDatabase, $SavedRecipeIdsTable, SavedRecipeId>,
          ),
          SavedRecipeId,
          PrefetchHooks Function()
        > {
  $$SavedRecipeIdsTableTableManager(
    _$AppDatabase db,
    $SavedRecipeIdsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavedRecipeIdsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavedRecipeIdsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavedRecipeIdsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> recipeId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SavedRecipeIdsCompanion(recipeId: recipeId, rowid: rowid),
          createCompanionCallback:
              ({
                required String recipeId,
                Value<int> rowid = const Value.absent(),
              }) => SavedRecipeIdsCompanion.insert(
                recipeId: recipeId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SavedRecipeIdsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavedRecipeIdsTable,
      SavedRecipeId,
      $$SavedRecipeIdsTableFilterComposer,
      $$SavedRecipeIdsTableOrderingComposer,
      $$SavedRecipeIdsTableAnnotationComposer,
      $$SavedRecipeIdsTableCreateCompanionBuilder,
      $$SavedRecipeIdsTableUpdateCompanionBuilder,
      (
        SavedRecipeId,
        BaseReferences<_$AppDatabase, $SavedRecipeIdsTable, SavedRecipeId>,
      ),
      SavedRecipeId,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedRecipesTableTableManager get cachedRecipes =>
      $$CachedRecipesTableTableManager(_db, _db.cachedRecipes);
  $$SavedRecipeIdsTableTableManager get savedRecipeIds =>
      $$SavedRecipeIdsTableTableManager(_db, _db.savedRecipeIds);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'97c8cc8f253e7c6ea3b170950a83a1ed62dac332';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = ProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
