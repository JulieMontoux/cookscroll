import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/models/recipe.dart';
import '../providers/recipe_provider.dart';

class CreateRecipeScreen extends ConsumerStatefulWidget {
  const CreateRecipeScreen({super.key});

  @override
  ConsumerState<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends ConsumerState<CreateRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  String? _category;
  String _difficulty = 'easy';
  int _servings = 2;
  int? _prepTime;

  final List<_IngredientEntry> _ingredients = [_IngredientEntry()];
  final List<TextEditingController> _steps = [TextEditingController()];

  bool _saving = false;

  static const _categories = [
    'Beef', 'Chicken', 'Dessert', 'Lamb', 'Pasta',
    'Pork', 'Seafood', 'Side', 'Starter', 'Vegetarian', 'Vegan', 'Autre',
  ];

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    for (final e in _ingredients) {
      e.dispose();
    }
    for (final c in _steps) {
      c.dispose();
    }
    super.dispose();
  }

  void _addIngredient() =>
      setState(() => _ingredients.add(_IngredientEntry()));

  void _removeIngredient(int i) {
    if (_ingredients.length == 1) return;
    setState(() {
      _ingredients[i].dispose();
      _ingredients.removeAt(i);
    });
  }

  void _addStep() => setState(() => _steps.add(TextEditingController()));

  void _removeStep(int i) {
    if (_steps.length == 1) return;
    setState(() {
      _steps[i].dispose();
      _steps.removeAt(i);
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);

    final ingredients = _ingredients
        .where((e) => e.name.text.trim().isNotEmpty)
        .map((e) => RecipeIngredient(
              name: e.name.text.trim(),
              quantity: e.qty.text.trim().isNotEmpty ? e.qty.text.trim() : null,
            ))
        .toList();

    final steps = _steps
        .map((c) => c.text.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    final recipe = Recipe(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      title: _titleCtrl.text.trim(),
      description: _descCtrl.text.trim().isNotEmpty ? _descCtrl.text.trim() : null,
      category: _category,
      ingredients: ingredients,
      steps: steps,
      difficulty: _difficulty,
      servings: _servings,
      prepTimeMinutes: _prepTime,
      source: 'user',
    );

    ref.read(userRecipesNotifierProvider.notifier).add(recipe);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle recette'),
        actions: [
          _saving
              ? const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
                    ),
                  ),
                )
              : TextButton(
                  onPressed: _save,
                  child: const Text('Enregistrer',
                      style: TextStyle(
                          color: AppColors.primary, fontWeight: FontWeight.w700)),
                ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // ── Infos générales ──────────────────────────────────────
            _SectionTitle('Informations générales'),
            const SizedBox(height: 12),
            TextFormField(
              controller: _titleCtrl,
              decoration: const InputDecoration(labelText: 'Titre *'),
              textCapitalization: TextCapitalization.sentences,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Titre requis' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _descCtrl,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 2,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _category,
              decoration: const InputDecoration(labelText: 'Catégorie'),
              items: _categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (v) => setState(() => _category = v),
            ),
            const SizedBox(height: 20),

            // ── Paramètres ───────────────────────────────────────────
            _SectionTitle('Paramètres'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Difficulté', style: tt.labelMedium),
                      const SizedBox(height: 6),
                      SegmentedButton<String>(
                        segments: const [
                          ButtonSegment(value: 'easy', label: Text('Facile')),
                          ButtonSegment(value: 'medium', label: Text('Moyen')),
                          ButtonSegment(value: 'hard', label: Text('Difficile')),
                        ],
                        selected: {_difficulty},
                        onSelectionChanged: (s) =>
                            setState(() => _difficulty = s.first),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.resolveWith(
                            (s) => s.contains(WidgetState.selected)
                                ? AppColors.primary
                                : null,
                          ),
                          foregroundColor: WidgetStateProperty.resolveWith(
                            (s) => s.contains(WidgetState.selected)
                                ? Colors.white
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Temps (min)',
                      suffixText: 'min',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (v) =>
                        setState(() => _prepTime = int.tryParse(v)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Portions', style: tt.labelMedium),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline_rounded),
                            color: AppColors.primary,
                            onPressed: _servings > 1
                                ? () => setState(() => _servings--)
                                : null,
                          ),
                          Text('$_servings',
                              style: tt.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700)),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline_rounded),
                            color: AppColors.primary,
                            onPressed: () => setState(() => _servings++),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ── Ingrédients ──────────────────────────────────────────
            Row(
              children: [
                Expanded(child: _SectionTitle('Ingrédients')),
                IconButton(
                  icon: const Icon(Icons.add_rounded, color: AppColors.primary),
                  tooltip: 'Ajouter un ingrédient',
                  onPressed: _addIngredient,
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...List.generate(_ingredients.length, (i) {
              final e = _ingredients[i];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: e.name,
                        decoration: InputDecoration(
                          labelText: 'Ingrédient ${i + 1}',
                          isDense: true,
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: e.qty,
                        decoration: const InputDecoration(
                          labelText: 'Quantité',
                          isDense: true,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline_rounded,
                          color: AppColors.textSecondary, size: 20),
                      onPressed: () => _removeIngredient(i),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 24),

            // ── Étapes ───────────────────────────────────────────────
            Row(
              children: [
                Expanded(child: _SectionTitle('Étapes de préparation')),
                IconButton(
                  icon: const Icon(Icons.add_rounded, color: AppColors.primary),
                  tooltip: 'Ajouter une étape',
                  onPressed: _addStep,
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...List.generate(_steps.length, (i) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      margin: const EdgeInsets.only(top: 14, right: 10),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${i + 1}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _steps[i],
                        decoration: InputDecoration(
                            labelText: 'Étape ${i + 1}', isDense: false),
                        maxLines: 3,
                        minLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline_rounded,
                          color: AppColors.textSecondary, size: 20),
                      onPressed: () => _removeStep(i),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _IngredientEntry {
  final name = TextEditingController();
  final qty = TextEditingController();
  void dispose() {
    name.dispose();
    qty.dispose();
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
            ?.copyWith(fontWeight: FontWeight.w700, color: AppColors.textPrimary));
  }
}
