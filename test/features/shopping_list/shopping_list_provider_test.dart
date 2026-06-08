import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cookscroll/features/recipes/domain/models/recipe.dart';
import 'package:cookscroll/features/shopping_list/presentation/providers/shopping_list_provider.dart';

void main() {
  ProviderContainer makeContainer() => ProviderContainer();

  group('ShoppingListNotifier', () {
    test('starts empty', () {
      final c = makeContainer();
      expect(c.read(shoppingListNotifierProvider), isEmpty);
    });

    test('add inserts item', () {
      final c = makeContainer();
      c.read(shoppingListNotifierProvider.notifier).add('Eggs', quantity: '3');
      final items = c.read(shoppingListNotifierProvider);
      expect(items.length, 1);
      expect(items.first.name, 'Eggs');
      expect(items.first.quantity, '3');
      expect(items.first.isChecked, isFalse);
    });

    test('toggle flips isChecked', () {
      final c = makeContainer();
      final notifier = c.read(shoppingListNotifierProvider.notifier);
      notifier.add('Milk');
      final id = c.read(shoppingListNotifierProvider).first.id;

      notifier.toggle(id);
      expect(c.read(shoppingListNotifierProvider).first.isChecked, isTrue);

      notifier.toggle(id);
      expect(c.read(shoppingListNotifierProvider).first.isChecked, isFalse);
    });

    test('remove deletes item', () {
      final c = makeContainer();
      final notifier = c.read(shoppingListNotifierProvider.notifier);
      notifier.add('Butter');
      final id = c.read(shoppingListNotifierProvider).first.id;

      notifier.remove(id);
      expect(c.read(shoppingListNotifierProvider), isEmpty);
    });

    test('clearChecked removes only checked items', () {
      final c = makeContainer();
      final notifier = c.read(shoppingListNotifierProvider.notifier);
      notifier.add('A');
      notifier.add('B');
      notifier.add('C');
      final items = c.read(shoppingListNotifierProvider);
      notifier.toggle(items[0].id);
      notifier.toggle(items[2].id);

      notifier.clearChecked();
      final remaining = c.read(shoppingListNotifierProvider);
      expect(remaining.length, 1);
      expect(remaining.first.name, 'B');
    });

    test('generateFromMenu extracts ingredients and deduplicates', () {
      final c = makeContainer();
      final recipes = [
        const Recipe(
          id: '1',
          title: 'R1',
          ingredients: [
            RecipeIngredient(name: 'Chicken breast', quantity: '200g'),
            RecipeIngredient(name: 'Garlic', quantity: '2 cloves'),
          ],
        ),
        const Recipe(
          id: '2',
          title: 'R2',
          ingredients: [
            RecipeIngredient(name: 'Garlic', quantity: '1 clove'), // duplicate
            RecipeIngredient(name: 'Olive oil', quantity: '2 tbsp'),
          ],
        ),
      ];

      c.read(shoppingListNotifierProvider.notifier).generateFromMenu(recipes);
      final items = c.read(shoppingListNotifierProvider);

      // 3 unique ingredients
      expect(items.length, 3);
      expect(items.map((i) => i.name.toLowerCase()),
          containsAll(['chicken breast', 'garlic', 'olive oil']));
    });

    test('generateFromMenu assigns correct categories', () {
      final c = makeContainer();
      final recipes = [
        const Recipe(
          id: '1',
          title: 'R',
          ingredients: [
            RecipeIngredient(name: 'Salmon', quantity: '150g'),
            RecipeIngredient(name: 'Milk', quantity: '200ml'),
            RecipeIngredient(name: 'Flour', quantity: '100g'),
            RecipeIngredient(name: 'Tomato', quantity: '2'),
          ],
        ),
      ];

      c.read(shoppingListNotifierProvider.notifier).generateFromMenu(recipes);
      final items = c.read(shoppingListNotifierProvider);

      final byName = {for (final i in items) i.name.toLowerCase(): i.category};
      expect(byName['salmon'], 'Viandes & Poissons');
      expect(byName['milk'], 'Produits laitiers');
      expect(byName['flour'], 'Épicerie');
      expect(byName['tomato'], 'Fruits & Légumes');
    });
  });
}
