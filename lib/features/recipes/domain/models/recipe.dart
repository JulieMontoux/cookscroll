import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String title,
    String? description,
    String? imageUrl,
    String? category,
    String? area,
    @Default([]) List<RecipeIngredient> ingredients,
    @Default([]) List<String> steps,
    int? prepTimeMinutes,
    int? cookTimeMinutes,
    @Default(2) int servings,
    @Default('easy') String difficulty,
    @Default(false) bool isPrivate,
    @Default('catalog') String source,
    double? caloriesPerServing,
    double? proteinsG,
    double? carbsG,
    double? fatsG,
    @Default([]) List<String> allergens,
    @Default([]) List<String> tags,
    @Default(false) bool isSaved,
    String? youtubeUrl,
    String? externalId,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

@freezed
class RecipeIngredient with _$RecipeIngredient {
  const factory RecipeIngredient({
    required String name,
    String? quantity,
    String? unit,
  }) = _RecipeIngredient;

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientFromJson(json);
}
