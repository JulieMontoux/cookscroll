import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/onboarding_provider.dart';
import '../../../../shared/widgets/dots_indicator.dart';

const _levels = [
  ('Beginner', 'Just getting started', Icons.emoji_food_beverage_rounded),
  ('Intermediate', 'Comfortable in the kitchen', Icons.restaurant_rounded),
  ('Advanced', 'Ready for complex dishes', Icons.military_tech_rounded),
];

class OnboardingSkillScreen extends ConsumerWidget {
  const OnboardingSkillScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(
      onboardingNotifierProvider.select((s) => s.skillLevel),
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
                onPressed: () => context.go('/onboarding/dietary'),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: AppColors.textPrimary,
              ),
              const SizedBox(height: 24),
              Text(
                'What\'s your\ncooking level?',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 30),
              ),
              const SizedBox(height: 8),
              Text(
                'We\'ll suggest recipes that match\nyour skills.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
              ),
              const SizedBox(height: 36),
              ...(_levels.map((item) {
                final (label, subtitle, icon) = item;
                final isSelected = selected == label;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _LevelCard(
                    label: label,
                    subtitle: subtitle,
                    icon: icon,
                    isSelected: isSelected,
                    onTap: () => ref
                        .read(onboardingNotifierProvider.notifier)
                        .setSkillLevel(label),
                  ),
                );
              })),
              const Spacer(),
              FilledButton(
                onPressed: selected != null ? () => context.go('/feed') : null,
                child: const Text("Let's go"),
              ),
              const SizedBox(height: 24),
              Center(child: const DotsIndicator(current: 2, total: 3)),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _LevelCard extends StatelessWidget {
  final String label;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _LevelCard({
    required this.label,
    required this.subtitle,
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
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.surfaceVariant,
            width: isSelected ? 0 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.2)
                    : AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : AppColors.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: isSelected ? Colors.white : AppColors.textPrimary,
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isSelected
                              ? Colors.white.withValues(alpha: 0.8)
                              : AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle_rounded, color: Colors.white, size: 22),
          ],
        ),
      ),
    );
  }
}
