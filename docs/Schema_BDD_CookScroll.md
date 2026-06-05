# Schéma Base de Données — CookScroll

**Version :** 1.0 — 2026-06-05  
**SGBD cible :** PostgreSQL  
**Référence :** SFG EF01-EF11, SFD CU-01/02/03

---

## Diagramme entités-relations (texte)

```
users ──< user_allergens >── allergens
users ──< user_saved_recipes >── recipes
users ──< weekly_menus ──< menu_entries >── recipes
users ──< shopping_lists ──< shopping_list_items >── ingredients
users ── user_preferences
users ── user_streaks
users ──< user_badges >── badges

recipes ──< recipe_steps
recipes ──< recipe_ingredients >── ingredients
recipes ──< recipe_allergens >── allergens
recipes ──< recipe_tags >── tags

ingredients >── ingredient_categories
```

---

## DDL PostgreSQL

```sql
-- ============================================================
-- EXTENSIONS
-- ============================================================
CREATE EXTENSION IF NOT EXISTS "pgcrypto"; -- gen_random_uuid()

-- ============================================================
-- TYPES ENUM
-- ============================================================
CREATE TYPE auth_provider_type   AS ENUM ('email', 'apple', 'google');
CREATE TYPE recipe_source_type   AS ENUM ('catalog', 'user');
CREATE TYPE difficulty_type      AS ENUM ('easy', 'medium', 'hard');
CREATE TYPE day_of_week_type     AS ENUM ('monday','tuesday','wednesday','thursday','friday','saturday','sunday');
CREATE TYPE meal_type_type       AS ENUM ('breakfast', 'lunch', 'dinner', 'snack');

-- ============================================================
-- ALLERGENS
-- ============================================================
CREATE TABLE allergens (
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name       VARCHAR(64) UNIQUE NOT NULL,  -- 'gluten', 'lactose', 'nuts'
    label_fr   VARCHAR(128) NOT NULL          -- 'Gluten', 'Lactose', 'Noix'
);

INSERT INTO allergens (name, label_fr) VALUES
    ('gluten',    'Gluten'),
    ('lactose',   'Lactose'),
    ('nuts',      'Fruits à coque'),
    ('eggs',      'Œufs'),
    ('fish',      'Poisson'),
    ('shellfish', 'Crustacés'),
    ('soy',       'Soja'),
    ('peanuts',   'Arachides');

-- ============================================================
-- INGREDIENT CATEGORIES (rayons)
-- ============================================================
CREATE TABLE ingredient_categories (
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name       VARCHAR(128) NOT NULL,
    sort_order INT NOT NULL DEFAULT 0
);

INSERT INTO ingredient_categories (name, sort_order) VALUES
    ('Fruits & légumes',     1),
    ('Viandes & poissons',   2),
    ('Produits laitiers',    3),
    ('Épicerie sèche',       4),
    ('Surgelés',             5),
    ('Boissons',             6),
    ('Autres',               99);

-- ============================================================
-- USERS
-- ============================================================
CREATE TABLE users (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email               VARCHAR(320) UNIQUE,              -- null si OAuth sans email exposé
    password_hash       VARCHAR(255),                     -- null si OAuth
    auth_provider       auth_provider_type NOT NULL DEFAULT 'email',
    auth_provider_id    VARCHAR(255),                     -- sub Google/Apple
    display_name        VARCHAR(128),
    avatar_url          TEXT,
    email_verified      BOOLEAN NOT NULL DEFAULT false,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    deleted_at          TIMESTAMPTZ                       -- soft delete RGPD
);

CREATE UNIQUE INDEX idx_users_provider
    ON users (auth_provider, auth_provider_id)
    WHERE auth_provider_id IS NOT NULL;

-- ============================================================
-- USER PREFERENCES
-- ============================================================
CREATE TABLE user_preferences (
    id                      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id                 UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    skill_level             difficulty_type NOT NULL DEFAULT 'easy',
    calorie_target          INT,                          -- kcal/jour
    protein_target_g        INT,
    carbs_target_g          INT,
    fat_target_g            INT,
    onboarding_completed    BOOLEAN NOT NULL DEFAULT false,
    updated_at              TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (user_id)
);

-- ============================================================
-- USER ↔ ALLERGENS
-- ============================================================
CREATE TABLE user_allergens (
    user_id     UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    allergen_id UUID NOT NULL REFERENCES allergens(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, allergen_id)
);

-- ============================================================
-- INGREDIENTS
-- ============================================================
CREATE TABLE ingredients (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name        VARCHAR(255) UNIQUE NOT NULL,
    category_id UUID REFERENCES ingredient_categories(id),
    default_unit VARCHAR(32),                             -- 'g', 'ml', 'pcs', 'tbsp'
    external_id VARCHAR(128)                              -- ID Open Food Facts / USDA
);

-- ============================================================
-- RECIPES
-- ============================================================
CREATE TABLE recipes (
    id                      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    source                  recipe_source_type NOT NULL DEFAULT 'catalog',
    author_id               UUID REFERENCES users(id) ON DELETE SET NULL,  -- null = catalog
    external_id             VARCHAR(128),                 -- ID TheMealDB ou autre
    title                   VARCHAR(512) NOT NULL,
    description             TEXT,
    image_url               TEXT,
    prep_time_minutes       INT,
    cook_time_minutes       INT,
    servings                INT NOT NULL DEFAULT 2,
    difficulty              difficulty_type NOT NULL DEFAULT 'easy',
    is_private              BOOLEAN NOT NULL DEFAULT false,
    calories_per_serving    INT,
    proteins_g_per_serving  NUMERIC(6,2),
    carbs_g_per_serving     NUMERIC(6,2),
    fats_g_per_serving      NUMERIC(6,2),
    created_at              TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at              TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_recipes_source    ON recipes(source);
CREATE INDEX idx_recipes_author    ON recipes(author_id);
CREATE INDEX idx_recipes_external  ON recipes(external_id);

-- ============================================================
-- RECIPE STEPS
-- ============================================================
CREATE TABLE recipe_steps (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    recipe_id   UUID NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
    step_number INT NOT NULL,
    instruction TEXT NOT NULL,
    UNIQUE (recipe_id, step_number)
);

-- ============================================================
-- RECIPE ↔ INGREDIENTS
-- ============================================================
CREATE TABLE recipe_ingredients (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    recipe_id     UUID NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
    ingredient_id UUID NOT NULL REFERENCES ingredients(id),
    quantity      NUMERIC(8,3),                          -- null = 'au goût'
    unit          VARCHAR(32),                           -- override default_unit si besoin
    notes         VARCHAR(255),                          -- 'finement haché', 'en dés'
    sort_order    INT NOT NULL DEFAULT 0
);

-- ============================================================
-- RECIPE ↔ ALLERGENS (dénormalisé pour filtrage rapide)
-- ============================================================
CREATE TABLE recipe_allergens (
    recipe_id   UUID NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
    allergen_id UUID NOT NULL REFERENCES allergens(id) ON DELETE CASCADE,
    PRIMARY KEY (recipe_id, allergen_id)
);

-- ============================================================
-- TAGS
-- ============================================================
CREATE TABLE tags (
    id       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name     VARCHAR(64) UNIQUE NOT NULL,
    category VARCHAR(32) NOT NULL  -- 'cuisine', 'diet', 'meal_type', 'technique'
);

CREATE TABLE recipe_tags (
    recipe_id UUID NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
    tag_id    UUID NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
    PRIMARY KEY (recipe_id, tag_id)
);

-- ============================================================
-- USER SAVED RECIPES (likes)
-- ============================================================
CREATE TABLE user_saved_recipes (
    id        UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id   UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    recipe_id UUID NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
    saved_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (user_id, recipe_id)
);

CREATE INDEX idx_saved_user ON user_saved_recipes(user_id);

-- ============================================================
-- WEEKLY MENUS
-- ============================================================
CREATE TABLE weekly_menus (
    id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id          UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    week_start_date  DATE NOT NULL,   -- toujours un lundi
    created_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (user_id, week_start_date)
);

-- ============================================================
-- MENU ENTRIES (créneaux repas)
-- ============================================================
CREATE TABLE menu_entries (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    menu_id     UUID NOT NULL REFERENCES weekly_menus(id) ON DELETE CASCADE,
    recipe_id   UUID NOT NULL REFERENCES recipes(id),
    day_of_week day_of_week_type NOT NULL,
    meal_type   meal_type_type NOT NULL,
    servings    INT NOT NULL DEFAULT 2,    -- override des portions
    sort_order  INT NOT NULL DEFAULT 0     -- plusieurs recettes par créneau
);

CREATE INDEX idx_menu_entries_menu ON menu_entries(menu_id);

-- ============================================================
-- SHOPPING LISTS
-- ============================================================
CREATE TABLE shopping_lists (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id      UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    menu_id      UUID REFERENCES weekly_menus(id) ON DELETE SET NULL,  -- null = liste manuelle
    generated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ============================================================
-- SHOPPING LIST ITEMS
-- ============================================================
CREATE TABLE shopping_list_items (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    list_id       UUID NOT NULL REFERENCES shopping_lists(id) ON DELETE CASCADE,
    ingredient_id UUID REFERENCES ingredients(id),         -- null si article manuel
    custom_name   VARCHAR(255),                            -- article manuel
    quantity      NUMERIC(8,3),
    unit          VARCHAR(32),
    category_id   UUID REFERENCES ingredient_categories(id),
    is_checked    BOOLEAN NOT NULL DEFAULT false,
    is_manual     BOOLEAN NOT NULL DEFAULT false,
    sort_order    INT NOT NULL DEFAULT 0
);

CREATE INDEX idx_list_items_list ON shopping_list_items(list_id);

-- ============================================================
-- GAMIFICATION — STREAKS
-- ============================================================
CREATE TABLE user_streaks (
    id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id          UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    current_streak   INT NOT NULL DEFAULT 0,
    longest_streak   INT NOT NULL DEFAULT 0,
    last_active_date DATE,
    UNIQUE (user_id)
);

-- ============================================================
-- GAMIFICATION — BADGES
-- ============================================================
CREATE TABLE badges (
    id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name             VARCHAR(128) NOT NULL,
    description      TEXT,
    icon_url         TEXT,
    condition_type   VARCHAR(64) NOT NULL  -- 'streak_7', 'saved_10', 'menu_created_1'
);

INSERT INTO badges (name, description, condition_type) VALUES
    ('Première semaine',    '7 jours de streak consécutifs',  'streak_7'),
    ('Gourmet',             '10 recettes enregistrées',       'saved_10'),
    ('Planificateur',       'Premier menu créé',              'menu_created_1'),
    ('Organisé',            'Première liste de courses',       'list_generated_1');

CREATE TABLE user_badges (
    user_id    UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    badge_id   UUID NOT NULL REFERENCES badges(id),
    earned_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (user_id, badge_id)
);
```

---

## Index de performance clés

```sql
-- Filtrage du fil de recettes par allergène (exclusion)
CREATE INDEX idx_recipe_allergens_allergen ON recipe_allergens(allergen_id);

-- Recherche full-text sur les recettes
CREATE INDEX idx_recipes_fts ON recipes USING gin(to_tsvector('french', title || ' ' || COALESCE(description, '')));

-- Filtrage source + date pour le fil paginé
CREATE INDEX idx_recipes_source_created ON recipes(source, created_at DESC);
```

---

## Requête clé — Génération liste de courses

```sql
-- Agrège les ingrédients d'un menu, cumule quantités, groupe par rayon
SELECT
    ic.name              AS rayon,
    ic.sort_order        AS rayon_order,
    i.name               AS ingredient,
    i.default_unit       AS unite,
    SUM(ri.quantity * (me.servings::NUMERIC / r.servings)) AS quantite_totale
FROM weekly_menus wm
JOIN menu_entries    me  ON me.menu_id    = wm.id
JOIN recipes         r   ON r.id          = me.recipe_id
JOIN recipe_ingredients ri ON ri.recipe_id = r.id
JOIN ingredients     i   ON i.id          = ri.ingredient_id
LEFT JOIN ingredient_categories ic ON ic.id = i.category_id
WHERE wm.id = :menu_id
  AND ri.quantity IS NOT NULL
GROUP BY ic.name, ic.sort_order, i.name, i.default_unit
ORDER BY ic.sort_order, i.name;
```

---

## Notes d'implémentation Flutter

- Côté mobile : **SQLite** (via `drift` ou `sqflite`) pour le cache hors-ligne, même schéma simplifié (sans UUID, INT autoincrement)
- Sync différée : table locale `pending_sync` (action, payload JSON, created_at) — vidée à la reconnexion
- Auth tokens : stockés dans **Flutter Secure Storage** (Keychain iOS / Keystore Android)
