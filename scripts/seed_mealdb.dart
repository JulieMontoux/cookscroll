// Run: dart run scripts/seed_mealdb.dart
// Fetches all categories then up to 20 recipes per category from TheMealDB.
// Outputs: scripts/seed_recipes.json (200+ recipes)

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

const _base = 'https://www.themealdb.com/api/json/v1/1';

Future<void> main() async {
  final categoriesRes =
      await http.get(Uri.parse('$_base/categories.php'));
  final categories = (jsonDecode(categoriesRes.body)['categories'] as List)
      .map((c) => c['strCategory'] as String)
      .toList();

  print('Found ${categories.length} categories');

  final allRecipes = <Map<String, dynamic>>[];

  for (final cat in categories) {
    final listRes = await http
        .get(Uri.parse('$_base/filter.php?c=${Uri.encodeComponent(cat)}'));
    final meals = (jsonDecode(listRes.body)['meals'] as List? ?? [])
        .take(20)
        .toList();

    print('Category $cat: ${meals.length} meals');

    for (final meal in meals) {
      final id = meal['idMeal'] as String;
      final detailRes =
          await http.get(Uri.parse('$_base/lookup.php?i=$id'));
      final details =
          (jsonDecode(detailRes.body)['meals'] as List?)?.firstOrNull;
      if (details != null) allRecipes.add(details as Map<String, dynamic>);
      await Future.delayed(const Duration(milliseconds: 50)); // rate limit
    }

    print('Total so far: ${allRecipes.length}');
  }

  final output = File('scripts/seed_recipes.json');
  await output.writeAsString(
      const JsonEncoder.withIndent('  ').convert(allRecipes));

  print('\nDone! ${allRecipes.length} recipes written to ${output.path}');
}
