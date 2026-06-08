// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get area => throw _privateConstructorUsedError;
  List<RecipeIngredient> get ingredients => throw _privateConstructorUsedError;
  List<String> get steps => throw _privateConstructorUsedError;
  int? get prepTimeMinutes => throw _privateConstructorUsedError;
  int? get cookTimeMinutes => throw _privateConstructorUsedError;
  int get servings => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  double? get caloriesPerServing => throw _privateConstructorUsedError;
  double? get proteinsG => throw _privateConstructorUsedError;
  double? get carbsG => throw _privateConstructorUsedError;
  double? get fatsG => throw _privateConstructorUsedError;
  List<String> get allergens => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  String? get youtubeUrl => throw _privateConstructorUsedError;
  String? get externalId => throw _privateConstructorUsedError;

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    String? imageUrl,
    String? category,
    String? area,
    List<RecipeIngredient> ingredients,
    List<String> steps,
    int? prepTimeMinutes,
    int? cookTimeMinutes,
    int servings,
    String difficulty,
    bool isPrivate,
    String source,
    double? caloriesPerServing,
    double? proteinsG,
    double? carbsG,
    double? fatsG,
    List<String> allergens,
    List<String> tags,
    bool isSaved,
    String? youtubeUrl,
    String? externalId,
  });
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? category = freezed,
    Object? area = freezed,
    Object? ingredients = null,
    Object? steps = null,
    Object? prepTimeMinutes = freezed,
    Object? cookTimeMinutes = freezed,
    Object? servings = null,
    Object? difficulty = null,
    Object? isPrivate = null,
    Object? source = null,
    Object? caloriesPerServing = freezed,
    Object? proteinsG = freezed,
    Object? carbsG = freezed,
    Object? fatsG = freezed,
    Object? allergens = null,
    Object? tags = null,
    Object? isSaved = null,
    Object? youtubeUrl = freezed,
    Object? externalId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            area: freezed == area
                ? _value.area
                : area // ignore: cast_nullable_to_non_nullable
                      as String?,
            ingredients: null == ingredients
                ? _value.ingredients
                : ingredients // ignore: cast_nullable_to_non_nullable
                      as List<RecipeIngredient>,
            steps: null == steps
                ? _value.steps
                : steps // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            prepTimeMinutes: freezed == prepTimeMinutes
                ? _value.prepTimeMinutes
                : prepTimeMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            cookTimeMinutes: freezed == cookTimeMinutes
                ? _value.cookTimeMinutes
                : cookTimeMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            servings: null == servings
                ? _value.servings
                : servings // ignore: cast_nullable_to_non_nullable
                      as int,
            difficulty: null == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as String,
            isPrivate: null == isPrivate
                ? _value.isPrivate
                : isPrivate // ignore: cast_nullable_to_non_nullable
                      as bool,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String,
            caloriesPerServing: freezed == caloriesPerServing
                ? _value.caloriesPerServing
                : caloriesPerServing // ignore: cast_nullable_to_non_nullable
                      as double?,
            proteinsG: freezed == proteinsG
                ? _value.proteinsG
                : proteinsG // ignore: cast_nullable_to_non_nullable
                      as double?,
            carbsG: freezed == carbsG
                ? _value.carbsG
                : carbsG // ignore: cast_nullable_to_non_nullable
                      as double?,
            fatsG: freezed == fatsG
                ? _value.fatsG
                : fatsG // ignore: cast_nullable_to_non_nullable
                      as double?,
            allergens: null == allergens
                ? _value.allergens
                : allergens // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isSaved: null == isSaved
                ? _value.isSaved
                : isSaved // ignore: cast_nullable_to_non_nullable
                      as bool,
            youtubeUrl: freezed == youtubeUrl
                ? _value.youtubeUrl
                : youtubeUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            externalId: freezed == externalId
                ? _value.externalId
                : externalId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
    _$RecipeImpl value,
    $Res Function(_$RecipeImpl) then,
  ) = __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    String? imageUrl,
    String? category,
    String? area,
    List<RecipeIngredient> ingredients,
    List<String> steps,
    int? prepTimeMinutes,
    int? cookTimeMinutes,
    int servings,
    String difficulty,
    bool isPrivate,
    String source,
    double? caloriesPerServing,
    double? proteinsG,
    double? carbsG,
    double? fatsG,
    List<String> allergens,
    List<String> tags,
    bool isSaved,
    String? youtubeUrl,
    String? externalId,
  });
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
    _$RecipeImpl _value,
    $Res Function(_$RecipeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? category = freezed,
    Object? area = freezed,
    Object? ingredients = null,
    Object? steps = null,
    Object? prepTimeMinutes = freezed,
    Object? cookTimeMinutes = freezed,
    Object? servings = null,
    Object? difficulty = null,
    Object? isPrivate = null,
    Object? source = null,
    Object? caloriesPerServing = freezed,
    Object? proteinsG = freezed,
    Object? carbsG = freezed,
    Object? fatsG = freezed,
    Object? allergens = null,
    Object? tags = null,
    Object? isSaved = null,
    Object? youtubeUrl = freezed,
    Object? externalId = freezed,
  }) {
    return _then(
      _$RecipeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        area: freezed == area
            ? _value.area
            : area // ignore: cast_nullable_to_non_nullable
                  as String?,
        ingredients: null == ingredients
            ? _value._ingredients
            : ingredients // ignore: cast_nullable_to_non_nullable
                  as List<RecipeIngredient>,
        steps: null == steps
            ? _value._steps
            : steps // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        prepTimeMinutes: freezed == prepTimeMinutes
            ? _value.prepTimeMinutes
            : prepTimeMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        cookTimeMinutes: freezed == cookTimeMinutes
            ? _value.cookTimeMinutes
            : cookTimeMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        servings: null == servings
            ? _value.servings
            : servings // ignore: cast_nullable_to_non_nullable
                  as int,
        difficulty: null == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as String,
        isPrivate: null == isPrivate
            ? _value.isPrivate
            : isPrivate // ignore: cast_nullable_to_non_nullable
                  as bool,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String,
        caloriesPerServing: freezed == caloriesPerServing
            ? _value.caloriesPerServing
            : caloriesPerServing // ignore: cast_nullable_to_non_nullable
                  as double?,
        proteinsG: freezed == proteinsG
            ? _value.proteinsG
            : proteinsG // ignore: cast_nullable_to_non_nullable
                  as double?,
        carbsG: freezed == carbsG
            ? _value.carbsG
            : carbsG // ignore: cast_nullable_to_non_nullable
                  as double?,
        fatsG: freezed == fatsG
            ? _value.fatsG
            : fatsG // ignore: cast_nullable_to_non_nullable
                  as double?,
        allergens: null == allergens
            ? _value._allergens
            : allergens // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isSaved: null == isSaved
            ? _value.isSaved
            : isSaved // ignore: cast_nullable_to_non_nullable
                  as bool,
        youtubeUrl: freezed == youtubeUrl
            ? _value.youtubeUrl
            : youtubeUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        externalId: freezed == externalId
            ? _value.externalId
            : externalId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeImpl implements _Recipe {
  const _$RecipeImpl({
    required this.id,
    required this.title,
    this.description,
    this.imageUrl,
    this.category,
    this.area,
    final List<RecipeIngredient> ingredients = const [],
    final List<String> steps = const [],
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.servings = 2,
    this.difficulty = 'easy',
    this.isPrivate = false,
    this.source = 'catalog',
    this.caloriesPerServing,
    this.proteinsG,
    this.carbsG,
    this.fatsG,
    final List<String> allergens = const [],
    final List<String> tags = const [],
    this.isSaved = false,
    this.youtubeUrl,
    this.externalId,
  }) : _ingredients = ingredients,
       _steps = steps,
       _allergens = allergens,
       _tags = tags;

  factory _$RecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final String? category;
  @override
  final String? area;
  final List<RecipeIngredient> _ingredients;
  @override
  @JsonKey()
  List<RecipeIngredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<String> _steps;
  @override
  @JsonKey()
  List<String> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final int? prepTimeMinutes;
  @override
  final int? cookTimeMinutes;
  @override
  @JsonKey()
  final int servings;
  @override
  @JsonKey()
  final String difficulty;
  @override
  @JsonKey()
  final bool isPrivate;
  @override
  @JsonKey()
  final String source;
  @override
  final double? caloriesPerServing;
  @override
  final double? proteinsG;
  @override
  final double? carbsG;
  @override
  final double? fatsG;
  final List<String> _allergens;
  @override
  @JsonKey()
  List<String> get allergens {
    if (_allergens is EqualUnmodifiableListView) return _allergens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergens);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final bool isSaved;
  @override
  final String? youtubeUrl;
  @override
  final String? externalId;

  @override
  String toString() {
    return 'Recipe(id: $id, title: $title, description: $description, imageUrl: $imageUrl, category: $category, area: $area, ingredients: $ingredients, steps: $steps, prepTimeMinutes: $prepTimeMinutes, cookTimeMinutes: $cookTimeMinutes, servings: $servings, difficulty: $difficulty, isPrivate: $isPrivate, source: $source, caloriesPerServing: $caloriesPerServing, proteinsG: $proteinsG, carbsG: $carbsG, fatsG: $fatsG, allergens: $allergens, tags: $tags, isSaved: $isSaved, youtubeUrl: $youtubeUrl, externalId: $externalId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.area, area) || other.area == area) &&
            const DeepCollectionEquality().equals(
              other._ingredients,
              _ingredients,
            ) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.prepTimeMinutes, prepTimeMinutes) ||
                other.prepTimeMinutes == prepTimeMinutes) &&
            (identical(other.cookTimeMinutes, cookTimeMinutes) ||
                other.cookTimeMinutes == cookTimeMinutes) &&
            (identical(other.servings, servings) ||
                other.servings == servings) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.caloriesPerServing, caloriesPerServing) ||
                other.caloriesPerServing == caloriesPerServing) &&
            (identical(other.proteinsG, proteinsG) ||
                other.proteinsG == proteinsG) &&
            (identical(other.carbsG, carbsG) || other.carbsG == carbsG) &&
            (identical(other.fatsG, fatsG) || other.fatsG == fatsG) &&
            const DeepCollectionEquality().equals(
              other._allergens,
              _allergens,
            ) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.youtubeUrl, youtubeUrl) ||
                other.youtubeUrl == youtubeUrl) &&
            (identical(other.externalId, externalId) ||
                other.externalId == externalId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    title,
    description,
    imageUrl,
    category,
    area,
    const DeepCollectionEquality().hash(_ingredients),
    const DeepCollectionEquality().hash(_steps),
    prepTimeMinutes,
    cookTimeMinutes,
    servings,
    difficulty,
    isPrivate,
    source,
    caloriesPerServing,
    proteinsG,
    carbsG,
    fatsG,
    const DeepCollectionEquality().hash(_allergens),
    const DeepCollectionEquality().hash(_tags),
    isSaved,
    youtubeUrl,
    externalId,
  ]);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeImplToJson(this);
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe({
    required final String id,
    required final String title,
    final String? description,
    final String? imageUrl,
    final String? category,
    final String? area,
    final List<RecipeIngredient> ingredients,
    final List<String> steps,
    final int? prepTimeMinutes,
    final int? cookTimeMinutes,
    final int servings,
    final String difficulty,
    final bool isPrivate,
    final String source,
    final double? caloriesPerServing,
    final double? proteinsG,
    final double? carbsG,
    final double? fatsG,
    final List<String> allergens,
    final List<String> tags,
    final bool isSaved,
    final String? youtubeUrl,
    final String? externalId,
  }) = _$RecipeImpl;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$RecipeImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get imageUrl;
  @override
  String? get category;
  @override
  String? get area;
  @override
  List<RecipeIngredient> get ingredients;
  @override
  List<String> get steps;
  @override
  int? get prepTimeMinutes;
  @override
  int? get cookTimeMinutes;
  @override
  int get servings;
  @override
  String get difficulty;
  @override
  bool get isPrivate;
  @override
  String get source;
  @override
  double? get caloriesPerServing;
  @override
  double? get proteinsG;
  @override
  double? get carbsG;
  @override
  double? get fatsG;
  @override
  List<String> get allergens;
  @override
  List<String> get tags;
  @override
  bool get isSaved;
  @override
  String? get youtubeUrl;
  @override
  String? get externalId;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeIngredient _$RecipeIngredientFromJson(Map<String, dynamic> json) {
  return _RecipeIngredient.fromJson(json);
}

/// @nodoc
mixin _$RecipeIngredient {
  String get name => throw _privateConstructorUsedError;
  String? get quantity => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;

  /// Serializes this RecipeIngredient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeIngredient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeIngredientCopyWith<RecipeIngredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeIngredientCopyWith<$Res> {
  factory $RecipeIngredientCopyWith(
    RecipeIngredient value,
    $Res Function(RecipeIngredient) then,
  ) = _$RecipeIngredientCopyWithImpl<$Res, RecipeIngredient>;
  @useResult
  $Res call({String name, String? quantity, String? unit});
}

/// @nodoc
class _$RecipeIngredientCopyWithImpl<$Res, $Val extends RecipeIngredient>
    implements $RecipeIngredientCopyWith<$Res> {
  _$RecipeIngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeIngredient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = freezed,
    Object? unit = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: freezed == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as String?,
            unit: freezed == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecipeIngredientImplCopyWith<$Res>
    implements $RecipeIngredientCopyWith<$Res> {
  factory _$$RecipeIngredientImplCopyWith(
    _$RecipeIngredientImpl value,
    $Res Function(_$RecipeIngredientImpl) then,
  ) = __$$RecipeIngredientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? quantity, String? unit});
}

/// @nodoc
class __$$RecipeIngredientImplCopyWithImpl<$Res>
    extends _$RecipeIngredientCopyWithImpl<$Res, _$RecipeIngredientImpl>
    implements _$$RecipeIngredientImplCopyWith<$Res> {
  __$$RecipeIngredientImplCopyWithImpl(
    _$RecipeIngredientImpl _value,
    $Res Function(_$RecipeIngredientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecipeIngredient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = freezed,
    Object? unit = freezed,
  }) {
    return _then(
      _$RecipeIngredientImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: freezed == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as String?,
        unit: freezed == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeIngredientImpl implements _RecipeIngredient {
  const _$RecipeIngredientImpl({required this.name, this.quantity, this.unit});

  factory _$RecipeIngredientImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeIngredientImplFromJson(json);

  @override
  final String name;
  @override
  final String? quantity;
  @override
  final String? unit;

  @override
  String toString() {
    return 'RecipeIngredient(name: $name, quantity: $quantity, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeIngredientImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, quantity, unit);

  /// Create a copy of RecipeIngredient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeIngredientImplCopyWith<_$RecipeIngredientImpl> get copyWith =>
      __$$RecipeIngredientImplCopyWithImpl<_$RecipeIngredientImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeIngredientImplToJson(this);
  }
}

abstract class _RecipeIngredient implements RecipeIngredient {
  const factory _RecipeIngredient({
    required final String name,
    final String? quantity,
    final String? unit,
  }) = _$RecipeIngredientImpl;

  factory _RecipeIngredient.fromJson(Map<String, dynamic> json) =
      _$RecipeIngredientImpl.fromJson;

  @override
  String get name;
  @override
  String? get quantity;
  @override
  String? get unit;

  /// Create a copy of RecipeIngredient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeIngredientImplCopyWith<_$RecipeIngredientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
