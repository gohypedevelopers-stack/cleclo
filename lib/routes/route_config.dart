import 'package:cleclo/features/auth/view/auth_welcome_screen.dart';
import 'package:cleclo/features/auth/view/register_screen.dart';
import 'package:cleclo/features/auth/view/register_send_otp.dart';
import 'package:cleclo/features/auth/view/verify_otp_screen.dart';
import 'package:cleclo/features/location/view/enable_location_screen.dart';
import 'package:cleclo/features/home/view/bottom_nav_bar.dart';
import 'package:cleclo/features/onboarding/view/onboarding_screen.dart';
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
    // GoRoute(
    //   path: RouteConstants.forgotPasswordScreen,
    //   name: RouteConstants.forgotPasswordScreen,
    //   builder: (context, state) => const ForgotPasswordPage(),
    // ),
    // GoRoute(
    //   path: RouteConstants.bottomNavBarScreen,
    //   name: RouteConstants.bottomNavBarScreen,
    //   builder: (context, state) => const BottomNavBar(),
    // ),
    // GoRoute(
    //   path: RouteConstants.doctorDetailsScreen,
    //   name: RouteConstants.doctorDetailsScreen,
    //   builder: (context, state) => const DoctorDetailsScreen(),
    // ),
    // GoRoute(
    //   path: RouteConstants.patientDetailsScreen,
    //   name: RouteConstants.patientDetailsScreen,
    //   builder: (context, state) => const PatientDetailsScreen(),
    // ),
    // GoRoute(
    //   path: RouteConstants.selectPackageScreen,
    //   name: RouteConstants.selectPackageScreen,
    //   builder: (context, state) => const SelectPackageScreen(),
    // ),
    // GoRoute(
    //   path: RouteConstants.placeAppointmentScreen,
    //   name: RouteConstants.placeAppointmentScreen,
    //   builder: (context, state) => const PlaceAppointmentScreen(),
    // ),
    // GoRoute(
    //   path: RouteConstants.paymentSuccessScreen,
    //   name: RouteConstants.paymentSuccessScreen,
    //   builder: (context, state) => const PaymentSuccessScreen(),
    // ),
    // GoRoute(
    //   path: RouteConstants.notificationsScreen,
    //   name: RouteConstants.notificationsScreen,
    //   builder: (context, state) => const NotificationsScreen(),
    // ),
    // GoRoute(
    //   path: RouteConstants.editProfileScreen,
    //   name: RouteConstants.editProfileScreen,
    //   builder: (context, state) => const EditProfileScreen(),
    // ),
    // GoRoute(
    //   path: RouteConstants.pharmacyHomeScreen,
    //   name: RouteConstants.pharmacyHomeScreen,
    //   builder: (context, state) => const PharmacyHomeScreen(),
    // ),
    // GoRoute(
    //   path: RouteConstants.pharmacyProductsDetailsScreen,
    //   name: RouteConstants.pharmacyProductsDetailsScreen,
    //   builder: (context, state) => const PharmacyProductsDetailsScreen(),
    // ),
    // GoRoute(
    //   path: RouteConstants.cartScreen,
    //   name: RouteConstants.cartScreen,
    //   builder: (context, state) => const CartScreen(),
    // ),
    // GoRoute(
    //   path: RouteConstants.chatScreen,
    //   name: RouteConstants.chatScreen,
    //   builder: (context, state) => const ChatScreen(),
    // ),
    // GoRoute(
    //   path: RouteConstants.chatImagePreviewScreen,
    //   name: RouteConstants.chatImagePreviewScreen,
    //   builder: (context, state) {
    //     final file = state.extra as File;
    //     return ChatImagePreviewScreen(image: file);
    //   },
    // ),
    GoRoute(
      path: RouteConstants.bottomNavBarScreen,
      name: RouteConstants.bottomNavBarScreen,
      builder: (context, state) => const BottomNavBar(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('404: Page not found (${state.uri.path})')),
  ),
);
