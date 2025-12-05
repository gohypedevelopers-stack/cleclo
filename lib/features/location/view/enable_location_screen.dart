import 'package:cleclo/components/custom_appbar.dart';
import 'package:cleclo/components/custom_elevated_button.dart';
import 'package:cleclo/components/custom_outlined_button.dart';
import 'package:cleclo/routes/route_constants.dart';
import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'widgets/custom_widgets.dart'; // where CustomElevatedButton lives

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({super.key});

  static const Color _green = Color(0xFF28A745);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Enable Location', showBackButton: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 8),

              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_back_ios, size: 18),
                        SizedBox(width: 4),
                        Text(
                          'Back',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'CleClo',
                    style: TextStyle(
                      color: _green,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 24),

              // Illustration + caption
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 230,
                      child: Center(
                        child: Image.asset(
                          'assets/images/location_illustration.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Quick Laundry Service in Your Area',
                      style: TextStyle(color: AppColors.gray700),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enable Location',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 8),

              // Description
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Location will be needed to order to personalise your\n'
                  'feed and show Laundries in your locality',
                  style: TextStyle(
                    color: AppColors.gray700,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Green primary button (uses your custom button)
              CustomElevatedButton(
                label: 'Enable Location',
                onPressed: () {
                  // TODO: ask for location permission
                  context.goNamed(RouteConstants.bottomNavBarScreen);
                },
              ),

              const SizedBox(height: 12),

              // Grey outlined "Skip For Now" pill
              CustomOutlinedButton(
                label: 'Skip For Now',
                onPressed: () {
                  // TODO: skip location
                  context.goNamed(RouteConstants.bottomNavBarScreen);
                },
              ),

              const SizedBox(height: 16),

              // Footer text
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text.rich(
                  TextSpan(
                    text: 'You can change location setting later in\nyour ',

                    style: TextStyle(color: AppColors.gray700, height: 1.4),
                    children: const [
                      TextSpan(
                        text: 'iPhone settings',
                        style: TextStyle(
                          color: _green,
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
