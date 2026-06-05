import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

class OnboardingState {
  final Set<String> selectedAllergens;
  final String? skillLevel;

  const OnboardingState({
    this.selectedAllergens = const {},
    this.skillLevel,
  });

  OnboardingState copyWith({
    Set<String>? selectedAllergens,
    String? skillLevel,
  }) {
    return OnboardingState(
      selectedAllergens: selectedAllergens ?? this.selectedAllergens,
      skillLevel: skillLevel ?? this.skillLevel,
    );
  }
}

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingState build() => const OnboardingState();

  void toggleAllergen(String allergen) {
    final current = Set<String>.from(state.selectedAllergens);
    if (current.contains(allergen)) {
      current.remove(allergen);
    } else {
      current.add(allergen);
    }
    state = state.copyWith(selectedAllergens: current);
  }

  void setSkillLevel(String level) {
    state = state.copyWith(skillLevel: level);
  }
}
