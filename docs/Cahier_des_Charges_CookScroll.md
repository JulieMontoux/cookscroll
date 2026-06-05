# Cahier des Charges — CookScroll

**Équipe :** GAISNON Mathieu · MONTOUX Julie · CARION Paul · FARASSI Yassin  
**Version :** 1.0 — 2026-06-05  
**Statut :** Initial

---

## 1. Présentation du projet

### 1.1 Nom et nature du projet

**CookScroll** — Application mobile de découverte de recettes par scroll vertical, avec génération automatique de liste de courses.

### 1.2 Contexte

La planification des repas reste un problème fragmenté : les outils existants (Marmiton, 750g, applications de courses, tableurs) ne communiquent pas entre eux. L'utilisateur perd du temps à naviguer entre plusieurs sources, recopie manuellement les ingrédients et gère seul la cohérence budgétaire.

CookScroll résout ce problème en combinant la découverte addictive (style TikTok) et la logistique des courses en une seule application.

### 1.3 Objectifs du projet

1. Réduire le temps de planification hebdomadaire à moins de 15 minutes
2. Réduire le budget alimentaire via une liste de courses consolidée et sans doublons
3. Fidéliser l'utilisateur par une expérience de découverte fluide et personnalisée

### 1.4 Parties prenantes

| Rôle | Personne | Responsabilité |
|------|---------|---------------|
| Chef de projet produit (AMOA) | Henri Reux | Pilotage, arbitrages, validation fonctionnelle |
| UX Designer (AMOA) | Emma Clope | Maquettes, tests utilisateurs |
| Développeur mobile (MOE) | Jean-Joseph Besef | iOS et Android |
| Développeur back-end (MOE) | Catherine Moudubou | API, base de données, génération liste |
| Équipe projet | GAISNON M., MONTOUX J., CARION P., FARASSI Y. | Analyse, spécifications, coordination |

---

## 2. Périmètre fonctionnel

### 2.1 V1 — MVP (dans le périmètre)

| Fonctionnalité | Priorité |
|---------------|---------|
| Scroll vertical de recettes (fil TikTok-like) | CRITIQUE |
| Enregistrement recette en un geste | CRITIQUE |
| Filtres macronutriments + allergènes | ÉLEVÉE |
| Consulter le détail d'une recette | CRITIQUE |
| Menu de la semaine (planification) | ÉLEVÉE |
| Génération liste de courses consolidée | CRITIQUE |
| Créer des recettes privées | MOYENNE |
| Inscription / connexion (email, Apple, Google) | CRITIQUE |
| Tutoriel d'onboarding | MOYENNE |
| Mode hors-ligne (recettes + liste) | ÉLEVÉE |
| Recherche de recettes | MOYENNE |

### 2.2 V2 — Hors périmètre MVP

- Fonctionnalités sociales : partage, abonnements, commentaires, badges sociaux
- Profil chef / créateur de contenu public
- Live cuisine "Cuisinons ensemble"
- Intégration drive (Leclerc, Carrefour) — commande en ligne
- Assistant IA (recette depuis le frigo, conseiller nutritionnel)
- Producteurs locaux
- Notifications personnalisées

### 2.3 Explicitement exclus (toutes versions)

- Version web ou desktop
- Module de paiement ou livraison
- Reconnaissance visuelle d'ingrédients (scan)
- Messagerie interne entre utilisateurs

---

## 3. Cibles utilisateurs

### Persona 1 — Karenn S.

- Actif, cuisine régulièrement à domicile, famille avec budget serré
- Besoin : planifier 5 dîners en moins de 15 min, courses sans oublis
- Comportement : utilise peu les apps complexes, veut de l'efficacité

### Persona 2 — Antoine E.

- Étudiant, cuisinier débutant, motivé par la gamification
- Besoin : inspiration rapide, apprendre à cuisiner progressivement
- Comportement : gros consommateur de contenus courts (TikTok, Reels)

---

## 4. Contraintes techniques

### 4.1 Plateformes cibles

| Plateforme | Version minimale |
|-----------|-----------------|
| iOS | 15.0 |
| Android | 10 (API 29) |

### 4.2 Stack technologique recommandée

| Composant | Technologie recommandée | Justification |
|-----------|------------------------|---------------|
| Mobile | React Native ou Flutter | Codebase unique iOS + Android |
| Back-end | Node.js / Python (FastAPI) | Flexibilité, facilité de mise à l'échelle |
| Base de données | PostgreSQL | Requêtes complexes pour consolidation courses |
| Cache | Redis | Performance du fil de scroll |
| Auth | Firebase Auth ou Auth0 | SSO Apple/Google, robustesse |
| Stockage media | AWS S3 / Cloudinary | Photos recettes |
| Hors-ligne | SQLite local (mobile) | Synchronisation différée |

> La stack finale est à arbitrer par la MOE selon les compétences de l'équipe.

### 4.3 Contraintes non-fonctionnelles

| Exigence | Valeur cible |
|---------|-------------|
| Transition scroll | < 300 ms |
| Démarrage app | < 3 s (terminal moyen gamme) |
| Génération liste de courses | < 2 s (21 repas) |
| Disponibilité back-end | ≥ 99,5 % |
| Couverture de tests | ≥ 70 % |
| Conformité | RGPD, App Store Guidelines, Google Play Policy |
| Accessibilité | WCAG 2.1 niveau AA (daltonisme, taille de texte) |
| Sécurité | Mots de passe hashés (Argon2/bcrypt), HTTPS, JWT 30j |

---

## 5. Architecture fonctionnelle

```
┌─────────────────────────────────────────────────────┐
│                   App Mobile                        │
│  ┌──────────┐  ┌──────────┐  ┌────────────────┐    │
│  │  Scroll  │  │  Mes     │  │    Courses     │    │
│  │Recettes  │  │Recettes  │  │  + Menu Sem.   │    │
│  └──────────┘  └──────────┘  └────────────────┘    │
│  ┌──────────────────────────────────────────────┐   │
│  │           Cache local (SQLite)               │   │
│  └──────────────────────────────────────────────┘   │
└───────────────────────┬─────────────────────────────┘
                        │ HTTPS / REST ou GraphQL
┌───────────────────────▼─────────────────────────────┐
│                  API Back-end                        │
│  ┌───────────┐  ┌──────────────┐  ┌─────────────┐   │
│  │  Auth     │  │  Recettes    │  │  Courses    │   │
│  │  Service  │  │  Service     │  │  Service    │   │
│  └───────────┘  └──────────────┘  └─────────────┘   │
└─────────────────────────────────────────────────────┘
```

---

## 6. Livrables

### 6.1 Documents

| Livrable | Statut |
|---------|-------|
| Spécifications Fonctionnelles Générales (SFG) | En cours |
| Spécifications Fonctionnelles Détaillées (SFD) | En cours |
| Cahier des charges (ce document) | Initial |
| Maquettes UI / Wireframes | À produire |
| Modèle de données (schéma BDD) | À produire |
| Plan de tests | À produire |

### 6.2 Application

| Livrable | Description |
|---------|------------|
| MVP iOS + Android | Fonctionnalités V1 listées en §2.1 |
| API back-end V1 | Endpoints recettes, auth, courses |
| Catalogue de recettes initial | Minimum 200 recettes au lancement |
| Publication App Store + Google Play | Avec screenshots et description |

---

## 7. Planning indicatif

| Phase | Contenu | Durée estimée |
|-------|---------|--------------|
| P1 — Spécifications | SFG, SFD, CDC, maquettes | 3 semaines |
| P2 — Architecture & Setup | Stack, CI/CD, BDD, environnements | 1 semaine |
| P3 — Développement MVP | Fonctionnalités V1 par ordre de priorité | 8 semaines |
| P4 — Tests & QA | Tests unitaires, intégration, UAT personas | 2 semaines |
| P5 — Déploiement | Publication stores, monitoring | 1 semaine |
| **Total** | | **~15 semaines** |

**Ordre de développement recommandé (V1) :**
1. Auth + profil de base
2. Fil de scroll + consultation recette
3. Enregistrement recette + "Mes recettes"
4. Filtres
5. Menu de la semaine
6. Génération liste de courses
7. Mode hors-ligne
8. Création recette privée + onboarding + recherche

---

## 8. Critères d'acceptation (Definition of Done)

Une fonctionnalité est considérée terminée si :
- [ ] Développée selon les règles de la SFD correspondante
- [ ] Testée manuellement sur iOS ET Android (vrai appareil ou simulateur)
- [ ] Testée sur terminal moyen gamme (iPhone SE / Samsung A52)
- [ ] Testé en mode hors-ligne si applicable
- [ ] Couverture de tests automatisés ≥ 70 % pour les fonctions critiques
- [ ] Validée par le Product Owner (Henri Reux)
- [ ] Conforme RGPD si données personnelles impliquées

---

## 9. Risques identifiés

| Risque | Probabilité | Impact | Mitigation |
|--------|------------|--------|-----------|
| API recettes insuffisante au lancement | Moyenne | Élevé | Préparer catalogue seed de 200 recettes avant P3 |
| Performance scroll insuffisante | Faible | Critique | Benchmark dès P3, optimisation lazy load |
| Rejet App Store (guidelines) | Faible | Élevé | Revue des guidelines Apple avant soumission |
| Dépassement délai | Moyenne | Moyen | Buffer 1 semaine en P3 ; descoper recherche si besoin |
| Fuite de données utilisateur | Faible | Critique | Audit sécurité avant déploiement, tests OWASP |

---

## 10. Glossaire

Voir Section II de la SFG (`docs/SFG_CookScroll.md`).
