# Spécifications Fonctionnelles Détaillées — CookScroll

**Équipe :** GAISNON Mathieu · MONTOUX Julie · CARION Paul · FARASSI Yassin  
**Version :** 1.0 — 2026-06-05  
**Statut :** En cours  
**Référence SFG :** `docs/SFG_CookScroll.md`

---

## I. Introduction

### Objectif du document

Ce document détaille les cas d'utilisation à fort investissement du MVP CookScroll. Tous les CU apparaissent dans la SFG, seuls les plus complexes sont détaillés ici : scroll + enregistrement, génération de liste de courses, et authentification.

### Contexte

CookScroll est une application mobile (iOS/Android) de découverte de recettes par scroll vertical avec génération automatique de liste de courses. Voir SFG pour le contexte complet.

### Périmètre de ce document

CU couverts (V1 / MVP) :
- **CU-01** : Scroller et enregistrer une recette
- **CU-02** : Générer la liste de courses
- **CU-03** : Inscription / Connexion utilisateur

---

## II. Documents de référence

| Document | Version | Localisation |
|----------|---------|--------------|
| SFG CookScroll | 1.1 | `docs/SFG_CookScroll.md` |
| Cahier des charges | 1.0 | `docs/Cahier_des_Charges_CookScroll.md` |
| Spécifications (PDF original) | — | `docs/Spécifications Fonctionnelles (Détaillée et Générale).pdf` |

---

## III. Les acteurs

- **Utilisateur** : personne disposant d'un compte CookScroll (ou mode invité limité)
- **Système CookScroll** : application mobile + API back-end
- **API Recettes** : service back-end fournissant le catalogue de recettes
- **Service Auth** : gestion des comptes (email/Apple/Google)

---

## IV. CU-01 : Scroller et enregistrer une recette

### Description succincte

L'utilisateur navigue verticalement dans le fil de recettes et peut enregistrer une recette en un geste.

**Acteur principal :** Utilisateur  
**Préconditions :** L'utilisateur a ouvert l'application (connecté ou mode invité)  
**Déclencheur :** Lancement de l'application, onglet Découverte actif  
**Résultats attendus :** L'utilisateur a scrollé le fil et optionnellement sauvegardé une ou plusieurs recettes dans "Mes recettes"

### V. Cas nominal

| # | Qui | Action |
|---|-----|--------|
| R1 | Système | Charge le fil de recettes (lot de 10, lazy load suivant) |
| R2 | Système | Affiche la première recette plein écran : photo/vidéo, titre, temps, macros résumés |
| R3 | Utilisateur | Scrolle vers le haut pour passer à la recette suivante |
| R4 | Système | Effectue la transition (< 300 ms), charge la recette suivante en arrière-plan |
| R5 | Utilisateur | Tape sur l'icône cœur (ou swipe droit) pour enregistrer la recette |
| R6 | Système | Ajoute la recette à "Mes recettes", affiche un feedback visuel (animation cœur) |
| R7 | Système | Synchronise l'enregistrement avec le back-end (ou file hors-ligne si pas de connexion) |
| R8 | Utilisateur | Continue de scroller |
| R9 | Fin du cas nominal | — |

### VI. Cas alternatif 1 — Consulter le détail avant d'enregistrer

**Acteur principal :** Utilisateur  
**Préconditions :** Recette visible dans le fil  
**Déclencheur :** Tap sur la zone centrale de la carte recette (hors boutons d'action)  
**Résultats attendus :** L'utilisateur consulte le détail et peut enregistrer depuis la vue détail

| # | Qui | Action |
|---|-----|--------|
| R1 | Utilisateur | Tape sur la carte recette (zone centrale) |
| R2 | Système | Ouvre la vue détail (bottom sheet ou écran dédié) : ingrédients, étapes, macros complets, portions ajustables |
| R3 | Utilisateur | Consulte le détail |
| R4 | Utilisateur | Tape "Enregistrer" dans la vue détail |
| R5 | Système | Ajoute à "Mes recettes", retour au fil à la même position |
| R6 | Fin du cas alternatif 1 | — |

### VII. Cas alternatif 2 — Appliquer un filtre avant de scroller

**Acteur principal :** Utilisateur  
**Préconditions :** Application ouverte  
**Déclencheur :** Tap sur l'icône filtre  
**Résultats attendus :** Le fil ne montre que les recettes correspondant aux filtres actifs

| # | Qui | Action |
|---|-----|--------|
| R1 | Utilisateur | Ouvre le panneau filtres |
| R2 | Système | Affiche les options : macronutriments (cible protéines/glucides/lipides), allergènes (gluten, lactose, noix, végétarien, vegan) |
| R3 | Utilisateur | Sélectionne un ou plusieurs filtres, valide |
| R4 | Système | Recharge le fil avec les recettes filtrées, affiche les filtres actifs en chips en haut du fil |
| R5 | Fin du cas alternatif 2 | — |

### VIII. Cas alternatif 3 — Mode hors-ligne

**Acteur principal :** Utilisateur  
**Préconditions :** Pas de connexion internet  
**Déclencheur :** Ouverture de l'application sans réseau  
**Résultats attendus :** L'utilisateur peut scroller dans les recettes déjà chargées

| # | Qui | Action |
|---|-----|--------|
| R1 | Système | Détecte absence de connexion, affiche bannière "Mode hors-ligne" |
| R2 | Système | Charge le fil depuis le cache local (recettes déjà vues) |
| R3 | Utilisateur | Scrolle dans les recettes mises en cache |
| R4 | Utilisateur | Enregistre une recette (action mise en file d'attente) |
| R5 | Système | À la reconnexion, synchronise les enregistrements en attente |
| R6 | Fin du cas alternatif 3 | — |

### IX. Exception 1 — Erreur de chargement du fil

**Description :** Le système ne peut pas charger de nouvelles recettes (API down, réseau dégradé)  
**Déclencheur :** R1 — échec de la requête API après 2 tentatives

| # | Qui | Action |
|---|-----|--------|
| E1 | Système | Affiche un message d'erreur non-bloquant "Impossible de charger de nouvelles recettes" |
| E2 | Système | Propose un bouton "Réessayer" |
| E3 | Utilisateur | Tape "Réessayer" ou patiente |
| E4 | Fin de l'exception 1 | — |

### XIV. Exigences non-fonctionnelles spécifiques

- Transition entre recettes < 300 ms (ENF02)
- Chargement des 10 premières recettes < 2 s sur 4G (ENF03)
- Fonctionnel hors-ligne sur recettes mises en cache (ENF08 / EF10)

---

## IV. CU-02 : Générer la liste de courses

### Description succincte

Le système génère automatiquement une liste de courses consolidée à partir des recettes planifiées dans le menu de la semaine.

**Acteur principal :** Utilisateur  
**Préconditions :** L'utilisateur a un compte actif et au moins une recette planifiée dans son menu de la semaine  
**Déclencheur :** Tap sur "Générer la liste" dans l'onglet Courses  
**Résultats attendus :** Une liste de courses complète, consolidée par rayon, est disponible et modifiable

### V. Cas nominal

| # | Qui | Action |
|---|-----|--------|
| R1 | Utilisateur | Ouvre l'onglet "Courses" |
| R2 | Système | Affiche le menu de la semaine en résumé (recettes planifiées par jour) |
| R3 | Utilisateur | Tape "Générer la liste de courses" |
| R4 | Système | Agrège tous les ingrédients des recettes planifiées |
| R5 | Système | Consolide les doublons (même ingrédient dans plusieurs recettes → cumul des quantités) |
| R6 | Système | Regroupe par rayon : Fruits & légumes / Viandes & poissons / Produits laitiers / Épicerie sèche / Boissons / Surgelés / Autres |
| R7 | Système | Affiche la liste consolidée |
| R8 | Utilisateur | Consulte la liste, coche les articles achetés, ajoute des articles manuellement |
| R9 | Fin du cas nominal | — |

### VI. Cas alternatif 1 — Ajuster les portions avant génération

**Acteur principal :** Utilisateur  
**Déclencheur :** Modification du nombre de portions pour une recette planifiée  
**Résultats attendus :** Les quantités dans la liste reflètent les portions ajustées

| # | Qui | Action |
|---|-----|--------|
| R1 | Utilisateur | Dans la vue menu, tape sur une recette planifiée |
| R2 | Système | Affiche les options : modifier les portions (- / +) |
| R3 | Utilisateur | Ajuste le nombre de portions |
| R4 | Système | Met à jour l'affichage des macros pour cette recette |
| R5 | Utilisateur | Génère la liste → quantités proportionnelles aux portions choisies |
| R6 | Fin du cas alternatif 1 | — |

### VII. Cas alternatif 2 — Ajouter un article manuel

**Acteur principal :** Utilisateur  
**Déclencheur :** Tap sur "+ Ajouter un article" dans la liste  
**Résultats attendus :** L'article est ajouté dans la catégorie "Autres" (ou celle choisie)

| # | Qui | Action |
|---|-----|--------|
| R1 | Utilisateur | Tape "+ Ajouter un article" |
| R2 | Système | Ouvre un champ texte avec suggestion de rayon |
| R3 | Utilisateur | Saisit le nom de l'article, valide |
| R4 | Système | Ajoute l'article à la liste dans le bon rayon |
| R5 | Fin du cas alternatif 2 | — |

### VIII. Cas alternatif 3 — Aucune recette planifiée

**Acteur principal :** Utilisateur  
**Préconditions :** Menu de la semaine vide  
**Déclencheur :** Tap sur "Générer la liste" sans recettes planifiées

| # | Qui | Action |
|---|-----|--------|
| R1 | Système | Affiche message : "Vous n'avez pas encore planifié de recettes cette semaine" |
| R2 | Système | Propose un CTA "Planifier des recettes" qui redirige vers le menu |
| R3 | Fin du cas alternatif 3 | — |

### IX. Exception 1 — Ingrédient sans unité reconnue

**Description :** Un ingrédient d'une recette n'a pas d'unité standardisée (ex : "1 pincée de sel", "au goût")  
**Déclencheur :** R4–R5 — lors de la consolidation

| # | Qui | Action |
|---|-----|--------|
| E1 | Système | Affiche l'ingrédient tel quel, sans cumul |
| E2 | Système | Ajoute une note "Vérifier la quantité" sur cet article |
| E3 | Fin de l'exception 1 | — |

### XIV. Exigences non-fonctionnelles spécifiques

- Génération de la liste < 2 s pour 21 repas (ENF02)
- Liste sauvegardée localement, récupérable hors-ligne (ENF08)
- Données de liste non perdues en cas de crash (ENF08)

---

## IV. CU-03 : Inscription et connexion utilisateur

### Description succincte

L'utilisateur crée un compte ou se connecte pour accéder à ses données personnelles (recettes enregistrées, menu, liste de courses).

**Acteur principal :** Utilisateur  
**Préconditions :** L'application est installée  
**Déclencheur :** Premier lancement ou déconnexion volontaire  
**Résultats attendus :** L'utilisateur est authentifié et accède à son espace personnel

### V. Cas nominal — Inscription email

| # | Qui | Action |
|---|-----|--------|
| R1 | Système | Affiche l'écran d'accueil avec options : "S'inscrire avec email", "Continuer avec Apple", "Continuer avec Google" |
| R2 | Utilisateur | Choisit "S'inscrire avec email" |
| R3 | Système | Affiche le formulaire : email, mot de passe (min 8 caractères, 1 chiffre), confirmation |
| R4 | Utilisateur | Remplit et valide |
| R5 | Système | Valide le format email et la force du mot de passe |
| R6 | Système | Envoie un email de vérification |
| R7 | Système | Crée le profil et redirige vers l'onboarding (EF09) |
| R8 | Fin du cas nominal | — |

### VI. Cas alternatif 1 — Connexion avec compte existant

**Déclencheur :** Tap "Se connecter" depuis l'écran d'accueil

| # | Qui | Action |
|---|-----|--------|
| R1 | Utilisateur | Saisit email + mot de passe |
| R2 | Système | Vérifie les credentials via le service Auth |
| R3 | Système | Génère un token de session persistant |
| R4 | Système | Redirige vers le fil de recettes |
| R5 | Fin du cas alternatif 1 | — |

### VII. Cas alternatif 2 — Connexion Apple/Google

**Déclencheur :** Tap "Continuer avec Apple" ou "Continuer avec Google"

| # | Qui | Action |
|---|-----|--------|
| R1 | Système | Ouvre le flux OAuth du provider choisi |
| R2 | Utilisateur | S'authentifie sur le provider |
| R3 | Système | Reçoit le token, crée ou récupère le compte CookScroll associé |
| R4 | Système | Redirige vers onboarding (nouveau compte) ou fil de recettes (compte existant) |
| R5 | Fin du cas alternatif 2 | — |

### VIII. Exception 1 — Email déjà utilisé

**Déclencheur :** R5 — email existe déjà en base

| # | Qui | Action |
|---|-----|--------|
| E1 | Système | Affiche "Cet email est déjà associé à un compte. Se connecter ?" |
| E2 | Utilisateur | Choisit "Se connecter" ou "Mot de passe oublié" |
| E3 | Fin de l'exception 1 | — |

### IX. Exception 2 — Mot de passe oublié

**Déclencheur :** Tap "Mot de passe oublié" depuis l'écran de connexion

| # | Qui | Action |
|---|-----|--------|
| E1 | Utilisateur | Saisit son email |
| E2 | Système | Envoie un email de réinitialisation (lien valide 1 heure) |
| E3 | Utilisateur | Clique le lien, saisit un nouveau mot de passe |
| E4 | Système | Met à jour le mot de passe, invalide les sessions actives |
| E5 | Fin de l'exception 2 | — |

### XIV. Exigences non-fonctionnelles spécifiques

- Mots de passe stockés hashés (bcrypt ou Argon2) — jamais en clair (ENF06)
- Token de session JWT, expiration 30 jours (renouvellement silencieux) (ENF06)
- Conformité RGPD : l'utilisateur peut supprimer son compte et toutes ses données depuis les paramètres (ENF06)

---

## XV. Traçabilité des besoins métier

| Besoin métier | CU détaillé | Règles |
|---------------|-------------|--------|
| Découvrir des recettes sans friction | CU-01 (cas nominal) | R1–R9 |
| Filtrer selon ses préférences | CU-01 (alternatif 2) | R1–R5 |
| Accéder aux recettes hors-ligne | CU-01 (alternatif 3) | R1–R6 |
| Obtenir une liste de courses automatique | CU-02 (cas nominal) | R1–R9 |
| Personnaliser les portions | CU-02 (alternatif 1) | R1–R6 |
| Créer un compte sécurisé | CU-03 (cas nominal) | R1–R8 |
| Se connecter rapidement (SSO) | CU-03 (alternatif 2) | R1–R5 |

---

## XVI. Annexes

À compléter avec les maquettes UI (wireframes) et le modèle de données (schéma BDD).
