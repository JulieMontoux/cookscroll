import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../recipes/domain/models/recipe.dart';

part 'shopping_list_provider.g.dart';

class ShoppingItem {
  final String id;
  final String name;
  final String? quantity;
  final String category;
  final bool isChecked;

  const ShoppingItem({
    required this.id,
    required this.name,
    this.quantity,
    this.category = 'Autre',
    this.isChecked = false,
  });

  ShoppingItem copyWith({
    String? name,
    String? quantity,
    String? category,
    bool? isChecked,
  }) {
    return ShoppingItem(
      id: id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}

int _idCounter = 0;
String _newId() => '${DateTime.now().millisecondsSinceEpoch}_${_idCounter++}';

@riverpod
class ShoppingListNotifier extends _$ShoppingListNotifier {
  @override
  List<ShoppingItem> build() => [];

  void toggle(String id) {
    state = state
        .map((i) => i.id == id ? i.copyWith(isChecked: !i.isChecked) : i)
        .toList();
  }

  void add(String name, {String? quantity, String category = 'Autre'}) {
    state = [
      ...state,
      ShoppingItem(
        id: _newId(),
        name: name.trim(),
        quantity: quantity?.trim(),
        category: category,
      ),
    ];
  }

  void remove(String id) => state = state.where((i) => i.id != id).toList();

  void clearChecked() => state = state.where((i) => !i.isChecked).toList();

  void generateFromMenu(List<Recipe> recipes) {
    final Map<String, ShoppingItem> merged = {};
    for (final r in recipes) {
      for (final ing in r.ingredients) {
        final key = ing.name.toLowerCase();
        if (!merged.containsKey(key)) {
          merged[key] = ShoppingItem(
            id: _newId(),
            name: ing.name,
            quantity: ing.quantity,
            category: _guessCategory(ing.name),
          );
        }
      }
    }
    // Keep existing manual items, add generated ones
    final existingNames = state.map((i) => i.name.toLowerCase()).toSet();
    final toAdd = merged.values
        .where((i) => !existingNames.contains(i.name.toLowerCase()))
        .toList();
    state = [...state, ...toAdd];
  }

  static String _guessCategory(String name) {
    final n = name.toLowerCase();
    if (RegExp(r'chicken|beef|pork|lamb|fish|salmon|shrimp|prawn|mince|bacon|sausage').hasMatch(n)) {
      return 'Viandes & Poissons';
    }
    if (RegExp(r'milk|cream|butter|cheese|yogurt|egg').hasMatch(n)) {
      return 'Produits laitiers';
    }
    if (RegExp(r'flour|sugar|salt|pepper|oil|vinegar|sauce|paste|stock|broth').hasMatch(n)) {
      return 'Épicerie';
    }
    if (RegExp(r'onion|garlic|tomato|potato|carrot|celery|pepper|lettuce|spinach|mushroom|courgette|zucchini|broccoli|cauliflower|leek|corn|bean|pea|lemon|lime|ginger|herb|basil|parsley|thyme|rosemary').hasMatch(n)) {
      return 'Fruits & Légumes';
    }
    if (RegExp(r'rice|pasta|noodle|bread|cracker|cereal').hasMatch(n)) {
      return 'Féculents';
    }
    return 'Autre';
  }
}

// Sorted categories for display
const shoppingCategories = [
  'Fruits & Légumes',
  'Viandes & Poissons',
  'Produits laitiers',
  'Féculents',
  'Épicerie',
  'Autre',
];
