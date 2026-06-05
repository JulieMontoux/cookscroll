# Graph Report - /Users/montouxjulie/Desktop/cookscroll  (2026-06-05)

## Corpus Check
- 5 files · ~50,000 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 435 nodes · 515 edges · 52 communities (32 shown, 20 thin omitted)
- Extraction: 87% EXTRACTED · 13% INFERRED · 0% AMBIGUOUS · INFERRED: 65 edges (avg confidence: 0.91)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_CookScroll App|CookScroll App]]
- [[_COMMUNITY_MVP V1 Scope|MVP V1 Scope]]
- [[_COMMUNITY_FormState|FormState]]
- [[_COMMUNITY_Concept Bottom Navigation - 5-tab navigation pattern (Feed, Recipes, Menu, List, Profile) shared across screens|Concept: Bottom Navigation - 5-tab navigation pattern (Feed, Recipes, Menu, List, Profile) shared across screens]]
- [[_COMMUNITY_TheMealDB external API (base URL + endpoints)|TheMealDB external API (base URL + endpoints)]]
- [[_COMMUNITY_Clean architecture  feature-based structure|Clean architecture / feature-based structure]]
- [[_COMMUNITY_app_colors.dart|app_colors.dart]]
- [[_COMMUNITY_Android App Build Config|Android App Build Config]]
- [[_COMMUNITY__|_]]
- [[_COMMUNITY_AutoDisposeProviderRef|AutoDisposeProviderRef]]
- [[_COMMUNITY_IconData|IconData]]
- [[_COMMUNITY_packagefluttermaterial.dart|package:flutter/material.dart]]
- [[_COMMUNITY_ConsumerWidget|ConsumerWidget]]
- [[_COMMUNITY_Feature Onboarding Flow (welcome, dietary prefs, skill level)|Feature: Onboarding Flow (welcome, dietary prefs, skill level)]]
- [[_COMMUNITY__FieldLabel|_FieldLabel]]
- [[_COMMUNITY_Any|Any]]
- [[_COMMUNITY_packagego_routergo_router.dart|package:go_router/go_router.dart]]
- [[_COMMUNITY_....corethemeapp_colors.dart|../../core/theme/app_colors.dart]]
- [[_COMMUNITY_flutter_lldb_helper.py|flutter_lldb_helper.py]]
- [[_COMMUNITY_Contents.json|Contents.json]]
- [[_COMMUNITY_Contents.json|Contents.json]]
- [[_COMMUNITY_packagecookscrollmain.dart|package:cookscroll/main.dart]]
- [[_COMMUNITY_Feature Nutritional Macros Display (kcal, prot, carb, fat)|Feature: Nutritional Macros Display (kcal, prot, carb, fat)]]
- [[_COMMUNITY_FlutterEngine|FlutterEngine]]
- [[_COMMUNITY_RunnerTests.swift|RunnerTests.swift]]
- [[_COMMUNITY_recipe_detail_screen.dart|recipe_detail_screen.dart]]
- [[_COMMUNITY_settings.local.json|settings.local.json]]
- [[_COMMUNITY_MainActivity.kt|MainActivity.kt]]
- [[_COMMUNITY_Feature Authentication (Sign InSign Up, Apple, Google)|Feature: Authentication (Sign In/Sign Up, Apple, Google)]]
- [[_COMMUNITY_Feature Create Recipe|Feature: Create Recipe]]
- [[_COMMUNITY_Feature Search Recipes|Feature: Search Recipes]]
- [[_COMMUNITY_GeneratedPluginRegistrant.m|GeneratedPluginRegistrant.m]]
- [[_COMMUNITY_profile_screen.dart|profile_screen.dart]]
- [[_COMMUNITY_weekly_menu_screen.dart|weekly_menu_screen.dart]]
- [[_COMMUNITY_go_router navigation pattern (context.go + GoRoute declarations)|go_router navigation pattern (context.go + GoRoute declarations)]]
- [[_COMMUNITY_Design Token Primary Color ae2f34 (red)|Design Token: Primary Color #ae2f34 (red)]]
- [[_COMMUNITY_Design Token Font Inter (bodylabels)|Design Token: Font Inter (body/labels)]]
- [[_COMMUNITY_flutter_export_environment.sh|flutter_export_environment.sh]]
- [[_COMMUNITY_Dart Analysis + Linting Config (flutter_lints)|Dart Analysis + Linting Config (flutter_lints)]]
- [[_COMMUNITY_Android Root Build Config|Android Root Build Config]]
- [[_COMMUNITY_Design System Material Symbols Outlined Icons|Design System: Material Symbols Outlined Icons]]
- [[_COMMUNITY_FLUTTER_ROOT=opthomebrewshareflutter|FLUTTER_ROOT=/opt/homebrew/share/flutter]]
- [[_COMMUNITY_flutter_lldb_helper.py - LLDB debug helper for Flutter iOS RX pages breakpoint interception|flutter_lldb_helper.py - LLDB debug helper for Flutter iOS RX pages breakpoint interception]]
- [[_COMMUNITY_AppIcon Contents.json - iOS app icon asset catalog for iPhone and iPad sizes|AppIcon Contents.json - iOS app icon asset catalog for iPhone and iPad sizes]]
- [[_COMMUNITY_LaunchImage Contents.json - iOS launch screen image asset catalog (1x2x3x universal)|LaunchImage Contents.json - iOS launch screen image asset catalog (1x/2x/3x universal)]]
- [[_COMMUNITY_CookScroll App|CookScroll App]]
- [[_COMMUNITY_UI Component Top AppBar (CookScroll branding)|UI Component: Top AppBar (CookScroll branding)]]

## God Nodes (most connected - your core abstractions)
1. `login_screen.dart` - 23 edges
2. `__` - 21 edges
3. `app_colors.dart` - 18 edges
4. `Spécifications Fonctionnelles Générales CookScroll` - 17 edges
5. `Spécifications Fonctionnelles Générales - CookScroll` - 17 edges

## Surprising Connections (you probably didn't know these)
- None detected - all connections are within the same source files.

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Core MVP Features: scroll, save, shopping list, weekly menu, auth, offline** — docs_sfg_cookscroll_ef01, docs_sfg_cookscroll_ef03, docs_sfg_cookscroll_ef05, docs_sfg_cookscroll_ef06, docs_sfg_cookscroll_ef08, docs_sfg_cookscroll_ef10 [EXTRACTED 1.00]
- **Flutter Tech Stack: riverpod + go_router + drift + dio + secure_storage** — pubspec_cookscroll_project, pubspec_flutter_riverpod_dep, pubspec_go_router_dep, pubspec_drift_dep, pubspec_dio_dep, pubspec_flutter_secure_storage_dep [EXTRACTED 1.00]
- **Culinary Flow Design System: colors, typography, layout applied in mockups** — maquettes_culinary_flow_design_system, maquettes_culinary_flow_concept_color_palette, maquettes_culinary_flow_concept_typography, maquettes_culinary_flow_concept_layout, maquettes_create_recipe_code_create_recipe_ui, maquettes_cookscroll_logo_code_logo [EXTRACTED 1.00]
- **Specification Documents Triad: CDC + SFG + SFD** — docs_cahier_des_charges_cookscroll_cdc, docs_sfg_cookscroll_sfg, docs_sfd_cookscroll_sfd [EXTRACTED 1.00]
- **Shopping List DB Pipeline: weekly_menus -> menu_entries -> recipe_ingredients -> shopping_list** — docs_schema_bdd_cookscroll_table_weekly_menus, docs_schema_bdd_cookscroll_table_recipes, docs_schema_bdd_cookscroll_table_ingredients, docs_schema_bdd_cookscroll_table_shopping_lists, docs_schema_bdd_cookscroll_query_shopping_list [EXTRACTED 1.00]
- **Onboarding Flow: Welcome -> Dietary Preferences -> Skill Level** — mockup_onboarding_welcome, mockup_onboarding_dietary, mockup_onboarding_skill, feature_onboarding [EXTRACTED 1.00]
- **MVP Core Features: Scroll, Filter, Save, Menu, Shopping List** — feature_recipe_scroll, feature_filter_recipes, feature_save_recipes, feature_weekly_menu, feature_shopping_list, sfg_mvp_v1 [INFERRED 0.95]
- **Shared Design System (Tailwind, Montserrat/Inter, Material Icons, Primary #ae2f34)** — design_tailwind, design_font_montserrat, design_font_inter, design_material_icons, design_color_primary, design_color_secondary, design_glassmorphism [EXTRACTED 1.00]
- **All Screens share Bottom Navigation Bar** — mockup_recipe_feed, mockup_my_recipes, mockup_weekly_menu_plan, mockup_shopping_list, mockup_profile_settings, mockup_filter_panel, mockup_search_recipes, ui_bottom_nav [EXTRACTED 1.00]
- **User Stories by Persona: Karenn (meal planning) and Antoine (gamification/scroll)** — sfg_persona_karenn, sfg_persona_antoine, sfg_user_story_map [EXTRACTED 1.00]
- **All main screens share Bottom Navigation Bar with 5 tabs** — recipe_feed_screen_ui, search_recipes_screen_ui, shopping_list_screen_ui, weekly_menu_plan_screen_ui, concept_bottom_nav [EXTRACTED 1.00]
- **iOS Flutter plugin set: flutter_secure_storage, path_provider, sqflite, sqlite3_flutter_libs** — ios_runner_generated_plugin_registrant_m, ios_runner_plugin_flutter_secure_storage, ios_runner_plugin_path_provider, ios_runner_plugin_sqflite, ios_runner_plugin_sqlite3_flutter_libs [EXTRACTED 1.00]
- **CookScroll UI Mockup Screens - all 5 main app screens** — recipe_feed_screen_ui, search_recipes_screen_ui, shopping_list_screen_ui, sign_up_login_screen_ui, weekly_menu_plan_screen_ui [INFERRED 0.95]
- **Onboarding 3-screen flow: Welcome -> Dietary -> Skill -> /feed** — auth_onboarding_welcome_screen_onboardingwelcomescreen, auth_onboarding_dietary_screen_onboardingdietaryscreen, auth_onboarding_skill_screen_onboardingskillscreen, concept_onboarding_flow [EXTRACTED 1.00]
- **OnboardingDietaryScreen + OnboardingSkillScreen share state via onboardingNotifierProvider** — auth_onboarding_dietary_screen_onboardingdietaryscreen, auth_onboarding_skill_screen_onboardingskillscreen, auth_onboarding_provider_onboardingnotifier, auth_onboarding_provider_onboardingnotifierprovider, auth_onboarding_provider_onboardingstate [EXTRACTED 1.00]
- **All auth screens reference AppColors for consistent theming** — auth_login_screen_loginscreen, auth_onboarding_welcome_screen_onboardingwelcomescreen, auth_onboarding_dietary_screen_onboardingdietaryscreen, auth_onboarding_skill_screen_onboardingskillscreen, theme_app_colors_appcolors [EXTRACTED 1.00]
- **appRouter registers all onboarding + auth screens as GoRoute entries** — router_app_router_approuter, auth_onboarding_welcome_screen_onboardingwelcomescreen, auth_onboarding_dietary_screen_onboardingdietaryscreen, auth_onboarding_skill_screen_onboardingskillscreen, auth_login_screen_loginscreen [EXTRACTED 1.00]
- **App entry wiring: main() → ProviderScope → CookScrollApp → appRouterProvider → MaterialApp.router** — main_main_fn, main_providerscope, main_cookscrollapp, main_approuterprovider, main_apptheme_light [EXTRACTED 1.00]
- **MainScaffold bottom nav connects 5 routes to feature screens** — main_scaffold_mainscaffold, main_scaffold_route_feed, main_scaffold_route_recipes, main_scaffold_route_menu, main_scaffold_route_list, main_scaffold_route_profile [EXTRACTED 1.00]
- **All feature screens are placeholders ('coming soon') except RecipeDetailScreen which accepts recipeId param** — feed_screen_feedscreen, weekly_menu_screen_weeklymenuscreen, profile_screen_profilescreen, create_recipe_screen_createrecipescreen, my_recipes_screen_myrecipesscreen, recipe_detail_screen_recipedetailscreen, shopping_list_screen_shoppinglistscreen, concept_placeholder_screens [EXTRACTED 0.95]
- **Shared widgets (DotsIndicator, MainScaffold) both consume AppColors from core/theme** — dots_indicator_dotsindicator, main_scaffold_mainscaffold, dots_indicator_appcolors [EXTRACTED 1.00]

## Communities (52 total, 20 thin omitted)

### Community 0 - "CookScroll App"
Cohesion: 0.05
Nodes (51): CookScroll App, CookScroll Logo, Design Pattern: Glassmorphism (backdrop blur overlays), Tech Stack: Tailwind CSS, Feature: Filter Recipes (macros, allergens, difficulty, prep time), Feature: Recipe Scroll Feed, Feature: Save/Bookmark Recipes, Feature: Shopping List Generation (+43 more)

### Community 1 - "MVP V1 Scope"
Cohesion: 0.08
Nodes (38): MVP V1 Scope, V2 Social Features (out of MVP scope), Cahier des Charges CookScroll, Offline Mode (SQLite local cache), Consolidated Shopping List Generation, Tech Stack: Flutter + Node.js/FastAPI + PostgreSQL + Redis, TikTok-style Vertical Recipe Scroll, Weekly Meal Planning (Menu de la semaine) (+30 more)

### Community 2 - "FormState"
Cohesion: 0.07
Nodes (31): FormState, Route /feed, Route /list, Route /login, Route /menu, Route /onboarding, Route /onboarding/dietary, Route /onboarding/skill (+23 more)

### Community 3 - "Concept: Bottom Navigation - 5-tab navigation pattern (Feed, Recipes, Menu, List, Profile) shared across screens"
Cohesion: 0.09
Nodes (28): Concept: Bottom Navigation - 5-tab navigation pattern (Feed, Recipes, Menu, List, Profile) shared across screens, Concept: CookScroll App - Flutter-based mobile cooking app with recipe feed, search, weekly menu planning, shopping list, auth, Concept: Weekly Menu to Shopping List Flow - Generate List action converts meal plan into categorized shopping list, FLUTTER_TARGET=lib/main.dart - Flutter entry point, flutter_export_environment.sh - Shell script exporting Flutter build environment variables for iOS, AppDelegate.swift - Flutter iOS app entry point, registers Flutter plugins, Runner-Bridging-Header.h - Swift/ObjC bridging header importing GeneratedPluginRegistrant, GeneratedPluginRegistrant.h - Objective-C header declaring plugin registration interface (+20 more)

### Community 4 - "TheMealDB external API (base URL + endpoints)"
Cohesion: 0.07
Nodes (26): TheMealDB external API (base URL + endpoints), USDA FoodData Central API (nutrition data), ApiConstants, mealById, mealCategories, mealDbBaseUrl, mealsByCategory, randomMeal (+18 more)

### Community 5 - "Clean architecture / feature-based structure"
Cohesion: 0.10
Nodes (24): Clean architecture / feature-based structure, GoRouter shell route pattern (MainScaffold wraps child), Placeholder screens pattern (coming soon body), CreateRecipeScreen (placeholder), AppColors (used in DotsIndicator), DotsIndicator, FeedScreen (placeholder), appRouterProvider (ref.watch) (+16 more)

### Community 6 - "app_colors.dart"
Cohesion: 0.18
Nodes (19): app_colors.dart, LoginScreen, OnboardingDietaryScreen, OnboardingNotifier (Riverpod @riverpod notifier), onboardingNotifierProvider (AutoDisposeNotifierProvider), OnboardingState (selectedAllergens, skillLevel), OnboardingSkillScreen, OnboardingWelcomeScreen (+11 more)

### Community 7 - "Android App Build Config"
Cohesion: 0.11
Nodes (19): Android App Build Config, GeneratedPluginRegistrant (Android Flutter plugins), MainActivity (Android entry point), Android Settings Gradle, CookScroll Logo SVG (pot with steam), Create Recipe UI (HTML/Tailwind mockup), Color Palette: Vibrant Coral primary (#ae2f34), Warm Orange secondary, Layout: Full-bleed vertical scroll, 20px container margin, 4px grid (+11 more)

### Community 8 - "_"
Cohesion: 0.12
Nodes (15): _, @riverpod, onboardingNotifierProvider, package:riverpod_annotation/riverpod_annotation.dart, build, copyWith, OnboardingNotifier, onboardingNotifierProvider (+7 more)

### Community 9 - "AutoDisposeProviderRef"
Cohesion: 0.13
Nodes (16): AutoDisposeProviderRef, ../../features/auth/presentation/screens/login_screen.dart, ../../features/auth/presentation/screens/onboarding_dietary_screen.dart, ../../features/auth/presentation/screens/onboarding_skill_screen.dart, ../../features/auth/presentation/screens/onboarding_welcome_screen.dart, ../../features/feed/presentation/screens/feed_screen.dart, ../../features/menu/presentation/screens/weekly_menu_screen.dart, ../../features/profile/presentation/screens/profile_screen.dart (+8 more)

### Community 10 - "IconData"
Cohesion: 0.14
Nodes (14): IconData, ../providers/onboarding_provider.dart, _allergens, icon, isSelected, label, onTap, icon (+6 more)

### Community 11 - "package:flutter/material.dart"
Cohesion: 0.15
Nodes (9): package:flutter/material.dart, build, CreateRecipeScreen, build, FeedScreen, build, MyRecipesScreen, build (+1 more)

### Community 12 - "ConsumerWidget"
Cohesion: 0.20
Nodes (9): ConsumerWidget, core/router/app_router.dart, core/theme/app_theme.dart, build, CookScrollApp, main, package:flutter/services.dart, OnboardingDietaryScreen (+1 more)

### Community 13 - "Feature: Onboarding Flow (welcome, dietary prefs, skill level)"
Cohesion: 0.20
Nodes (10): Feature: Onboarding Flow (welcome, dietary prefs, skill level), Mockup: Onboarding Dietary Preferences Screen, Mockup: Onboarding Skill Level Screen, Mockup: Onboarding Welcome Screen, Screen: Onboarding Dietary Preferences, Screen: Onboarding Skill Level, Screen: Onboarding Welcome, UI Component: Dietary Preference Chips (gluten-free, lactose-free, vegan, vegetarian, nut-free, keto) (+2 more)

### Community 14 - "_FieldLabel"
Cohesion: 0.24
Nodes (9): _FieldLabel, _SocialButton, _AllergenChip, _LevelCard, _FeatureCard, _Logo, OnboardingWelcomeScreen, ../../../../shared/widgets/dots_indicator.dart (+1 more)

### Community 15 - "Any"
Cohesion: 0.29
Nodes (5): Any, Bool, FlutterAppDelegate, AppDelegate, UIApplication

### Community 16 - "package:go_router/go_router.dart"
Cohesion: 0.29
Nodes (6): package:go_router/go_router.dart, Widget, child, _currentIndex, MainScaffold, _navItem

### Community 17 - "../../core/theme/app_colors.dart"
Cohesion: 0.33
Nodes (5): ../../core/theme/app_colors.dart, build, current, DotsIndicator, total

### Community 18 - "flutter_lldb_helper.py"
Cohesion: 0.33
Nodes (5): handle_new_rx_page(), __lldb_init_module(), Intercept NOTIFY_DEBUGGER_ABOUT_RX_PAGES and touch the pages., SBDebugger, SBFrame

### Community 19 - "Contents.json"
Cohesion: 0.40
Nodes (4): images, info, author, version

### Community 20 - "Contents.json"
Cohesion: 0.40
Nodes (4): images, info, author, version

### Community 21 - "package:cookscroll/main.dart"
Cohesion: 0.40
Nodes (4): package:cookscroll/main.dart, package:flutter_riverpod/flutter_riverpod.dart, package:flutter_test/flutter_test.dart, main

### Community 22 - "Feature: Nutritional Macros Display (kcal, prot, carb, fat)"
Cohesion: 0.50
Nodes (4): Feature: Nutritional Macros Display (kcal, prot, carb, fat), Mockup: Recipe Detail Screen, Screen: Recipe Detail, UI Component: Recipe Detail Bottom Sheet

### Community 25 - "recipe_detail_screen.dart"
Cohesion: 0.50
Nodes (3): build, RecipeDetailScreen, recipeId

### Community 28 - "Feature: Authentication (Sign In/Sign Up, Apple, Google)"
Cohesion: 0.67
Nodes (3): Feature: Authentication (Sign In/Sign Up, Apple, Google), Mockup: Sign Up / Login Screen, UI Component: Sign In/Up Form (email, password, Apple/Google SSO)

### Community 29 - "Feature: Create Recipe"
Cohesion: 0.67
Nodes (3): Feature: Create Recipe, Screen: Create Recipe, UI Component: Create Recipe Form (cover photo, title, ingredients, steps)

### Community 30 - "Feature: Search Recipes"
Cohesion: 0.67
Nodes (3): Feature: Search Recipes, Mockup: Search Recipes Screen, UI Component: Search Bar with Recent Searches and Results Grid

## Knowledge Gaps
- **173 isolated node(s):** `CookScroll App`, `flutter_riverpod (state management)`, `go_router (navigation)`, `dio (HTTP networking)`, `freezed + json_serializable (data classes)` (+168 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **20 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.