import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../providers/recipe_provider.dart';

class RecipeDetailScreen extends ConsumerWidget {
  final String recipeId;
  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeAsync = ref.watch(recipeByIdProvider(recipeId));

    return recipeAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator(color: AppColors.primary)),
      ),
      error: (e, _) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('Erreur: $e')),
      ),
      data: (recipe) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              backgroundColor: AppColors.textPrimary,
              flexibleSpace: FlexibleSpaceBar(
                background: recipe.imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: recipe.imageUrl!,
                        fit: BoxFit.cover,
                      )
                    : const ColoredBox(color: Color(0xFF2A2A2A)),
                title: Text(
                  recipe.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    recipe.isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: recipe.isSaved ? AppColors.primary : Colors.white,
                  ),
                  onPressed: () => ref
                      .read(feedNotifierProvider.notifier)
                      .toggleSave(recipe.id, recipe.isSaved),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if (recipe.category != null)
                          _InfoChip(icon: Icons.category_outlined, label: recipe.category!),
                        if (recipe.area != null)
                          _InfoChip(icon: Icons.public_rounded, label: recipe.area!),
                        if (recipe.prepTimeMinutes != null)
                          _InfoChip(icon: Icons.timer_outlined, label: '${recipe.prepTimeMinutes} min'),
                        _InfoChip(icon: Icons.bar_chart_rounded, label: recipe.difficulty),
                        _InfoChip(icon: Icons.people_outline_rounded, label: '${recipe.servings} pers.'),
                      ],
                    ),
                    if (recipe.caloriesPerServing != null) ...[
                      const SizedBox(height: 20),
                      _MacroCard(recipe: recipe),
                    ],
                    const SizedBox(height: 24),
                    const _SectionTitle('Ingrédients'),
                    const SizedBox(height: 12),
                    ...recipe.ingredients.map(
                      (ing) => _IngredientRow(name: ing.name, quantity: ing.quantity),
                    ),
                    if (recipe.steps.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      const _SectionTitle('Préparation'),
                      const SizedBox(height: 12),
                      ...recipe.steps.asMap().entries.map(
                            (e) => _StepRow(number: e.key + 1, text: e.value),
                          ),
                    ],
                    if (recipe.youtubeUrl != null && recipe.youtubeUrl!.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      const _SectionTitle('Vidéo'),
                      const SizedBox(height: 8),
                      _YoutubeLink(url: recipe.youtubeUrl!),
                    ],
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.primary),
          const SizedBox(width: 6),
          Text(label,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

class _MacroCard extends StatelessWidget {
  final dynamic recipe;
  const _MacroCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _MacroValue(
              label: 'Calories',
              value: recipe.caloriesPerServing!.toStringAsFixed(0),
              unit: 'kcal',
              color: Colors.orange),
          if (recipe.proteinsG != null)
            _MacroValue(
                label: 'Protéines',
                value: recipe.proteinsG!.toStringAsFixed(0),
                unit: 'g',
                color: Colors.green),
          if (recipe.carbsG != null)
            _MacroValue(
                label: 'Glucides',
                value: recipe.carbsG!.toStringAsFixed(0),
                unit: 'g',
                color: Colors.blue),
          if (recipe.fatsG != null)
            _MacroValue(
                label: 'Lipides',
                value: recipe.fatsG!.toStringAsFixed(0),
                unit: 'g',
                color: Colors.amber),
        ],
      ),
    );
  }
}

class _MacroValue extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color color;
  const _MacroValue(
      {required this.label, required this.value, required this.unit, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: color)),
        Text(unit, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
        const SizedBox(height: 2),
        Text(label,
            style: const TextStyle(
                fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.textSecondary)),
      ],
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
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w700));
  }
}

class _IngredientRow extends StatelessWidget {
  final String name;
  final String? quantity;
  const _IngredientRow({required this.name, this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(name, style: const TextStyle(fontSize: 14))),
          if (quantity != null && quantity!.isNotEmpty)
            Text(quantity!,
                style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  final int number;
  final String text;
  const _StepRow({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text('$number',
                style: const TextStyle(
                    color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(text, style: const TextStyle(fontSize: 14, height: 1.5)),
            ),
          ),
        ],
      ),
    );
  }
}

class _YoutubeLink extends StatelessWidget {
  final String url;
  const _YoutubeLink({required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {/* TODO: url_launcher */},
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFF0000).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFFF0000).withValues(alpha: 0.3)),
        ),
        child: const Row(
          children: [
            Icon(Icons.play_circle_fill_rounded, color: Color(0xFFFF0000), size: 32),
            SizedBox(width: 12),
            Text('Voir la vidéo de préparation',
                style: TextStyle(color: Color(0xFFFF0000), fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
