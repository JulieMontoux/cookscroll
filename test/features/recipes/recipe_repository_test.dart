import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:cookscroll/features/recipes/data/datasources/meal_db_datasource.dart';
import 'package:cookscroll/features/recipes/data/repositories/recipe_repository_impl.dart';
import 'package:cookscroll/features/recipes/domain/models/recipe.dart';

import 'recipe_repository_test.mocks.dart';

@GenerateMocks([MealDbDatasource])
void main() {
  late MockMealDbDatasource datasource;
  late RecipeRepositoryImpl repo;

  final mockRecipes = List.generate(
    15,
    (i) => Recipe(id: 'r$i', title: 'Recipe $i', category: 'Chicken'),
  );

  setUp(() {
    datasource = MockMealDbDatasource();
    repo = RecipeRepositoryImpl(datasource);
  });

  group('getFeed', () {
    test('returns first page (10 items) from category', () async {
      when(datasource.getMealsByCategory(any))
          .thenAnswer((_) async => mockRecipes);

      final page0 = await repo.getFeed(page: 0);
      expect(page0.length, 10);
      expect(page0.first.id, 'r0');
    });

    test('returns second page from cache without extra API call', () async {
      when(datasource.getMealsByCategory(any))
          .thenAnswer((_) async => mockRecipes);

      await repo.getFeed(page: 0);
      final page1 = await repo.getFeed(page: 1);

      // Only called once — second page served from cache
      verify(datasource.getMealsByCategory(any)).called(1);
      expect(page1.length, 5); // 15 total, page1 = items 10–14
    });

    test('returns empty list when past cache end', () async {
      when(datasource.getMealsByCategory(any))
          .thenAnswer((_) async => mockRecipes);

      await repo.getFeed(page: 0);
      final page2 = await repo.getFeed(page: 2);
      expect(page2, isEmpty);
    });

    test('applies maxPrepTime filter', () async {
      final recipes = [
        const Recipe(id: '1', title: 'Fast', prepTimeMinutes: 10),
        const Recipe(id: '2', title: 'Slow', prepTimeMinutes: 60),
        ...List.generate(13, (i) => Recipe(id: 'x$i', title: 'x$i')),
      ];
      when(datasource.getMealsByCategory(any)).thenAnswer((_) async => recipes);

      final result =
          await repo.getFeed(page: 0, filters: {'maxPrepTime': 30});
      expect(result.every((r) =>
          r.prepTimeMinutes == null || r.prepTimeMinutes! <= 30), isTrue);
    });

    test('applies difficulty filter', () async {
      final recipes = [
        const Recipe(id: '1', title: 'Easy', difficulty: 'easy'),
        const Recipe(id: '2', title: 'Hard', difficulty: 'hard'),
        ...List.generate(13, (i) => Recipe(id: 'x$i', title: 'x$i')),
      ];
      when(datasource.getMealsByCategory(any)).thenAnswer((_) async => recipes);

      final result =
          await repo.getFeed(page: 0, filters: {'difficulty': 'easy'});
      expect(result.every((r) => r.difficulty == 'easy'), isTrue);
    });
  });

  group('save / unsave', () {
    test('isSaved reflects save and unsave', () async {
      await repo.saveRecipe('r0');
      expect(await repo.isSaved('r0'), isTrue);

      await repo.unsaveRecipe('r0');
      expect(await repo.isSaved('r0'), isFalse);
    });

    test('getSaved returns only saved recipes in cache', () async {
      when(datasource.getMealsByCategory(any))
          .thenAnswer((_) async => mockRecipes);
      await repo.getFeed(page: 0);

      await repo.saveRecipe('r0');
      await repo.saveRecipe('r2');

      final saved = await repo.getSaved();
      expect(saved.map((r) => r.id), containsAll(['r0', 'r2']));
      expect(saved.length, 2);
    });
  });

  group('search', () {
    test('delegates to datasource', () async {
      when(datasource.searchMeals('pasta'))
          .thenAnswer((_) async => [const Recipe(id: '1', title: 'Pasta')]);

      final results = await repo.search('pasta');
      expect(results.length, 1);
      verify(datasource.searchMeals('pasta')).called(1);
    });
  });
}
