import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../providers/shopping_list_provider.dart';

class ShoppingListScreen extends ConsumerWidget {
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(shoppingListNotifierProvider);
    final checked = items.where((i) => i.isChecked).length;
    final total = items.length;

    // Group by category in display order
    final Map<String, List<ShoppingItem>> grouped = {};
    for (final cat in shoppingCategories) {
      final catItems = items.where((i) => i.category == cat).toList();
      if (catItems.isNotEmpty) grouped[cat] = catItems;
    }
    // Any unlisted categories
    final extra = items.where((i) => !shoppingCategories.contains(i.category));
    for (final i in extra) {
      grouped.putIfAbsent(i.category, () => []).add(i);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste de courses'),
        actions: [
          if (checked > 0)
            IconButton(
              icon: const Icon(Icons.cleaning_services_rounded),
              tooltip: 'Supprimer cochés',
              onPressed: () =>
                  ref.read(shoppingListNotifierProvider.notifier).clearChecked(),
            ),
        ],
      ),
      body: items.isEmpty
          ? const _EmptyState()
          : Column(
              children: [
                if (total > 0) _ProgressBanner(checked: checked, total: total),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 100),
                    children: grouped.entries.map((entry) {
                      return _CategorySection(
                        category: entry.key,
                        items: entry.value,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Ajouter'),
        onPressed: () => _showAddDialog(context, ref),
      ),
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final qtyCtrl = TextEditingController();
    String category = 'Autre';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Ajouter un article'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Article *'),
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: qtyCtrl,
                decoration:
                    const InputDecoration(labelText: 'Quantité (ex: 200g)'),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: category,
                decoration: const InputDecoration(labelText: 'Catégorie'),
                items: shoppingCategories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setDialogState(() => category = v ?? category),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Annuler'),
            ),
            FilledButton(
              onPressed: () {
                if (nameCtrl.text.trim().isNotEmpty) {
                  ref.read(shoppingListNotifierProvider.notifier).add(
                        nameCtrl.text,
                        quantity: qtyCtrl.text.isNotEmpty ? qtyCtrl.text : null,
                        category: category,
                      );
                  Navigator.pop(ctx);
                }
              },
              child: const Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressBanner extends StatelessWidget {
  final int checked;
  final int total;
  const _ProgressBanner({required this.checked, required this.total});

  @override
  Widget build(BuildContext context) {
    final pct = total == 0 ? 0.0 : checked / total;
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      color: AppColors.primary.withValues(alpha: 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$checked / $total articles cochés',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 13)),
              Text('${(pct * 100).round()}%',
                  style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 13)),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: pct,
              backgroundColor: Colors.grey.shade200,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.primary),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategorySection extends ConsumerWidget {
  final String category;
  final List<ShoppingItem> items;
  const _CategorySection({required this.category, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Text(
            category,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
          ),
        ),
        ...items.map((item) => _ShoppingItemTile(item: item)),
      ],
    );
  }
}

class _ShoppingItemTile extends ConsumerWidget {
  final ShoppingItem item;
  const _ShoppingItemTile({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(shoppingListNotifierProvider.notifier);

    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red.shade100,
        child: const Icon(Icons.delete_outline_rounded, color: Colors.red),
      ),
      onDismissed: (_) => notifier.remove(item.id),
      child: ListTile(
        leading: Checkbox(
          value: item.isChecked,
          activeColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          onChanged: (_) => notifier.toggle(item.id),
        ),
        title: Text(
          item.name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            decoration: item.isChecked ? TextDecoration.lineThrough : null,
            color: item.isChecked ? AppColors.textSecondary : AppColors.textPrimary,
          ),
        ),
        subtitle: item.quantity != null && item.quantity!.isNotEmpty
            ? Text(item.quantity!,
                style: TextStyle(
                    color: item.isChecked
                        ? AppColors.textSecondary.withValues(alpha: 0.6)
                        : AppColors.textSecondary))
            : null,
        onTap: () => notifier.toggle(item.id),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.shopping_cart_outlined,
                size: 64, color: AppColors.textSecondary),
            const SizedBox(height: 16),
            Text('Liste vide',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(
              'Ajoutez des articles manuellement ou générez la liste depuis le menu de la semaine',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
