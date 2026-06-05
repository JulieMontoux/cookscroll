import '../../domain/models/recipe.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../datasources/meal_db_datasource.dart';

// Categories cycled for the infinite feed
const _feedCategories = [
  'Chicken', 'Beef', 'Seafood', 'Vegetarian', 'Pasta',
  'Dessert', 'Lamb', 'Pork', 'Side', 'Starter',
];

class RecipeRepositoryImpl implements RecipeRepository {
  final MealDbDatasource _remote;
  final Set<String> _savedIds = {};
  final List<Recipe> _feedCache = [];
  int _categoryIndex = 0;

  RecipeRepositoryImpl(this._remote);

  @override
  Future<List<Recipe>> getFeed({int page = 0, Map<String, dynamic>? filters}) async {
    // Seed the cache with enough recipes for a page
    if (_feedCache.length < (page + 1) * 10) {
      final cat = _feedCategories[_categoryIndex % _feedCategories.length];
      _categoryIndex++;
      final recipes = await _remote.getMealsByCategory(cat);
      _feedCache.addAll(recipes);
    }

    final start = page * 10;
    final end = (start + 10).clamp(0, _feedCache.length);
    if (start >= _feedCache.length) return [];

    var page_ = _feedCache.sublist(start, end);

    // Apply filters
    if (filters != null) {
      final maxPrepTime = filters['maxPrepTime'] as int?;
      final allergens = filters['allergens'] as List<String>?;
      final difficulty = filters['difficulty'] as String?;

      if (maxPrepTime != null) {
        page_ = page_.where((r) =>
            r.prepTimeMinutes == null || r.prepTimeMinutes! <= maxPrepTime).toList();
      }
      if (allergens != null && allergens.isNotEmpty) {
        page_ = page_.where((r) =>
            allergens.every((a) => !r.allergens.contains(a))).toList();
      }
      if (difficulty != null) {
        page_ = page_.where((r) => r.difficulty == difficulty).toList();
      }
    }

    return page_.map((r) => r.copyWith(isSaved: _savedIds.contains(r.id))).toList();
  }

  @override
  Future<Recipe> getById(String id) async {
    final cached = _feedCache.where((r) => r.id == id).firstOrNull;
    if (cached != null) return cached.copyWith(isSaved: _savedIds.contains(id));
    final recipe = await _remote.getMealById(id);
    return (recipe ?? const Recipe(id: '', title: 'Unknown'))
        .copyWith(isSaved: _savedIds.contains(id));
  }

  @override
  Future<List<Recipe>> search(String query) async {
    final results = await _remote.searchMeals(query);
    return results.map((r) => r.copyWith(isSaved: _savedIds.contains(r.id))).toList();
  }

  @override
  Future<List<Recipe>> getSaved() async {
    return _feedCache
        .where((r) => _savedIds.contains(r.id))
        .map((r) => r.copyWith(isSaved: true))
        .toList();
  }

  @override
  Future<void> saveRecipe(String id) async => _savedIds.add(id);

  @override
  Future<void> unsaveRecipe(String id) async => _savedIds.remove(id);

  @override
  Future<bool> isSaved(String id) async => _savedIds.contains(id);
}
