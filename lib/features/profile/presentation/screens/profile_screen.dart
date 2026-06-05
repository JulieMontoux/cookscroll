import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../recipes/presentation/providers/recipe_provider.dart';
import '../providers/gamification_provider.dart' as gami_lib;
import '../providers/profile_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileNotifierProvider);
    final gami = ref.watch(gami_lib.gamificationNotifierProvider);
    final savedAsync = ref.watch(savedRecipesProvider);
    final savedCount = savedAsync.valueOrNull?.length ?? gami.savedCount;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.primary, AppColors.primaryDark],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white.withValues(alpha: 0.25),
                      child: const Icon(Icons.person_rounded,
                          size: 44, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Text(profile.displayName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    Text(_skillLabel(profile.skillLevel),
                        style:
                            const TextStyle(color: Colors.white70, fontSize: 13)),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit_rounded, color: Colors.white),
                onPressed: () => _editName(context, ref, profile.displayName),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StatsRow(
                      saved: savedCount,
                      streak: gami.streakDays,
                      badges: gami.unlockedBadges.length),
                  const SizedBox(height: 24),
                  if (gami.unlockedBadges.isNotEmpty) ...[
                    const _SectionTitle('Badges débloqués'),
                    const SizedBox(height: 12),
                    _BadgeRow(badges: gami.unlockedBadges.toList()),
                    const SizedBox(height: 24),
                  ],
                  const _SectionTitle('Préférences alimentaires'),
                  const SizedBox(height: 12),
                  _AllergenSelector(
                    selected: profile.allergens,
                    onToggle: (a) =>
                        ref.read(profileNotifierProvider.notifier).toggleAllergen(a),
                  ),
                  const SizedBox(height: 24),
                  const _SectionTitle('Niveau de cuisine'),
                  const SizedBox(height: 12),
                  _SkillSelector(
                    selected: profile.skillLevel,
                    onSelect: (l) =>
                        ref.read(profileNotifierProvider.notifier).setSkillLevel(l),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.logout_rounded),
                      label: const Text('Se déconnecter'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                      ),
                      onPressed: () => context.go('/onboarding'),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _skillLabel(String level) => switch (level) {
        'beginner' => 'Débutant',
        'intermediate' => 'Intermédiaire',
        'advanced' => 'Avancé',
        _ => 'Débutant',
      };

  void _editName(BuildContext context, WidgetRef ref, String current) {
    final ctrl = TextEditingController(text: current);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Modifier le nom'),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(labelText: 'Nom affiché'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler')),
          FilledButton(
            onPressed: () {
              ref.read(profileNotifierProvider.notifier).setName(ctrl.text);
              Navigator.pop(context);
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  final int saved;
  final int streak;
  final int badges;
  const _StatsRow(
      {required this.saved, required this.streak, required this.badges});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _StatCard(value: '$saved', label: 'Sauvegardées')),
        const SizedBox(width: 12),
        Expanded(
            child: _StatCard(value: '🔥 $streak', label: 'Jours consécutifs')),
        const SizedBox(width: 12),
        Expanded(child: _StatCard(value: '🏅 $badges', label: 'Badges')),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary)),
          const SizedBox(height: 4),
          Text(label,
              style: const TextStyle(
                  fontSize: 10, color: AppColors.textSecondary),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _BadgeRow extends StatelessWidget {
  final List<gami_lib.Badge> badges;
  const _BadgeRow({required this.badges});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: badges.map((b) => _BadgeChip(badge: b)).toList(),
    );
  }
}

class _BadgeChip extends StatelessWidget {
  final gami_lib.Badge badge;
  const _BadgeChip({required this.badge});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: badge.description,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(badge.emoji, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 6),
            Text(badge.title,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary)),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(fontWeight: FontWeight.w700));
  }
}

class _AllergenSelector extends StatelessWidget {
  final Set<String> selected;
  final void Function(String) onToggle;
  const _AllergenSelector({required this.selected, required this.onToggle});

  static const _options = [
    ('Gluten', Icons.grain_rounded),
    ('Dairy', Icons.water_drop_outlined),
    ('Eggs', Icons.egg_outlined),
    ('Nuts', Icons.forest_outlined),
    ('Shellfish', Icons.set_meal_rounded),
    ('Soy', Icons.eco_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _options.map((o) {
        final (label, icon) = o;
        final sel = selected.contains(label);
        return FilterChip(
          avatar: Icon(icon,
              size: 16,
              color: sel ? Colors.white : AppColors.textSecondary),
          label: Text(label),
          selected: sel,
          onSelected: (_) => onToggle(label),
          selectedColor: AppColors.primary,
          labelStyle:
              TextStyle(color: sel ? Colors.white : AppColors.textPrimary),
          checkmarkColor: Colors.white,
        );
      }).toList(),
    );
  }
}

class _SkillSelector extends StatelessWidget {
  final String selected;
  final void Function(String) onSelect;
  const _SkillSelector({required this.selected, required this.onSelect});

  static const _levels = [
    ('beginner', 'Débutant', Icons.emoji_food_beverage_outlined),
    ('intermediate', 'Intermédiaire', Icons.restaurant_outlined),
    ('advanced', 'Avancé', Icons.local_fire_department_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _levels.map((l) {
        final (value, label, icon) = l;
        final sel = selected == value;
        return GestureDetector(
          onTap: () => onSelect(value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: sel ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: sel ? AppColors.primary : Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Icon(icon,
                    color: sel ? Colors.white : AppColors.textSecondary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(label,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: sel
                              ? Colors.white
                              : AppColors.textPrimary)),
                ),
                if (sel)
                  const Icon(Icons.check_rounded,
                      color: Colors.white, size: 18),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
