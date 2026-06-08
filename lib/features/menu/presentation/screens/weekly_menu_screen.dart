import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../recipes/domain/models/recipe.dart';
import '../../../recipes/presentation/providers/recipe_provider.dart';
import '../../../shopping_list/presentation/providers/shopping_list_provider.dart';
import '../providers/menu_provider.dart';

class WeeklyMenuScreen extends ConsumerStatefulWidget {
  const WeeklyMenuScreen({super.key});

  @override
  ConsumerState<WeeklyMenuScreen> createState() => _WeeklyMenuScreenState();
}

class _WeeklyMenuScreenState extends ConsumerState<WeeklyMenuScreen> {
  late DateTime _selectedDay;
  late List<DateTime> _weekDays;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    // Start week on Monday
    final monday = now.subtract(Duration(days: now.weekday - 1));
    _weekDays = List.generate(7, (i) => monday.add(Duration(days: i)));
    _selectedDay = now;
  }

  String _fmt(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  static const _dayLabels = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];

  @override
  Widget build(BuildContext context) {
    final menu = ref.watch(weeklyMenuNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu de la semaine'),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.shopping_cart_outlined, size: 18),
            label: const Text('Générer liste'),
            style: TextButton.styleFrom(foregroundColor: AppColors.primary),
            onPressed: () => _generateAndNavigate(context),
          ),
        ],
      ),
      body: Column(
        children: [
          _DayStrip(
            days: _weekDays,
            selected: _selectedDay,
            dayLabels: _dayLabels,
            menu: menu,
            onSelect: (d) => setState(() => _selectedDay = d),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: MealType.values.map((type) {
                final key = MealSlotKey(_fmt(_selectedDay), type);
                final recipe = menu[key.key];
                return _MealSlotCard(
                  type: type,
                  recipe: recipe,
                  onAssign: () => _showPicker(context, key),
                  onRemove: () => ref
                      .read(weeklyMenuNotifierProvider.notifier)
                      .remove(key),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showPicker(BuildContext context, MealSlotKey key) async {
    final recipe = await showModalBottomSheet<Recipe>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _RecipePicker(),
    );
    if (recipe != null) {
      ref.read(weeklyMenuNotifierProvider.notifier).assign(key, recipe);
    }
  }

  void _generateAndNavigate(BuildContext context) {
    final recipes =
        ref.read(weeklyMenuNotifierProvider.notifier).allRecipes();
    if (recipes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aucune recette dans le menu')),
      );
      return;
    }
    ref
        .read(shoppingListNotifierProvider.notifier)
        .generateFromMenu(recipes);
    context.go('/list');
  }
}

class _DayStrip extends StatelessWidget {
  final List<DateTime> days;
  final DateTime selected;
  final List<String> dayLabels;
  final Map<String, Recipe> menu;
  final void Function(DateTime) onSelect;

  const _DayStrip({
    required this.days,
    required this.selected,
    required this.dayLabels,
    required this.menu,
    required this.onSelect,
  });

  bool _hasRecipe(DateTime d, Map<String, Recipe> menu) {
    final date =
        '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
    return MealType.values.any((t) => menu.containsKey('${date}_${t.name}'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 72,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        itemCount: days.length,
        itemBuilder: (_, i) {
          final d = days[i];
          final isSelected = d.day == selected.day &&
              d.month == selected.month &&
              d.year == selected.year;
          final hasRecipe = _hasRecipe(d, menu);

          return GestureDetector(
            onTap: () => onSelect(d),
            child: Container(
              width: 44,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayLabels[i],
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${d.day}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: isSelected ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                  if (hasRecipe)
                    Container(
                      width: 5,
                      height: 5,
                      margin: const EdgeInsets.only(top: 2),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white
                            : AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MealSlotCard extends StatelessWidget {
  final MealType type;
  final Recipe? recipe;
  final VoidCallback onAssign;
  final VoidCallback onRemove;

  const _MealSlotCard({
    required this.type,
    required this.recipe,
    required this.onAssign,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: recipe == null ? onAssign : null,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              _SlotIcon(type: type),
              const SizedBox(width: 14),
              Expanded(
                child: recipe == null
                    ? Text(
                        type.label,
                        style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(type.label,
                              style: const TextStyle(
                                  fontSize: 11, color: AppColors.textSecondary)),
                          const SizedBox(height: 2),
                          Text(recipe!.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          if (recipe!.prepTimeMinutes != null)
                            Text('${recipe!.prepTimeMinutes} min',
                                style: const TextStyle(
                                    fontSize: 11, color: AppColors.textSecondary)),
                        ],
                      ),
              ),
              if (recipe == null)
                const Icon(Icons.add_circle_outline_rounded,
                    color: AppColors.primary)
              else
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.swap_horiz_rounded,
                          color: AppColors.primary, size: 20),
                      onPressed: onAssign,
                      tooltip: 'Changer',
                    ),
                    IconButton(
                      icon: const Icon(Icons.close_rounded,
                          color: AppColors.textSecondary, size: 20),
                      onPressed: onRemove,
                      tooltip: 'Retirer',
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SlotIcon extends StatelessWidget {
  final MealType type;
  const _SlotIcon({required this.type});

  IconData get _icon => switch (type) {
        MealType.breakfast => Icons.free_breakfast_outlined,
        MealType.lunch => Icons.lunch_dining_outlined,
        MealType.dinner => Icons.dinner_dining_outlined,
        MealType.snack => Icons.apple_outlined,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(_icon, color: AppColors.primary, size: 20),
    );
  }
}

// ── Recipe Picker bottom sheet ──────────────────────────────────────────────

class _RecipePicker extends ConsumerStatefulWidget {
  const _RecipePicker();

  @override
  ConsumerState<_RecipePicker> createState() => _RecipePickerState();
}

class _RecipePickerState extends ConsumerState<_RecipePicker> {
  final _ctrl = TextEditingController();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final feedAsync = ref.watch(feedNotifierProvider);
    final savedAsync = ref.watch(savedRecipesProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (_, scrollCtrl) => Container(
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Choisir une recette',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700)),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: AppColors.primary,
                      labelColor: AppColors.primary,
                      unselectedLabelColor: AppColors.textSecondary,
                      tabs: const [
                        Tab(text: 'Sauvegardées'),
                        Tab(text: 'Catalogue'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Saved
                          savedAsync.when(
                            loading: () => const Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.primary)),
                            error: (e, _) => Center(child: Text('$e')),
                            data: (list) => _RecipeList(recipes: list),
                          ),
                          // Feed catalog
                          feedAsync.when(
                            loading: () => const Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.primary)),
                            error: (e, _) => Center(child: Text('$e')),
                            data: (list) => _RecipeList(recipes: list),
                          ),
                        ],
                      ),
                    ),
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

class _RecipeList extends StatelessWidget {
  final List<Recipe> recipes;
  const _RecipeList({required this.recipes});

  @override
  Widget build(BuildContext context) {
    if (recipes.isEmpty) {
      return const Center(
        child: Text('Aucune recette disponible',
            style: TextStyle(color: AppColors.textSecondary)),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: recipes.length,
      separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
      itemBuilder: (_, i) {
        final r = recipes[i];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: r.imageUrl != null
                ? Image.network(r.imageUrl!,
                    width: 48, height: 48, fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const SizedBox(width: 48, height: 48,
                            child: ColoredBox(color: Color(0xFFE0E0E0))))
                : const SizedBox(
                    width: 48, height: 48,
                    child: ColoredBox(color: Color(0xFFE0E0E0))),
          ),
          title: Text(r.title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          subtitle: r.category != null
              ? Text(r.category!,
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.textSecondary))
              : null,
          onTap: () => Navigator.pop(context, r),
        );
      },
    );
  }
}
