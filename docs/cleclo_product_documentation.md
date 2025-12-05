# Cleclo Mobile Platform Documentation

## 1. Project Overview
Cleclo is a Flutter-based cross-platform application that connects customers with curated laundry and dry-cleaning partners. The current codebase focuses on onboarding, authentication funnel, and location enablement for new users. The long-term vision is to support a three-sided ecosystem (customers, vendors, admins) with real-time order tracking, digital payments, analytics, and scalable operations.

## 2. Technology Stack
- **Client:** Flutter (Android, iOS, Web, Desktop shells scaffolded)
- **State Management:** Provider (`OnboardingProvider`)
- **Routing:** `go_router`
- **UI Toolkit:** Material 3 baseline with custom components in `lib/components`
- **Design Assets:** Stored in `assets/images` with references defined in `lib/utils/images/images.dart`
- **Theming:** Centralized colors in `lib/utils/theme/colors.dart`
- **Backend (planned):** Node.js services with Firebase or MongoDB persistence, exposed through REST/GraphQL APIs
- **Admin Panel (planned):** React/Next.js consuming the same backend APIs

## 3. Codebase Structure
```
lib/
 ├── common/                # (Reserved for shared utilities)
 ├── components/            # Reusable UI widgets (buttons, app bar, inputs)
 ├── features/
 │    ├── onboarding/       # PageView-driven intro carousel
 │    ├── auth/             # Registration + OTP verification screens
 │    └── location/         # Permission education & enablement screen
 ├── routes/                # `RouteConstants` and `GoRouter` configuration
 ├── utils/                 # Theme colors and asset references
 └── main.dart              # App entry point, Provider & router wiring
```

### Key Entry Points
- `lib/main.dart`: Initializes `MultiProvider`, sets `MaterialApp.router`, and exposes global `screenWidth`/`screenHeight`.
- `lib/routes/route_config.dart`: Central router with named routes for onboarding, auth, and location flows.
- `lib/components/*`: `CustomAppBar`, `CustomElevatedButton`, `CustomOutlinedButton`, and `CustomTextField` provide consistent brand styling.

## 4. UX Flow & Feature Breakdown

### 4.1 Onboarding (`OnboardingScreen`)
- Two-slide `PageView` with illustrations (`Images.onboarding1`, `Images.onboarding2`) and playful marketing copy.
- `SmoothPageIndicator` exposes progress, while `Skip` and `Next` buttons handle navigation.
- `OnboardingProvider` manages page state and transitions to the authentication welcome screen once onboarding is complete or skipped.

### 4.2 Authentication Funnel
1. **Auth Welcome (`AuthWelcomeScreen`):** Highlights the value prop, offers sign-up and phone-login CTAs, social login placeholders, and a `CustomAppBar`.
2. **Register (Send OTP) (`RegisterSendOtp`):** Collects name and phone number using `CustomTextField`, then routes to the OTP verification screen via `RouteConstants.verifyOtpScreen`.
3. **Verify OTP (`VerifyOtpScreen`):** Placeholder UI to capture a 6-digit OTP with timer/resend interactions (implementation pending).
4. **Full Registration (`RegisterScreen`):** Additional profile details post-OTP (implementation pending).

### 4.3 Location Enablement (`EnableLocationScreen`)
- Educates the user on why location access is required and supports enable/skip actions via the custom button set.
- Currently references a placeholder illustration (`assets/images/location_illustration.png`) and awaits integration with `permission_handler` or platform channels.

## 5. State, Routing, and Navigation
- **State:** Providers are registered inside `MultiProvider` in `main.dart`. Only `OnboardingProvider` exists today, but the pattern scales to authentication, profile, and order contexts.
- **Routing:** All navigations should use `GoRouter` names from `RouteConstants` to preserve deep linking and web compatibility. Example: `context.pushNamed(RouteConstants.authWelcomeScreen)`.
- **Global Layout:** `screenWidth` and `screenHeight` are captured once in `MyApp.build()` and reused by widgets needing viewport-aware sizing.

## 6. Theming, Assets, and Localization
- `AppColors` defines palette constants (primary green `0xFF1FA245`, grays, etc.). Prefer referencing these instead of raw hex values.
- Image paths live in `lib/utils/images/images.dart`; adding assets requires:
  1. Storing the file under `assets/images`.
  2. Declaring the path in `pubspec.yaml`.
  3. Exposing it through the `Images` helper for discoverability.
- `flutter_localizations` is not yet enabled. Future localization work should activate it in `MaterialApp.router`.

## 7. Build & Run Instructions
1. Install Flutter 3.24+ (stable channel recommended).
2. Fetch dependencies: `flutter pub get`.
3. Run on Android emulator/device: `flutter run -d android`.
4. Run on iOS simulator: `flutter run -d ios` (requires Xcode setup).
5. Web preview: `flutter run -d chrome`.
6. Automated test (sample widget test): `flutter test`.

> _Tip:_ If you encounter Gradle wrapper version mismatches, sync using `flutter clean && flutter pub get` before re-running builds.

## 8. API & Data Layer Plan
| Concern | Current State | Next Steps |
| --- | --- | --- |
| Authentication | UI only | Integrate OTP backend (Firebase Auth or custom SMS provider). Add token storage via `flutter_secure_storage`. |
| Orders | Not implemented | Define REST models: Order, Service, Slot, Payment. Generate API clients via `retrofit` or `dio`. |
| Payments | Placeholder | Integrate Razorpay/Stripe SDKs per platform. Handle `UPI`, cards, wallets, and COD exceptions. |
| Notifications | Not implemented | Configure Firebase Cloud Messaging plus topic subscriptions per user role. |
| Analytics | Not instrumented | Add `firebase_analytics` or Segment to capture funnel metrics. |

## 9. Delivery Roadmap

| Phase | Weeks | Goals |
| --- | --- | --- |
| **Phase 1 – Foundation** | 1–4 | Finalize UI/UX, connect onboarding → auth → location → home skeleton, implement pickup/delivery workflow with COD fallback, bootstrap admin web dashboard shell. |
| **Phase 2 – Experience** | 5–8 | Online payments, coupons, ratings/reviews, vendor earnings dashboard, push notifications, polish UI and harden QA. |
| **Phase 3 – Scalability** | 9–12 | Expand catalog (weight-based laundry, shoes, curtains), add route optimization, advanced analytics, and enterprise reporting. Deliver deployment playbooks plus 30-day hypercare. |

## 10. Future Enhancements & Open Tasks
- Wire real backend services (authentication, orders, location, payments).
- Implement vendor/admin-specific apps sharing design system components.
- Add state restoration and persistence for onboarding skip state.
- Replace placeholder copy/assets with localized content.
- Improve accessibility (contrast, semantic labels, larger tap targets).
- Expand test coverage (unit tests for providers, golden tests for critical screens).

---
This document should evolve with the product. Update it whenever new features ship, APIs change, or architecture decisions are made to keep onboarding friction low for future contributors.



