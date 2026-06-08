import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/providers.dart';
import '../../domain/models/recipe.dart';

part 'recipe_provider.g.dart';

// Active filters state
class FeedFilters {
  final int? maxPrepTime;
  final List<String> allergens;
  final String? difficulty;

  const FeedFilters({
    this.maxPrepTime,
    this.allergens = const [],
    this.difficulty,
  });

  Map<String, dynamic>? toMap() {
    if (maxPrepTime == null && allergens.isEmpty && difficulty == null) {
      return null;
    }
    return {
      if (maxPrepTime != null) 'maxPrepTime': maxPrepTime,
      if (allergens.isNotEmpty) 'allergens': allergens,
      if (difficulty != null) 'difficulty': difficulty,
    };
  }

  FeedFilters copyWith({
    Object? maxPrepTime = _sentinel,
    List<String>? allergens,
    Object? difficulty = _sentinel,
  }) {
    return FeedFilters(
      maxPrepTime: maxPrepTime == _sentinel ? this.maxPrepTime : maxPrepTime as int?,
      allergens: allergens ?? this.allergens,
      difficulty: difficulty == _sentinel ? this.difficulty : difficulty as String?,
    );
  }
}

const _sentinel = Object();

@riverpod
class FeedFiltersNotifier extends _$FeedFiltersNotifier {
  @override
  FeedFilters build() => const FeedFilters();

  void setMaxPrepTime(int? minutes) =>
      state = state.copyWith(maxPrepTime: minutes);

  void toggleAllergen(String allergen) {
    final list = List<String>.from(state.allergens);
    if (list.contains(allergen)) {
      list.remove(allergen);
    } else {
      list.add(allergen);
    }
    state = state.copyWith(allergens: list);
  }

  void setDifficulty(String? difficulty) =>
      state = state.copyWith(difficulty: difficulty);

  void reset() => state = const FeedFilters();
}

@riverpod
class FeedNotifier extends _$FeedNotifier {
  final List<Recipe> _all = [];
  int _page = 0;
  bool _hasMore = true;

  @override
  Future<List<Recipe>> build() async {
    _all.clear();
    _page = 0;
    _hasMore = true;
    return _loadMore();
  }

  Future<List<Recipe>> _loadMore() async {
    final repo = ref.read(recipeRepositoryProvider);
    final filters = ref.read(feedFiltersNotifierProvider);
    final recipes = await repo.getFeed(page: _page, filters: filters.toMap());
    if (recipes.isEmpty) {
      _hasMore = false;
    } else {
      _all.addAll(recipes);
      _page++;
    }
    return List.unmodifiable(_all);
  }

  Future<void> fetchMore() async {
    if (!_hasMore) return;
    final prev = state.valueOrNull ?? [];
    state = AsyncData(prev); // keep current while loading
    final result = await _loadMore();
    state = AsyncData(result);
  }

  Future<void> applyFilters() async {
    state = const AsyncLoading();
    _all.clear();
    _page = 0;
    _hasMore = true;
    state = await AsyncValue.guard(_loadMore);
  }

  Future<void> toggleSave(String id, bool currentlySaved) async {
    final repo = ref.read(recipeRepositoryProvider);
    if (currentlySaved) {
      await repo.unsaveRecipe(id);
    } else {
      await repo.saveRecipe(id);
    }
    // Reflect save state in list
    final updated = _all
        .map((r) => r.id == id ? r.copyWith(isSaved: !currentlySaved) : r)
        .toList();
    _all
      ..clear()
      ..addAll(updated);
    state = AsyncData(List.unmodifiable(_all));
  }
}

@riverpod
Future<List<Recipe>> savedRecipes(Ref ref) async {
  return ref.watch(recipeRepositoryProvider).getSaved();
}

@riverpod
Future<Recipe> recipeById(Ref ref, String id) async {
  return ref.watch(recipeRepositoryProvider).getById(id);
}

// ── Search ──────────────────────────────────────────────────────────────────

@riverpod
class SearchNotifier extends _$SearchNotifier {
  @override
  AsyncValue<List<Recipe>> build() => const AsyncData([]);

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      state = const AsyncData([]);
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(recipeRepositoryProvider).search(query.trim()),
    );
  }

  void clear() => state = const AsyncData([]);
}

// ── User-created recipes (in-memory for MVP) ─────────────────────────────

@riverpod
class UserRecipesNotifier extends _$UserRecipesNotifier {
  @override
  List<Recipe> build() => [];

  void add(Recipe recipe) => state = [recipe, ...state];

  void remove(String id) => state = state.where((r) => r.id != id).toList();
}
