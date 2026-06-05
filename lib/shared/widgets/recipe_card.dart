import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../features/recipes/domain/models/recipe.dart';
import '../../features/recipes/presentation/providers/recipe_provider.dart';

class RecipeCard extends ConsumerWidget {
  final Recipe recipe;
  final VoidCallback? onTap;

  const RecipeCard({super.key, required this.recipe, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _HeroImage(url: recipe.imageUrl),
          _BottomGradient(),
          Positioned(
            left: 16,
            right: 72,
            bottom: 80,
            child: _RecipeInfo(recipe: recipe),
          ),
          Positioned(
            right: 12,
            bottom: 100,
            child: _ActionColumn(recipe: recipe, ref: ref),
          ),
        ],
      ),
    );
  }
}

class _HeroImage extends StatelessWidget {
  final String? url;
  const _HeroImage({this.url});

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Container(color: AppColors.textSecondary.withValues(alpha: 0.3));
    }
    return CachedNetworkImage(
      imageUrl: url!,
      fit: BoxFit.cover,
      placeholder: (_, __) =>
          Container(color: AppColors.textSecondary.withValues(alpha: 0.15)),
      errorWidget: (_, __, ___) =>
          const ColoredBox(color: Color(0xFF2A2A2A)),
    );
  }
}

class _BottomGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.45, 1.0],
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.78),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecipeInfo extends StatelessWidget {
  final Recipe recipe;
  const _RecipeInfo({required this.recipe});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (recipe.category != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              recipe.category!,
              style: tt.labelSmall
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        const SizedBox(height: 8),
        Text(
          recipe.title,
          style: tt.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            shadows: [Shadow(blurRadius: 8, color: Colors.black54)],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (recipe.area != null) ...[
          const SizedBox(height: 4),
          Text(
            recipe.area!,
            style: tt.bodySmall?.copyWith(color: Colors.white70),
          ),
        ],
        if (recipe.prepTimeMinutes != null || recipe.difficulty != 'easy') ...[
          const SizedBox(height: 8),
          _MetaRow(recipe: recipe),
        ],
        if (recipe.caloriesPerServing != null) ...[
          const SizedBox(height: 8),
          _MacroBar(recipe: recipe),
        ],
      ],
    );
  }
}

class _MetaRow extends StatelessWidget {
  final Recipe recipe;
  const _MetaRow({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (recipe.prepTimeMinutes != null)
          _Pill(
            icon: Icons.timer_outlined,
            label: '${recipe.prepTimeMinutes} min',
          ),
        if (recipe.prepTimeMinutes != null) const SizedBox(width: 8),
        _Pill(
          icon: Icons.bar_chart_rounded,
          label: recipe.difficulty,
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Pill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _MacroBar extends StatelessWidget {
  final Recipe recipe;
  const _MacroBar({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _MacroChip(
          label: '${recipe.caloriesPerServing!.toStringAsFixed(0)} kcal',
          color: Colors.orangeAccent,
        ),
        if (recipe.proteinsG != null) ...[
          const SizedBox(width: 6),
          _MacroChip(
            label: '${recipe.proteinsG!.toStringAsFixed(0)}g P',
            color: Colors.greenAccent,
          ),
        ],
        if (recipe.carbsG != null) ...[
          const SizedBox(width: 6),
          _MacroChip(
            label: '${recipe.carbsG!.toStringAsFixed(0)}g C',
            color: Colors.lightBlueAccent,
          ),
        ],
      ],
    );
  }
}

class _MacroChip extends StatelessWidget {
  final String label;
  final Color color;
  const _MacroChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _ActionColumn extends StatelessWidget {
  final Recipe recipe;
  final WidgetRef ref;
  const _ActionColumn({required this.recipe, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ActionButton(
          icon: recipe.isSaved ? Icons.bookmark : Icons.bookmark_border,
          color: recipe.isSaved ? AppColors.primary : Colors.white,
          label: 'Save',
          onTap: () => ref
              .read(feedNotifierProvider.notifier)
              .toggleSave(recipe.id, recipe.isSaved),
        ),
        const SizedBox(height: 20),
        _ActionButton(
          icon: Icons.share_outlined,
          color: Colors.white,
          label: 'Share',
          onTap: () {},
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
