import 'package:cleclo/components/custom_appbar.dart';
import 'package:cleclo/components/custom_elevated_button.dart';
import 'package:cleclo/components/custom_textfeild.dart';
import 'package:cleclo/main.dart';
import 'package:cleclo/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import your custom widgets file
// import 'widgets/custom_widgets.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF28A745); // same CleClo green

    return Scaffold(
      appBar: CustomAppBar(title: 'Verify OTP', showBackButton: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              const Text(
                'Register',
                style: TextStyle(
                  color: green,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),

              // Description
              const Text(
                'We have sent an email to your email\n'
                'account with a verification code!',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 32),

              // Label
              const Text(
                'Verification Code',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              // === Your existing custom textfield ===
              CustomTextField(
                hint: 'EX: 123456',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 20),

              // === Your existing custom button ===
              CustomElevatedButton(
                width: screenWidth,
                borderRadius: 50,
                label: 'Register',
                onPressed: () {
                  context.push(RouteConstants.registerScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
