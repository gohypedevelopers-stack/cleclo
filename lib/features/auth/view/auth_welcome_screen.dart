import 'package:cleclo/components/custom_appbar.dart';
import 'package:cleclo/components/custom_elevated_button.dart';
import 'package:cleclo/components/custom_outlined_button.dart';
import 'package:cleclo/features/auth/components/socian_circle.dart';
import 'package:cleclo/main.dart';
import 'package:cleclo/routes/route_constants.dart';
import 'package:cleclo/utils/images/images.dart';
import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthWelcomeScreen extends StatelessWidget {
  const AuthWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 8),
              // Top bar
              CustomAppBar(),

              const SizedBox(height: 32),

              // Illustration
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 220,
                      width: screenWidth,
                      child: Center(
                        child: Stack(
                          children: [
                            Image.asset(
                              Images.onboardingbg,
                              fit: BoxFit.contain,
                            ),
                            Image.asset(
                              Images.authWelcome,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Effortless Laundry, Every Time',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Custom Sign up button
              CustomElevatedButton(
                width: screenWidth - 50,
                borderRadius: 50,
                label: 'Sign up',
                onPressed: () {
                  context.pushNamed(RouteConstants.registerSendOtp);
                },
              ),

              const SizedBox(height: 12),

              CustomOutlinedButton(
                label: 'Phone Number',
                onPressed: () {},

                width: screenWidth - 50,
                borderRadius: 50,
              ),

              const SizedBox(height: 16),

              // Login text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: theme.textTheme.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: navigate to login
                    },
                    child: Text(
                      'Login',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // OR divider
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 0.8)),
                  const SizedBox(width: 8),
                  Text(
                    'or',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(child: Divider(thickness: 0.8)),
                ],
              ),

              const SizedBox(height: 16),

              // Social login row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SocialCircle(image: Images.appleLogo),
                  SizedBox(width: 24),
                  SocialCircle(image: Images.googleLogo),
                  SizedBox(width: 24),
                  SocialCircle(image: Images.facebookLogo),
                ],
              ),

              const SizedBox(height: 24),

              // Footer text
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text.rich(
                  TextSpan(
                    text: 'You can change location setting later in your ',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(
                        text: 'iPhone settings',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
