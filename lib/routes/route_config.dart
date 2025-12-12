import 'package:cleclo/features/auth/view/auth_welcome_screen.dart';
import 'package:cleclo/features/auth/view/login_screen.dart';
import 'package:cleclo/features/auth/view/forgot_password_screen.dart';
import 'package:cleclo/features/auth/view/create_new_password_screen.dart';
import 'package:cleclo/features/auth/view/register_screen.dart';
import 'package:cleclo/features/auth/view/register_send_otp.dart';
import 'package:cleclo/features/auth/view/verify_otp_screen.dart';
import 'package:cleclo/features/home/view/book_service_screen.dart';
import 'package:cleclo/features/location/view/enable_location_screen.dart';
import 'package:cleclo/features/home/view/bottom_nav_bar.dart';
import 'package:cleclo/features/onboarding/view/onboarding_screen.dart';
import 'package:cleclo/features/home/view/write_review_screen.dart';
import 'package:cleclo/features/home/view/track_order_screen.dart';
import 'package:cleclo/features/home/view/order_details_screen.dart';
import 'package:cleclo/features/home/view/cancellation_successful_screen.dart';
import 'package:cleclo/features/home/view/your_collection_screen.dart';
import 'package:cleclo/features/home/view/upload_image_screen.dart';
import 'package:cleclo/features/home/view/confirm_photo_screen.dart';
import 'package:cleclo/features/home/view/your_selection_screen.dart';
import 'package:cleclo/features/home/view/confirm_service_details_screen.dart';
import 'package:cleclo/features/home/view/pickup_and_delivery_address_screen.dart';
import 'package:cleclo/features/home/view/choose_location_screen.dart';
import 'package:cleclo/features/home/view/pickup_and_delivery_schedule_screen.dart';
import 'package:cleclo/features/home/view/review_order_screen.dart';
import 'package:cleclo/features/home/view/payment_screen.dart';
import 'package:cleclo/features/home/view/booking_success_screen.dart';
import 'package:cleclo/features/home/view/edit_profile_screen.dart';
import 'package:cleclo/features/home/view/wallet_screen.dart';
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
      path: RouteConstants.loginScreen,
      name: RouteConstants.loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RouteConstants.forgotPasswordScreen,
      name: RouteConstants.forgotPasswordScreen,
      builder: (context, state) {
        final email = state.uri.queryParameters['email'] ?? 'sample@example.com';
        return ForgotPasswordScreen(email: email);
      },
    ),
    GoRoute(
      path: RouteConstants.createNewPasswordScreen,
      name: RouteConstants.createNewPasswordScreen,
      builder: (context, state) => const CreateNewPasswordScreen(),
    ),
    GoRoute(
      path: RouteConstants.enableLocationScreen,
      name: RouteConstants.enableLocationScreen,
      builder: (context, state) => const EnableLocationScreen(),
    ),
    GoRoute(
      path: RouteConstants.bookServiceScreen,
      name: RouteConstants.bookServiceScreen,
      builder: (context, state) {
        final category = state.uri.queryParameters['category'] ?? 'Women';
        return BookServiceScreen(initialCategory: category);
      },
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
    GoRoute(
      path: RouteConstants.orderDetailsScreen,
      name: RouteConstants.orderDetailsScreen,
      builder: (context, state) => const OrderDetailsScreen(),
    ),
    GoRoute(
      path: RouteConstants.cancellationSuccessfulScreen,
      name: RouteConstants.cancellationSuccessfulScreen,
      builder: (context, state) => const CancellationSuccessfulScreen(),
    ),
    GoRoute(
      path: RouteConstants.yourCollectionScreen,
      name: RouteConstants.yourCollectionScreen,
      builder: (context, state) {
        final selectedItems = state.extra as List<Map<String, dynamic>>? ?? [];
        return YourCollectionScreen(selectedItems: selectedItems);
      },
    ),
    GoRoute(
      path: RouteConstants.uploadImageScreen,
      name: RouteConstants.uploadImageScreen,
      builder: (context, state) => const UploadImageScreen(),
    ),
    GoRoute(
      path: RouteConstants.confirmPhotoScreen,
      name: RouteConstants.confirmPhotoScreen,
      builder: (context, state) => const ConfirmPhotoScreen(),
    ),
    GoRoute(
      path: RouteConstants.yourSelectionScreen,
      name: RouteConstants.yourSelectionScreen,
      builder: (context, state) => const YourSelectionScreen(),
    ),
    GoRoute(
      path: RouteConstants.confirmServiceDetailsScreen,
      name: RouteConstants.confirmServiceDetailsScreen,
      builder: (context, state) => const ConfirmServiceDetailsScreen(),
    ),
    GoRoute(
      path: RouteConstants.pickupAndDeliveryAddressScreen,
      name: RouteConstants.pickupAndDeliveryAddressScreen,
      builder: (context, state) => const PickupAndDeliveryAddressScreen(),
    ),
    GoRoute(
      path: RouteConstants.chooseLocationScreen,
      name: RouteConstants.chooseLocationScreen,
      builder: (context, state) => const ChooseLocationScreen(),
    ),
    GoRoute(
      path: RouteConstants.pickupAndDeliveryScheduleScreen,
      name: RouteConstants.pickupAndDeliveryScheduleScreen,
      builder: (context, state) => const PickupAndDeliveryScheduleScreen(),
    ),
    GoRoute(
      path: RouteConstants.reviewOrderScreen,
      name: RouteConstants.reviewOrderScreen,
      builder: (context, state) => const ReviewOrderScreen(),
    ),
    GoRoute(
      path: RouteConstants.paymentScreen,
      name: RouteConstants.paymentScreen,
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: RouteConstants.bookingSuccessScreen,
      name: RouteConstants.bookingSuccessScreen,
      builder: (context, state) => const BookingSuccessScreen(),
    ),
    GoRoute(
      path: RouteConstants.editProfileScreen,
      name: RouteConstants.editProfileScreen,
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: RouteConstants.walletScreen,
      name: RouteConstants.walletScreen,
      builder: (context, state) => const WalletScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('404: Page not found (${state.uri.path})')),
  ),
);
