import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/feed')) return 0;
    if (location.startsWith('/recipes')) return 1;
    if (location.startsWith('/menu')) return 2;
    if (location.startsWith('/list')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final index = _currentIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(top: BorderSide(color: Color(0xFFEEEEEE))),
        ),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) {
            switch (i) {
              case 0: context.go('/feed');
              case 1: context.go('/recipes');
              case 2: context.go('/menu');
              case 3: context.go('/list');
              case 4: context.go('/profile');
            }
          },
          items: [
            _navItem(Icons.home_rounded, Icons.home_outlined, 'Feed', index == 0),
            _navItem(Icons.menu_book_rounded, Icons.menu_book_outlined, 'Recipes', index == 1),
            _navItem(Icons.restaurant_menu_rounded, Icons.restaurant_menu_outlined, 'Menu', index == 2),
            _navItem(Icons.shopping_cart_rounded, Icons.shopping_cart_outlined, 'List', index == 3),
            _navItem(Icons.person_rounded, Icons.person_outlined, 'Profile', index == 4),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem(
    IconData active,
    IconData inactive,
    String label,
    bool isActive,
  ) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: isActive
            ? BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              )
            : null,
        child: Icon(
          isActive ? active : inactive,
          color: isActive ? AppColors.textOnPrimary : AppColors.textSecondary,
          size: 22,
        ),
      ),
      label: label,
    );
  }
}
