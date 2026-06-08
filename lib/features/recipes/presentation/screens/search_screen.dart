import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../providers/recipe_provider.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  final _focus = FocusNode();

  static const _recents = [
    'Pasta', 'Chicken', 'Vegan', 'Dessert', 'Seafood',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _focus.requestFocus());
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _search(String q) {
    ref.read(searchNotifierProvider.notifier).search(q);
  }

  @override
  Widget build(BuildContext context) {
    final resultsAsync = ref.watch(searchNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: TextField(
          controller: _controller,
          focusNode: _focus,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Rechercher une recette…',
            border: InputBorder.none,
            filled: false,
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear_rounded),
                    onPressed: () {
                      _controller.clear();
                      ref.read(searchNotifierProvider.notifier).clear();
                      setState(() {});
                    },
                  )
                : null,
          ),
          onChanged: (v) {
            setState(() {});
            if (v.length >= 2) _search(v);
            if (v.isEmpty) ref.read(searchNotifierProvider.notifier).clear();
          },
          onSubmitted: _search,
        ),
      ),
      body: resultsAsync.when(
        loading: () =>
            const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        error: (e, _) => Center(child: Text('Erreur: $e')),
        data: (results) {
          if (_controller.text.isEmpty) {
            return _RecentSearches(
              items: _recents,
              onTap: (q) {
                _controller.text = q;
                _search(q);
                setState(() {});
              },
            );
          }
          if (results.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.search_off_rounded,
                      size: 56, color: AppColors.textSecondary),
                  const SizedBox(height: 12),
                  Text(
                    'Aucun résultat pour "${_controller.text}"',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                child: Text(
                  '${results.length} résultat${results.length > 1 ? 's' : ''}',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: AppColors.textSecondary),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: results.length,
                  itemBuilder: (context, i) {
                    final r = results[i];
                    return GestureDetector(
                      onTap: () => context.push('/recipes/${r.id}'),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            if (r.imageUrl != null)
                              Image.network(r.imageUrl!, fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) =>
                                      const ColoredBox(color: Color(0xFFE0E0E0)))
                            else
                              const ColoredBox(color: Color(0xFFE0E0E0)),
                            Positioned.fill(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: const [0.5, 1.0],
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withValues(alpha: 0.7),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              right: 10,
                              bottom: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    r.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  if (r.category != null)
                                    Text(
                                      r.category!,
                                      style: const TextStyle(
                                          color: Colors.white70, fontSize: 11),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _RecentSearches extends StatelessWidget {
  final List<String> items;
  final void Function(String) onTap;
  const _RecentSearches({required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Recherches récentes',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: items
              .map((q) => ActionChip(
                    avatar: const Icon(Icons.history_rounded, size: 16),
                    label: Text(q),
                    onPressed: () => onTap(q),
                  ))
              .toList(),
        ),
        const SizedBox(height: 32),
        Text('Catégories populaires',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            'Chicken', 'Beef', 'Seafood', 'Vegetarian',
            'Pasta', 'Dessert', 'Lamb', 'Pork',
          ]
              .map((c) => ActionChip(
                    label: Text(c),
                    backgroundColor: AppColors.primary.withValues(alpha: 0.08),
                    labelStyle: const TextStyle(color: AppColors.primary),
                    onPressed: () => onTap(c),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
