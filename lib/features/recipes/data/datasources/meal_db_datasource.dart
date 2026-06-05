import 'package:dio/dio.dart';
import '../../domain/models/recipe.dart';
import '../../../../core/constants/api_constants.dart';

class MealDbDatasource {
  final Dio _dio;

  MealDbDatasource(this._dio);

  Future<List<Recipe>> searchMeals(String query) async {
    final res = await _dio.get(
      '${ApiConstants.mealDbBaseUrl}${ApiConstants.searchMeals}',
      queryParameters: {'s': query},
    );
    final meals = res.data['meals'] as List? ?? [];
    return meals.map((m) => _mealToRecipe(m as Map<String, dynamic>)).toList();
  }

  Future<List<Recipe>> getMealsByCategory(String category) async {
    final res = await _dio.get(
      '${ApiConstants.mealDbBaseUrl}${ApiConstants.mealsByCategory}',
      queryParameters: {'c': category},
    );
    final meals = res.data['meals'] as List? ?? [];
    // Filter endpoint returns partial data — fetch full details
    final ids = meals.map((m) => m['idMeal'] as String).take(20).toList();
    final full = await Future.wait(ids.map(getMealById));
    return full.whereType<Recipe>().toList();
  }

  Future<Recipe?> getMealById(String id) async {
    final res = await _dio.get(
      '${ApiConstants.mealDbBaseUrl}${ApiConstants.mealById}',
      queryParameters: {'i': id},
    );
    final meals = res.data['meals'] as List?;
    if (meals == null || meals.isEmpty) return null;
    return _mealToRecipe(meals.first);
  }

  Future<Recipe> getRandomMeal() async {
    final res = await _dio.get(
      '${ApiConstants.mealDbBaseUrl}${ApiConstants.randomMeal}',
    );
    return _mealToRecipe(res.data['meals'].first);
  }

  Future<List<String>> getCategories() async {
    final res = await _dio.get(
      '${ApiConstants.mealDbBaseUrl}${ApiConstants.mealCategories}',
    );
    final cats = res.data['categories'] as List? ?? [];
    return cats.map((c) => c['strCategory'] as String).toList();
  }

  Recipe _mealToRecipe(Map<String, dynamic> m) {
    final ingredients = <RecipeIngredient>[];
    for (int i = 1; i <= 20; i++) {
      final name = m['strIngredient$i'] as String?;
      final measure = m['strMeasure$i'] as String?;
      if (name != null && name.trim().isNotEmpty) {
        ingredients.add(RecipeIngredient(
          name: name.trim(),
          quantity: measure?.trim(),
        ));
      }
    }

    final instructionsRaw = m['strInstructions'] as String? ?? '';
    final steps = instructionsRaw
        .split(RegExp(r'\r?\n'))
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    return Recipe(
      id: m['idMeal'] as String,
      externalId: m['idMeal'] as String,
      title: m['strMeal'] as String? ?? '',
      imageUrl: m['strMealThumb'] as String?,
      category: m['strCategory'] as String?,
      area: m['strArea'] as String?,
      ingredients: ingredients,
      steps: steps,
      youtubeUrl: m['strYoutube'] as String?,
      source: 'catalog',
      // Macros not provided by TheMealDB — will enrich via USDA later
      tags: (m['strTags'] as String?)
              ?.split(',')
              .map((t) => t.trim())
              .where((t) => t.isNotEmpty)
              .toList() ??
          [],
    );
  }
}
