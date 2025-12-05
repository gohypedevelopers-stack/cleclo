import 'package:cleclo/components/custom_appbar.dart';
import 'package:cleclo/features/onboarding/provider/onboarding_provider.dart';
import 'package:cleclo/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();
    const totalPages = 2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(arrowBack: provider.currentPage != 0 ? true : false),
            // PageView
            Expanded(
              child: PageView(
                controller: provider.pageController,
                onPageChanged: provider.onPageChanged,
                children: const [
                  _OnboardingPage(
                    imagePath: Images.onboarding1,
                    backgroundImage: Images.onboardingbg,
                    title: "We’re the besties of laundry peoples!",
                    subtitle:
                        "We use nitro on bicycles for delivery... just kidding, but we’re seriously fast",
                  ),
                  _OnboardingPage(
                    backgroundImage: Images.onboardingbg,
                    imagePath: Images.onboarding2,
                    title: "We’re the besties of fresh, clean outfits!",
                    subtitle:
                        "Nitro on bicycles? Maybe not, but our deliveries are lightning fast",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Dots indicator
            SmoothPageIndicator(
              controller: provider.pageController,
              count: totalPages,
              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 8,
                activeDotColor: Color(0xFF1FA245),
                dotColor: Color(0xFFD7E7D9),
              ),
            ),

            const SizedBox(height: 24),

            // Bottom buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => provider.skip(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Color(0xFF1FA245)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Color(0xFF1FA245),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => provider.nextPage(totalPages, context),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: const Color(0xFF1FA245),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String backgroundImage;
  final String title;
  final String subtitle;

  const _OnboardingPage({
    required this.imagePath,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 16),
          // Illustration
          Expanded(
            child: Center(
              child: Stack(
                children: [
                  Image.asset(backgroundImage, fit: BoxFit.contain),
                  Image.asset(imagePath, fit: BoxFit.contain),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 8),

          // Subtitle
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
