import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../recipes/domain/models/recipe.dart';

part 'menu_provider.g.dart';

enum MealType {
  breakfast('Petit-déjeuner'),
  lunch('Déjeuner'),
  dinner('Dîner'),
  snack('Collation');

  final String label;
  const MealType(this.label);
}

class MealSlotKey {
  final String date; // yyyy-MM-dd
  final MealType type;

  const MealSlotKey(this.date, this.type);

  String get key => '${date}_${type.name}';

  @override
  bool operator ==(Object other) =>
      other is MealSlotKey && other.key == key;

  @override
  int get hashCode => key.hashCode;
}

// Map<slotKey, Recipe>
@riverpod
class WeeklyMenuNotifier extends _$WeeklyMenuNotifier {
  @override
  Map<String, Recipe> build() => {};

  void assign(MealSlotKey slot, Recipe recipe) {
    state = {...state, slot.key: recipe};
  }

  void remove(MealSlotKey slot) {
    final next = Map<String, Recipe>.from(state);
    next.remove(slot.key);
    state = next;
  }

  Recipe? get(MealSlotKey slot) => state[slot.key];

  List<Recipe> allRecipes() => state.values.toList();
}
