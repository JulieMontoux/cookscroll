import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/recipe_card.dart';
import '../../../recipes/presentation/providers/recipe_provider.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPageChanged(int index, List recipes) {
    if (index >= recipes.length - 3) {
      ref.read(feedNotifierProvider.notifier).fetchMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final feedAsync = ref.watch(feedNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const _Logo(),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded, color: Colors.white),
            onPressed: () => _showFilterSheet(context),
          ),
        ],
      ),
      body: feedAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.wifi_off_rounded, color: Colors.white54, size: 48),
              const SizedBox(height: 12),
              Text(
                'Impossible de charger les recettes',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white70),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => ref.invalidate(feedNotifierProvider),
                child: const Text('Réessayer'),
              ),
            ],
          ),
        ),
        data: (recipes) {
          if (recipes.isEmpty) {
            return const Center(
              child: Text('Aucune recette', style: TextStyle(color: Colors.white70)),
            );
          }
          return PageView.builder(
            controller: _controller,
            scrollDirection: Axis.vertical,
            onPageChanged: (i) => _onPageChanged(i, recipes),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return RecipeCard(
                recipe: recipe,
                onTap: () => context.push('/recipes/${recipe.id}'),
              );
            },
          );
        },
      ),
    );
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _FilterSheet(),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Cook',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'Scroll',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterSheet extends ConsumerStatefulWidget {
  const _FilterSheet();

  @override
  ConsumerState<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends ConsumerState<_FilterSheet> {
  late FeedFilters _local;

  @override
  void initState() {
    super.initState();
    _local = ref.read(feedFiltersNotifierProvider);
  }

  static const _difficulties = ['easy', 'medium', 'hard'];
  static const _prepTimes = [15, 30, 45, 60];
  static const _allergenOptions = [
    'Gluten', 'Dairy', 'Eggs', 'Nuts', 'Shellfish', 'Soy',
  ];

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      builder: (_, scrollController) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Expanded(
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(20),
                children: [
                  Text('Filtres', style: tt.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 20),

                  Text('Temps de préparation max', style: tt.titleSmall),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: _prepTimes.map((t) {
                      final selected = _local.maxPrepTime == t;
                      return ChoiceChip(
                        label: Text('$t min'),
                        selected: selected,
                        onSelected: (_) => setState(() {
                          _local = _local.copyWith(
                            maxPrepTime: selected ? null : t,
                          );
                        }),
                        selectedColor: AppColors.primary,
                        labelStyle: TextStyle(
                          color: selected ? Colors.white : null,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  Text('Difficulté', style: tt.titleSmall),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: _difficulties.map((d) {
                      final selected = _local.difficulty == d;
                      return ChoiceChip(
                        label: Text(d),
                        selected: selected,
                        onSelected: (_) => setState(() {
                          _local = _local.copyWith(
                            difficulty: selected ? null : d,
                          );
                        }),
                        selectedColor: AppColors.primary,
                        labelStyle: TextStyle(
                          color: selected ? Colors.white : null,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  Text('Exclure allergènes', style: tt.titleSmall),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: _allergenOptions.map((a) {
                      final selected = _local.allergens.contains(a);
                      return FilterChip(
                        label: Text(a),
                        selected: selected,
                        onSelected: (_) => setState(() {
                          final list = List<String>.from(_local.allergens);
                          selected ? list.remove(a) : list.add(a);
                          _local = _local.copyWith(allergens: list);
                        }),
                        selectedColor: AppColors.primary.withValues(alpha: 0.15),
                        checkmarkColor: AppColors.primary,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  20, 8, 20, MediaQuery.of(context).padding.bottom + 16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        ref.read(feedFiltersNotifierProvider.notifier).reset();
                        ref.read(feedNotifierProvider.notifier).applyFilters();
                        Navigator.pop(context);
                      },
                      child: const Text('Réinitialiser'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        final notifier =
                            ref.read(feedFiltersNotifierProvider.notifier);
                        notifier.setMaxPrepTime(_local.maxPrepTime);
                        notifier.setDifficulty(_local.difficulty);
                        final current =
                            ref.read(feedFiltersNotifierProvider).allergens;
                        for (final a in current) {
                          if (!_local.allergens.contains(a)) {
                            notifier.toggleAllergen(a);
                          }
                        }
                        for (final a in _local.allergens) {
                          if (!current.contains(a)) notifier.toggleAllergen(a);
                        }
                        ref.read(feedNotifierProvider.notifier).applyFilters();
                        Navigator.pop(context);
                      },
                      child: const Text('Appliquer'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
