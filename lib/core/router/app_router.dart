import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/screens/onboarding_welcome_screen.dart';
import '../../features/auth/presentation/screens/onboarding_dietary_screen.dart';
import '../../features/auth/presentation/screens/onboarding_skill_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/feed/presentation/screens/feed_screen.dart';
import '../../features/recipes/presentation/screens/recipe_detail_screen.dart';
import '../../features/recipes/presentation/screens/my_recipes_screen.dart';
import '../../features/recipes/presentation/screens/create_recipe_screen.dart';
import '../../features/menu/presentation/screens/weekly_menu_screen.dart';
import '../../features/shopping_list/presentation/screens/shopping_list_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../shared/widgets/main_scaffold.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (_, __) => const OnboardingWelcomeScreen(),
      ),
      GoRoute(
        path: '/onboarding/dietary',
        builder: (_, __) => const OnboardingDietaryScreen(),
      ),
      GoRoute(
        path: '/onboarding/skill',
        builder: (_, __) => const OnboardingSkillScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (_, __) => const LoginScreen(),
      ),
      ShellRoute(
        builder: (_, __, child) => MainScaffold(child: child),
        routes: [
          GoRoute(
            path: '/feed',
            builder: (_, __) => const FeedScreen(),
          ),
          GoRoute(
            path: '/recipes',
            builder: (_, __) => const MyRecipesScreen(),
            routes: [
              GoRoute(
                path: 'create',
                builder: (_, __) => const CreateRecipeScreen(),
              ),
              GoRoute(
                path: ':id',
                builder: (_, state) => RecipeDetailScreen(
                  recipeId: state.pathParameters['id']!,
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/menu',
            builder: (_, __) => const WeeklyMenuScreen(),
          ),
          GoRoute(
            path: '/list',
            builder: (_, __) => const ShoppingListScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (_, __) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
