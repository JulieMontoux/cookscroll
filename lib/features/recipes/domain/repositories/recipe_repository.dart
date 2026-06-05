import '../models/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> getFeed({int page = 0, Map<String, dynamic>? filters});
  Future<Recipe> getById(String id);
  Future<List<Recipe>> search(String query);
  Future<List<Recipe>> getSaved();
  Future<void> saveRecipe(String id);
  Future<void> unsaveRecipe(String id);
  Future<bool> isSaved(String id);
}
