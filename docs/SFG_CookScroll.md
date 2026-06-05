# Spécifications Fonctionnelles Générales — CookScroll

**Équipe :** GAISNON Mathieu · MONTOUX Julie · CARION Paul · FARASSI Yassin  
**Version :** 1.1 — 2026-06-05  
**Statut :** En cours

---

## I. La Vision

### A. Objectif du document

Ce document définit les exigences fonctionnelles de CookScroll, une application mobile permettant de découvrir des recettes en scrollant, de les enregistrer et de générer automatiquement une liste de courses à partir de la sélection. L'objectif est de simplifier la planification des repas et de réduire le budget alimentaire, en s'inspirant de l'expérience fluide des applications courtes vidéo (style TikTok).

### B. Contexte et périmètre

La planification des repas est une contrainte hebdomadaire pour de nombreux actifs : trouver l'inspiration, composer des menus équilibrés sans exploser son budget, puis traduire ces recettes en liste de courses cohérente. Les solutions existantes fonctionnent en silos et imposent une démarche active et fragmentée.

CookScroll part d'un constat simple : si l'on rend la découverte de recettes aussi fluide et addictive que le scroll d'un fil social, l'utilisateur planifie ses repas sans même s'en rendre compte.

**Périmètre V1 (MVP) :** parcours solo — découverte → enregistrement → liste de courses — mode hors-ligne inclus.  
**Périmètre V2 :** fonctionnalités sociales (partage, abonnements, profils chef, live cuisine), intégration drive.  
**Hors périmètre V1 :** version web/desktop, paiement/livraison, reconnaissance visuelle d'ingrédients, messagerie interne.

### C. Intervenants et acteurs

**Maîtrise d'ouvrage (AMOA) :**
- Henri Reux — Chef de projet produit : pilotage fonctionnel, arbitrages MVP/V2
- Emma Clope — UX Designer : conception parcours utilisateur, tests personas

**Maîtrise d'œuvre (MOE) :**
- Jean-Joseph Besef — Développeur mobile iOS/Android
- Catherine Moudubou — Développeur back-end : API recettes, génération liste de courses

**Acteurs externes :**
- Utilisateurs finaux : Karenn S. (planification familiale, budget serré), Antoine E. (étudiant, gamification)
- Créateur de recettes / profil chef (V2)
- Services drive partenaires : Leclerc, Carrefour (V2)

### D. As-Is — Problèmes à résoudre

L'utilisateur navigue entre Marmiton, 750g, une appli de courses séparée, et des notes papier. Il recopie manuellement les ingrédients, gère seul la cohérence budgétaire, et finit par acheter en impulsif en fin de semaine.

### E. To-Be — Bénéfices de la solution

**Bénéfices directs :**
- Réduction du temps de planification hebdomadaire (objectif < 15 min pour Karenn)
- Réduction du budget alimentaire par consolidation intelligente des courses
- Accès à des recettes adaptées au niveau et aux objectifs nutritionnels

**Bénéfices indirects :**
- Réduction du gaspillage alimentaire par planification à la semaine
- Engagement durable via gamification (streaks, badges — Antoine)
- Partage social des habitudes alimentaires saines (V2)

---

## II. Définitions et acronymes

| Acronyme | Définition |
|----------|-----------|
| MVP | Minimum Viable Product |
| SFG | Spécifications Fonctionnelles Générales |
| SFD | Spécifications Fonctionnelles Détaillées |
| CU | Cas d'Utilisation |
| EF | Exigence Fonctionnelle |
| ENF | Exigence Non-Fonctionnelle |
| V1 | Version 1 = MVP |
| V2 | Version 2 — social + drive |

| Terme | Définition |
|-------|-----------|
| Scroll de recettes | Navigation verticale fluide dans un fil de recettes, inspirée TikTok |
| Liste de courses consolidée | Liste générée automatiquement depuis les recettes sélectionnées, ingrédients regroupés par rayon |
| Batch cooking | Préparer plusieurs repas en une session (généralement le dimanche) |
| Macro / Macronutriments | Protéines, glucides, lipides — filtres nutritionnels |
| Profil chef | Compte créateur de contenu culinaire avec recettes publiques (V2) |
| Drive | Service de courses en ligne avec retrait en magasin (V2) |
| Streak | Indicateur de régularité d'utilisation — jours consécutifs |
| Badge | Récompense virtuelle débloquée par accomplissement d'actions |

---

## III. Définition de la solution cible

### A. Processus métier pris en charge

```
[Création/Connexion profil]
  → PR1 Filtrer les recettes
  → PR2 Créer des recettes (privées)
  → PR3 Consulter les recettes (scroll, recherche)
  → PR4 Enregistrer les recettes (like / sauvegarder)
  → PR5 Planifier les recettes (menu semaine)
  → PR6 Générer une liste de courses
  → PR7 Transférer la liste de courses
[Fin]
```

### B. Cas d'utilisation nominal

Voir diagramme UML dans `docs/Spécifications Fonctionnelles (Détaillée et Générale).pdf` — Section III.B.

**Résumé des CU V1 :**
- Consulter les recettes (scroll)
- Filtrer les recettes (macros, allergènes)
- Liker / enregistrer une recette
- Lancer le tutoriel d'onboarding
- Créer des recettes privées
- Créer un menu
- Planifier la semaine
- Faire une liste de courses
- Créer un profil / s'inscrire / se connecter
- Utiliser sans internet (mode hors-ligne)

**CU V2 (hors périmètre MVP) :**
- S'abonner à des profils, partager recettes/photos, recevoir badges, commenter
- Passer commande drive, choisir un magasin, notifs personnalisées
- Live chef "Cuisinons ensemble"
- Assistant IA (recette depuis le frigo, conseiller objectif)

### C. Exigences fonctionnelles

#### EF01 — Scroll de recettes

- **Acteur principal :** Utilisateur
- **Description :** L'utilisateur peut naviguer verticalement dans un fil infini de recettes, chaque recette occupant plein écran
- **Déclencheur :** Ouverture de l'application
- **Urgence :** Élevée
- **Criticité :** Critique
- **Règles :** Chargement progressif (lazy load) ; transition < 300 ms ; fonctionne hors-ligne sur recettes déjà chargées

#### EF02 — Filtrer les recettes

- **Acteur principal :** Utilisateur
- **Description :** L'utilisateur peut filtrer le fil de recettes par macronutriments (protéines, glucides, lipides) et/ou par allergènes
- **Déclencheur :** Activation du panneau filtres
- **Urgence :** Élevée
- **Criticité :** Sévère
- **Règles :** Filtres combinables ; persistants entre sessions ; minimum : sans gluten, sans lactose, végétarien, vegan, sans noix

#### EF03 — Enregistrer / liker une recette

- **Acteur principal :** Utilisateur
- **Description :** L'utilisateur peut sauvegarder une recette en un geste (swipe ou bouton cœur) depuis le fil
- **Déclencheur :** Interaction sur la carte recette
- **Urgence :** Élevée
- **Criticité :** Critique
- **Règles :** Action réversible (unlike) ; recette accessible dans "Mes recettes" immédiatement ; synchronisation hors-ligne

#### EF04 — Consulter le détail d'une recette

- **Acteur principal :** Utilisateur
- **Description :** L'utilisateur peut ouvrir une recette pour voir ingrédients, étapes, temps de cuisson, macros
- **Déclencheur :** Tap sur une recette dans le fil ou dans "Mes recettes"
- **Urgence :** Élevée
- **Criticité :** Critique
- **Règles :** Affichage des macronutriments ; liste d'ingrédients avec quantités ajustables (nb de portions) ; étapes numérotées

#### EF05 — Créer un menu de la semaine

- **Acteur principal :** Utilisateur
- **Description :** L'utilisateur peut assigner des recettes enregistrées à des créneaux repas (matin, midi, soir) pour chaque jour de la semaine
- **Déclencheur :** Accès à l'onglet "Menu"
- **Urgence :** Élevée
- **Criticité :** Sévère
- **Règles :** Vue calendrier 7 jours ; drag & drop des recettes dans les créneaux ; possibilité d'avoir plusieurs recettes par créneau

#### EF06 — Générer la liste de courses

- **Acteur principal :** Utilisateur
- **Description :** Le système génère automatiquement une liste de courses consolidée à partir des recettes planifiées dans le menu de la semaine
- **Déclencheur :** Action "Générer la liste" depuis l'onglet Courses
- **Urgence :** Élevée
- **Criticité :** Critique
- **Règles :** Ingrédients regroupés par rayon (légumes, viandes, épicerie, produits frais…) ; quantités cumulées (ex : 3 recettes avec des tomates → 1 ligne "tomates — 600g") ; possibilité d'ajouter des articles manuellement ; cocher les articles au fur et à mesure

#### EF07 — Créer des recettes privées

- **Acteur principal :** Utilisateur
- **Description :** L'utilisateur peut créer ses propres recettes (titre, ingrédients, étapes, photo) visibles uniquement par lui
- **Déclencheur :** Bouton "+" dans "Mes recettes"
- **Urgence :** Moyenne
- **Criticité :** Pénalisante
- **Règles :** Formulaire avec : titre, description, temps préparation, temps cuisson, portions, ingrédients + quantités, étapes, photo optionnelle, allergènes déclarés, macros optionnels

#### EF08 — Inscription et connexion

- **Acteur principal :** Utilisateur
- **Description :** L'utilisateur peut créer un compte et se connecter pour persister ses données entre appareils
- **Déclencheur :** Premier lancement ou déconnexion
- **Urgence :** Élevée
- **Criticité :** Critique
- **Règles :** Inscription via email/mot de passe ou Apple/Google Sign-In ; connexion persistante (token) ; récupération de mot de passe par email

#### EF09 — Tutoriel d'onboarding

- **Acteur principal :** Utilisateur (nouvel)
- **Description :** L'application guide le nouvel utilisateur à travers les fonctionnalités clés au premier lancement
- **Déclencheur :** Premier lancement après inscription
- **Urgence :** Moyenne
- **Criticité :** Pénalisante
- **Règles :** Séquence de 4-5 écrans ; skippable ; réactivable depuis les paramètres ; collecte des préférences alimentaires initiales (allergènes, objectifs)

#### EF10 — Mode hors-ligne

- **Acteur principal :** Utilisateur
- **Description :** L'utilisateur peut consulter ses recettes enregistrées et sa liste de courses sans connexion internet
- **Déclencheur :** Perte de connexion réseau
- **Urgence :** Élevée
- **Criticité :** Sévère
- **Règles :** Recettes likées et menu de la semaine disponibles hors-ligne ; liste de courses modifiable hors-ligne avec sync à la reconnexion ; fil de découverte inactif hors-ligne (message explicatif)

#### EF11 — Recherche de recettes

- **Acteur principal :** Utilisateur
- **Description :** L'utilisateur peut rechercher des recettes par titre ou ingrédient principal
- **Déclencheur :** Accès à la barre de recherche
- **Urgence :** Moyenne
- **Criticité :** Pénalisante
- **Règles :** Recherche en temps réel (debounce 300 ms) ; résultats triables (popularité, temps de préparation) ; historique des recherches récentes

---

## IV. Exigences non-fonctionnelles

#### ENF01 — Disponibilité multi-plateforme

- **Description :** L'application est disponible sur iOS (≥ 15) et Android (≥ 10) via les stores officiels App Store et Google Play
- **Urgence :** Élevée
- **Criticité :** Critique

#### ENF02 — Performance du scroll

- **Description :** La transition entre deux recettes dans le fil doit être inférieure à 300 ms sur un réseau 4G
- **Urgence :** Élevée
- **Criticité :** Sévère

#### ENF03 — Temps de démarrage

- **Description :** L'application doit être prête à l'emploi en moins de 3 secondes sur un terminal moyen gamme (iPhone SE 2020, Samsung A52)
- **Urgence :** Moyenne
- **Criticité :** Pénalisante

#### ENF04 — Accessibilité — Daltonisme

- **Description :** L'interface utilise des indicateurs non-couleur (icônes, patterns) en complément des couleurs pour que les utilisateurs daltoniens puissent utiliser toutes les fonctionnalités
- **Urgence :** Moyenne
- **Criticité :** Mineure

#### ENF05 — Absence de publicité (V1)

- **Description :** Aucun affichage publicitaire en V1 ; l'expérience de scroll est non interrompue
- **Urgence :** Élevée
- **Criticité :** Sévère

#### ENF06 — Conformité RGPD

- **Description :** Les données personnelles (profil, préférences, historique) sont stockées de manière sécurisée, l'utilisateur peut demander leur suppression depuis l'application
- **Urgence :** Élevée
- **Criticité :** Critique

#### ENF07 — Maintenabilité

- **Description :** Le code source respecte une architecture modulaire permettant l'ajout de fonctionnalités V2 sans refactoring majeur ; couverture de tests ≥ 70 %
- **Urgence :** Moyenne
- **Criticité :** Pénalisante

#### ENF08 — Fiabilité

- **Description :** Disponibilité du service back-end ≥ 99,5 % (hors maintenance planifiée) ; la liste de courses ne peut pas être perdue
- **Urgence :** Élevée
- **Criticité :** Sévère

---

## V. Traçabilité des besoins métier

| Besoin métier | Exigences fonctionnelles | Exigences non-fonctionnelles |
|---------------|--------------------------|------------------------------|
| Découvrir des recettes facilement | EF01, EF11 | ENF02, ENF03, ENF05 |
| Filtrer selon ses contraintes alimentaires | EF02 | ENF04 |
| Enregistrer une recette en un geste | EF03 | ENF02 |
| Consulter le détail d'une recette | EF04 | ENF02 |
| Planifier ses repas de la semaine | EF05 | ENF08 |
| Générer automatiquement la liste de courses | EF06 | ENF08 |
| Créer ses propres recettes | EF07 | ENF06 |
| Accéder à ses données sans internet | EF10 | ENF08 |
| S'inscrire / se connecter de manière sécurisée | EF08 | ENF06 |
| Être guidé à la première utilisation | EF09 | ENF04 |
| Disponible sur son smartphone (iOS ou Android) | — | ENF01 |

---

## VI. Annexes

Voir `docs/Spécifications Fonctionnelles (Détaillée et Générale).pdf` :
- Mapping des tâches utilisateur (Karenn / Antoine)
- User stories V1 et V2 (board post-its)
- Diagramme UML des cas d'utilisation
- Processus métier PR1–PR7
