// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savedRecipesHash() => r'508032eb3fbaea03a0fa8fe0d08f1c8fd58b91db';

/// See also [savedRecipes].
@ProviderFor(savedRecipes)
final savedRecipesProvider = AutoDisposeFutureProvider<List<Recipe>>.internal(
  savedRecipes,
  name: r'savedRecipesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedRecipesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SavedRecipesRef = AutoDisposeFutureProviderRef<List<Recipe>>;
String _$recipeByIdHash() => r'9ff77aadbcd231c6b526258e0d99e50f80ecd72d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [recipeById].
@ProviderFor(recipeById)
const recipeByIdProvider = RecipeByIdFamily();

/// See also [recipeById].
class RecipeByIdFamily extends Family<AsyncValue<Recipe>> {
  /// See also [recipeById].
  const RecipeByIdFamily();

  /// See also [recipeById].
  RecipeByIdProvider call(String id) {
    return RecipeByIdProvider(id);
  }

  @override
  RecipeByIdProvider getProviderOverride(
    covariant RecipeByIdProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipeByIdProvider';
}

/// See also [recipeById].
class RecipeByIdProvider extends AutoDisposeFutureProvider<Recipe> {
  /// See also [recipeById].
  RecipeByIdProvider(String id)
    : this._internal(
        (ref) => recipeById(ref as RecipeByIdRef, id),
        from: recipeByIdProvider,
        name: r'recipeByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$recipeByIdHash,
        dependencies: RecipeByIdFamily._dependencies,
        allTransitiveDependencies: RecipeByIdFamily._allTransitiveDependencies,
        id: id,
      );

  RecipeByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Recipe> Function(RecipeByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipeByIdProvider._internal(
        (ref) => create(ref as RecipeByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Recipe> createElement() {
    return _RecipeByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeByIdRef on AutoDisposeFutureProviderRef<Recipe> {
  /// The parameter `id` of this provider.
  String get id;
}

class _RecipeByIdProviderElement
    extends AutoDisposeFutureProviderElement<Recipe>
    with RecipeByIdRef {
  _RecipeByIdProviderElement(super.provider);

  @override
  String get id => (origin as RecipeByIdProvider).id;
}

String _$feedFiltersNotifierHash() =>
    r'9009c243485e8b75682e84565a782a4b01a0af4f';

/// See also [FeedFiltersNotifier].
@ProviderFor(FeedFiltersNotifier)
final feedFiltersNotifierProvider =
    AutoDisposeNotifierProvider<FeedFiltersNotifier, FeedFilters>.internal(
      FeedFiltersNotifier.new,
      name: r'feedFiltersNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$feedFiltersNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FeedFiltersNotifier = AutoDisposeNotifier<FeedFilters>;
String _$feedNotifierHash() => r'05907a6aa65ff8b975aa17b7a0824b8d268957be';

/// See also [FeedNotifier].
@ProviderFor(FeedNotifier)
final feedNotifierProvider =
    AutoDisposeAsyncNotifierProvider<FeedNotifier, List<Recipe>>.internal(
      FeedNotifier.new,
      name: r'feedNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$feedNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FeedNotifier = AutoDisposeAsyncNotifier<List<Recipe>>;
String _$searchNotifierHash() => r'392dd1719ff084c8809fd50955fdde75c7439771';

/// See also [SearchNotifier].
@ProviderFor(SearchNotifier)
final searchNotifierProvider =
    AutoDisposeNotifierProvider<
      SearchNotifier,
      AsyncValue<List<Recipe>>
    >.internal(
      SearchNotifier.new,
      name: r'searchNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchNotifier = AutoDisposeNotifier<AsyncValue<List<Recipe>>>;
String _$userRecipesNotifierHash() =>
    r'593305fce0c05eee9641b8460cc656fbfdeb91b7';

/// See also [UserRecipesNotifier].
@ProviderFor(UserRecipesNotifier)
final userRecipesNotifierProvider =
    AutoDisposeNotifierProvider<UserRecipesNotifier, List<Recipe>>.internal(
      UserRecipesNotifier.new,
      name: r'userRecipesNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userRecipesNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UserRecipesNotifier = AutoDisposeNotifier<List<Recipe>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
