import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_database.g.dart';

// ── Tables ───────────────────────────────────────────────────────────────────

class CachedRecipes extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get area => text().nullable()();
  TextColumn get ingredientsJson => text().withDefault(const Constant('[]'))();
  TextColumn get stepsJson => text().withDefault(const Constant('[]'))();
  IntColumn get prepTimeMinutes => integer().nullable()();
  IntColumn get servings => integer().withDefault(const Constant(2))();
  TextColumn get difficulty => text().withDefault(const Constant('easy'))();
  TextColumn get source => text().withDefault(const Constant('catalog'))();
  TextColumn get youtubeUrl => text().nullable()();
  TextColumn get tagsJson => text().withDefault(const Constant('[]'))();
  RealColumn get caloriesPerServing => real().nullable()();
  RealColumn get proteinsG => real().nullable()();
  RealColumn get carbsG => real().nullable()();
  RealColumn get fatsG => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class SavedRecipeIds extends Table {
  TextColumn get recipeId => text()();

  @override
  Set<Column> get primaryKey => {recipeId};
}

// ── Database ─────────────────────────────────────────────────────────────────

@DriftDatabase(tables: [CachedRecipes, SavedRecipeIds])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  // Recipes
  Future<List<CachedRecipe>> getAllCachedRecipes() =>
      select(cachedRecipes).get();

  Future<CachedRecipe?> getCachedRecipeById(String id) =>
      (select(cachedRecipes)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsertRecipe(CachedRecipesCompanion recipe) =>
      into(cachedRecipes).insertOnConflictUpdate(recipe);

  Future<void> upsertRecipes(List<CachedRecipesCompanion> recipes) =>
      batch((b) => b.insertAllOnConflictUpdate(cachedRecipes, recipes));

  // Saved IDs
  Future<List<SavedRecipeId>> getSavedIds() =>
      select(savedRecipeIds).get();

  Future<void> saveId(String id) =>
      into(savedRecipeIds)
          .insertOnConflictUpdate(SavedRecipeIdsCompanion(recipeId: Value(id)));

  Future<void> unsaveId(String id) =>
      (delete(savedRecipeIds)..where((t) => t.recipeId.equals(id))).go();

  Future<bool> isSavedId(String id) async {
    final row = await (select(savedRecipeIds)
          ..where((t) => t.recipeId.equals(id)))
        .getSingleOrNull();
    return row != null;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'cookscroll.db'));
    return NativeDatabase.createInBackground(file);
  });
}

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase(_openConnection());
  ref.onDispose(db.close);
  return db;
}
