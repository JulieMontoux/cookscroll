import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

class UserProfile {
  final String displayName;
  final Set<String> allergens;
  final String skillLevel;
  final int recipesCooked;

  const UserProfile({
    this.displayName = 'Mon Profil',
    this.allergens = const {},
    this.skillLevel = 'beginner',
    this.recipesCooked = 0,
  });

  UserProfile copyWith({
    String? displayName,
    Set<String>? allergens,
    String? skillLevel,
    int? recipesCooked,
  }) {
    return UserProfile(
      displayName: displayName ?? this.displayName,
      allergens: allergens ?? this.allergens,
      skillLevel: skillLevel ?? this.skillLevel,
      recipesCooked: recipesCooked ?? this.recipesCooked,
    );
  }
}

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  UserProfile build() => const UserProfile();

  void setName(String name) =>
      state = state.copyWith(displayName: name.trim());

  void toggleAllergen(String a) {
    final next = Set<String>.from(state.allergens);
    next.contains(a) ? next.remove(a) : next.add(a);
    state = state.copyWith(allergens: next);
  }

  void setSkillLevel(String level) =>
      state = state.copyWith(skillLevel: level);

  void incrementCooked() =>
      state = state.copyWith(recipesCooked: state.recipesCooked + 1);
}
