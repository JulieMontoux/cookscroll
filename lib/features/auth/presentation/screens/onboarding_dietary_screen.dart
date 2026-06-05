import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/onboarding_provider.dart';
import '../../../../shared/widgets/dots_indicator.dart';

const _allergens = [
  ('Gluten-Free', Icons.grain_rounded),
  ('Dairy-Free', Icons.no_drinks_rounded),
  ('Vegan', Icons.eco_rounded),
  ('Vegetarian', Icons.yard_rounded),
  ('Nut-Free', Icons.no_food_rounded),
  ('Sugar-Free', Icons.water_drop_outlined),
];

class OnboardingDietaryScreen extends ConsumerWidget {
  const OnboardingDietaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(
      onboardingNotifierProvider.select((s) => s.selectedAllergens),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFAF0EE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              IconButton(
                onPressed: () => context.go('/onboarding'),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: AppColors.textPrimary,
              ),
              const SizedBox(height: 24),
              Text(
                'Any dietary\npreferences?',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 30),
              ),
              const SizedBox(height: 8),
              Text(
                'We\'ll personalise your feed accordingly.\nYou can change this anytime.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
              ),
              const SizedBox(height: 36),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _allergens.map((item) {
                  final (label, icon) = item;
                  final isSelected = selected.contains(label);
                  return _AllergenChip(
                    label: label,
                    icon: icon,
                    isSelected: isSelected,
                    onTap: () => ref
                        .read(onboardingNotifierProvider.notifier)
                        .toggleAllergen(label),
                  );
                }).toList(),
              ),
              const Spacer(),
              FilledButton(
                onPressed: () => context.go('/onboarding/skill'),
                child: const Text('Continue'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.go('/onboarding/skill'),
                child: Text(
                  'Skip for now',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
              const SizedBox(height: 24),
              Center(child: const DotsIndicator(current: 1, total: 3)),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _AllergenChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _AllergenChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.12)
              : Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.surfaceVariant,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isSelected ? AppColors.primary : AppColors.textPrimary,
                  ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              const Icon(Icons.check_circle_rounded, size: 16, color: AppColors.primary),
            ],
          ],
        ),
      ),
    );
  }
}
