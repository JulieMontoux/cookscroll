import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gamification_provider.g.dart';

enum Badge {
  firstSave('Première sauvegarde', '🔖', 'Sauvegardé votre 1ère recette'),
  fiveSaves('Collectionneur', '📚', '5 recettes sauvegardées'),
  tenSaves('Gourmet', '⭐', '10 recettes sauvegardées'),
  firstRecipe('Créateur', '👨‍🍳', 'Créé votre 1ère recette'),
  streakThree('3 jours d\'affilée', '🔥', 'Connecté 3 jours de suite'),
  streakSeven('Une semaine', '💫', 'Connecté 7 jours de suite');

  final String title;
  final String emoji;
  final String description;
  const Badge(this.title, this.emoji, this.description);
}

class GamificationState {
  final int streakDays;
  final int savedCount;
  final int createdCount;
  final Set<Badge> unlockedBadges;
  final DateTime? lastActiveDate;

  const GamificationState({
    this.streakDays = 0,
    this.savedCount = 0,
    this.createdCount = 0,
    this.unlockedBadges = const {},
    this.lastActiveDate,
  });

  GamificationState copyWith({
    int? streakDays,
    int? savedCount,
    int? createdCount,
    Set<Badge>? unlockedBadges,
    DateTime? lastActiveDate,
  }) {
    return GamificationState(
      streakDays: streakDays ?? this.streakDays,
      savedCount: savedCount ?? this.savedCount,
      createdCount: createdCount ?? this.createdCount,
      unlockedBadges: unlockedBadges ?? this.unlockedBadges,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
    );
  }
}

@riverpod
class GamificationNotifier extends _$GamificationNotifier {
  @override
  GamificationState build() {
    _recordActivity();
    return const GamificationState();
  }

  void _recordActivity() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final last = state.lastActiveDate;

    if (last == null) {
      state = state.copyWith(streakDays: 1, lastActiveDate: today);
      return;
    }
    final lastDay = DateTime(last.year, last.month, last.day);
    final diff = today.difference(lastDay).inDays;
    if (diff == 0) return; // same day, no change
    if (diff == 1) {
      final newStreak = state.streakDays + 1;
      state = state.copyWith(streakDays: newStreak, lastActiveDate: today);
      _checkStreakBadges(newStreak);
    } else {
      state = state.copyWith(streakDays: 1, lastActiveDate: today);
    }
  }

  void onRecipeSaved() {
    final count = state.savedCount + 1;
    final badges = Set<Badge>.from(state.unlockedBadges);
    if (count == 1) badges.add(Badge.firstSave);
    if (count == 5) badges.add(Badge.fiveSaves);
    if (count == 10) badges.add(Badge.tenSaves);
    state = state.copyWith(savedCount: count, unlockedBadges: badges);
  }

  void onRecipeCreated() {
    final count = state.createdCount + 1;
    final badges = Set<Badge>.from(state.unlockedBadges);
    if (count == 1) badges.add(Badge.firstRecipe);
    state = state.copyWith(createdCount: count, unlockedBadges: badges);
  }

  void _checkStreakBadges(int streak) {
    final badges = Set<Badge>.from(state.unlockedBadges);
    if (streak >= 3) badges.add(Badge.streakThree);
    if (streak >= 7) badges.add(Badge.streakSeven);
    state = state.copyWith(unlockedBadges: badges);
  }
}
