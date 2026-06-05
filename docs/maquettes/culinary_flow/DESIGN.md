---
name: Culinary Flow
colors:
  surface: '#f4fafd'
  surface-dim: '#d4dbdd'
  surface-bright: '#f4fafd'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eef5f7'
  surface-container: '#e8eff1'
  surface-container-high: '#e2e9ec'
  surface-container-highest: '#dde4e6'
  on-surface: '#161d1f'
  on-surface-variant: '#584140'
  inverse-surface: '#2b3234'
  inverse-on-surface: '#ebf2f4'
  outline: '#8c706f'
  outline-variant: '#e0bfbd'
  surface-tint: '#ae2f34'
  primary: '#ae2f34'
  on-primary: '#ffffff'
  primary-container: '#ff6b6b'
  on-primary-container: '#6d0010'
  inverse-primary: '#ffb3b0'
  secondary: '#8f4e00'
  on-secondary: '#ffffff'
  secondary-container: '#fc9d41'
  on-secondary-container: '#6b3900'
  tertiary: '#006a65'
  on-tertiary: '#ffffff'
  tertiary-container: '#1eada5'
  on-tertiary-container: '#003a37'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#ffdad8'
  primary-fixed-dim: '#ffb3b0'
  on-primary-fixed: '#410006'
  on-primary-fixed-variant: '#8c1520'
  secondary-fixed: '#ffdcc2'
  secondary-fixed-dim: '#ffb77a'
  on-secondary-fixed: '#2e1500'
  on-secondary-fixed-variant: '#6d3a00'
  tertiary-fixed: '#7cf6ec'
  tertiary-fixed-dim: '#5dd9d0'
  on-tertiary-fixed: '#00201e'
  on-tertiary-fixed-variant: '#00504c'
  background: '#f4fafd'
  on-background: '#161d1f'
  surface-variant: '#dde4e6'
typography:
  display-lg:
    fontFamily: Montserrat
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Montserrat
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
  headline-sm:
    fontFamily: Montserrat
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-sm:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-lg:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 16px
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
  display-lg-mobile:
    fontFamily: Montserrat
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 36px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  container-margin: 20px
  gutter: 16px
---

## Brand & Style

The design system is built for a fast-paced yet inviting social cooking experience. The brand personality is **energetic, warm, and helpful**, designed to feel like a modern kitchen companion rather than a static cookbook. 

The aesthetic follows a **Modern / Tactile** approach. It leverages high-quality food photography as the primary interface element, using clean layouts and generous whitespace to prevent visual clutter. The UI evokes an emotional response of culinary inspiration and community belonging, utilizing soft elevation and vibrant accents to guide the user through a seamless vertical discovery feed.

## Colors

The color palette is anchored by **Vibrant Coral**, used for primary actions, branding, and high-impact states. **Warm Orange** serves as a functional accent for difficulty levels, highlights, and secondary calls to action, maintaining a cohesive "warm kitchen" temperature.

The background uses a slightly off-white **#FAFAFA** to reduce glare and provide a soft canvas for recipe cards. Interactive surfaces are pure white. For text, **Deep Slate** is utilized to ensure AAA accessibility and high legibility against light backgrounds, while a muted version of this slate is used for secondary metadata.

## Typography

This design system utilizes a dual-font strategy to balance character with utility. **Montserrat** is the voice of the brand—used for headlines and titles to provide a bold, friendly, and geometric presence. **Inter** handles all body copy, ingredients, and instructions, chosen for its exceptional readability on mobile displays and systematic feel.

For mobile-first vertical scrolling, headings are kept tight with slightly negative letter spacing to allow recipe names to be prominent without breaking into too many lines. Labels use a medium weight for clarity in metadata like "Prep Time" or "Calories."

## Layout & Spacing

The design system employs a **Fluid Grid** model optimized for edge-to-edge mobile experiences. The primary layout for the recipe feed is a full-bleed vertical scroll where the "safe area" for UI overlays is defined by a **20px container margin**.

A 4px baseline grid ensures vertical rhythm. Elements are spaced in multiples of 8px to maintain consistency. On tablet viewports, the content transitions to a 2-column masonry grid to maximize screen real estate while keeping the "scroll-to-discover" feel intact.

## Elevation & Depth

Hierarchy is established through **Tonal Layers** and **Ambient Shadows**. 
1. **The Base:** The #FAFAFA background sits at the lowest level.
2. **The Card:** White surfaces use a soft, wide-dispersion shadow (0px 8px 24px rgba(0,0,0,0.06)) to appear lifted.
3. **The Overlay:** For text over images, the system uses "Glassmorphic" scrims—semi-transparent dark gradients (bottom-to-top) or background blurs (20px) to ensure text legibility without obscuring the food photography.
4. **The Interaction:** Buttons use a more pronounced shadow when active to provide tactile feedback.

## Shapes

The shape language is defined by **large, friendly radii**. Primary cards and recipe containers utilize a **16px (rounded-lg)** or **24px (rounded-xl)** corner radius to feel approachable and modern. 

Functional elements like allergen badges, difficulty tags, and primary action buttons are strictly **Pill-shaped**, creating a clear distinction between "containers" (rectilinear) and "interactive/informational tokens" (circular ends).

## Components

- **Primary Buttons:** Pill-shaped, high-contrast using the Vibrant Coral background with white text. They should have a subtle inner glow or gradient to feel "tasty."
- **Recipe Cards:** Edge-to-edge for the main feed, or 16px-padded cards for search results. They always feature a subtle shadow and a bottom-aligned text scrim.
- **Pill Chips:** Small, secondary-colored (#FF9F43) or neutral-colored backgrounds with tight 12px horizontal padding for tags like "Vegan" or "Under 20 mins."
- **Input Fields:** Soft-gray backgrounds with 12px corner radius and no border, focusing on a clean, modern look.
- **Progress Indicators:** A thin, orange bar at the top of the screen during recipe walkthroughs to track steps.
- **Icons:** 2px stroke weight, rounded terminals, and "broken" paths to match the modern, elegant typography style.
- **Interactive Layers:** Heart (like) and Bookmark buttons should be semi-transparent circles with glassmorphism blurs when placed over images.