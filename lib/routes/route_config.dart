import 'package:cleclo/features/auth/view/auth_welcome_screen.dart';
import 'package:cleclo/features/auth/view/register_screen.dart';
import 'package:cleclo/features/auth/view/register_send_otp.dart';
import 'package:cleclo/features/auth/view/verify_otp_screen.dart';
import 'package:cleclo/features/home/view/book_service_screen.dart';
import 'package:cleclo/features/location/view/enable_location_screen.dart';
import 'package:cleclo/features/home/view/bottom_nav_bar.dart';
import 'package:cleclo/features/onboarding/view/onboarding_screen.dart';
import 'package:cleclo/features/home/view/write_review_screen.dart';
import 'package:cleclo/features/home/view/track_order_screen.dart';
import 'package:cleclo/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteConstants.onboardingScreen,

  routes: [
    GoRoute(
      path: RouteConstants.onboardingScreen,
      name: RouteConstants.onboardingScreen,
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: RouteConstants.authWelcomeScreen,
      name: RouteConstants.authWelcomeScreen,
      builder: (context, state) => const AuthWelcomeScreen(),
    ),
    GoRoute(
      path: RouteConstants.registerSendOtp,
      name: RouteConstants.registerSendOtp,
      builder: (context, state) => const RegisterSendOtp(),
    ),
    GoRoute(
      path: RouteConstants.verifyOtpScreen,
      name: RouteConstants.verifyOtpScreen,
      builder: (context, state) => const VerifyOtpScreen(),
    ),
    GoRoute(
      path: RouteConstants.registerScreen,
      name: RouteConstants.registerScreen,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: RouteConstants.enableLocationScreen,
      name: RouteConstants.enableLocationScreen,
      builder: (context, state) => const EnableLocationScreen(),
    ),
    GoRoute(
      path: RouteConstants.bookServiceScreen,
      name: RouteConstants.bookServiceScreen,
      builder: (context, state) => const BookServiceScreen(),
    ),
    GoRoute(
      path: RouteConstants.bottomNavBarScreen,
      name: RouteConstants.bottomNavBarScreen,
      builder: (context, state) => const BottomNavBar(),
    ),
    GoRoute(
      path: RouteConstants.writeReviewScreen,
      name: RouteConstants.writeReviewScreen,
      builder: (context, state) => const WriteReviewScreen(),
    ),
    GoRoute(
      path: RouteConstants.trackOrderScreen,
      name: RouteConstants.trackOrderScreen,
      builder: (context, state) => const TrackOrderScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('404: Page not found (${state.uri.path})')),
  ),
);
