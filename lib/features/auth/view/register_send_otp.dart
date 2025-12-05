import 'package:cleclo/components/custom_appbar.dart';
import 'package:cleclo/components/custom_elevated_button.dart';
import 'package:cleclo/components/custom_textfeild.dart';
import 'package:cleclo/main.dart';
import 'package:cleclo/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// import your custom widgets file here
// import 'widgets/custom_widgets.dart';  // <- where CustomTextField & CustomElevatedButton live

class RegisterSendOtp extends StatelessWidget {
  const RegisterSendOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'Register', showBackButton: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // NAME LABEL
              Text(
                'Name',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),

              // === Custom TextField for NAME ===
              // Use your existing CustomTextField here.
              // If your widget supports prefixIcon, pass the person icon.
              CustomTextField(
                hint: 'your name',
                prefixIcon: const Icon(Icons.person_outline, size: 20),
                keyboardType: TextInputType.name,
              ),

              const SizedBox(height: 24),

              // PHONE LABEL
              Text(
                'Phone Number',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),

              // === Custom TextField for PHONE ===
              // To look like: "91+ 000 000 0000" we just put full hint text.
              // If your CustomTextField has prefixText, you can split it.
              CustomTextField(
                hint: '91+ 000 000 0000',
                keyboardType: TextInputType.phone,
                // prefixText: '91+ ',
              ),

              SizedBox(height: 40),

              // Terms text
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text.rich(
                    TextSpan(
                      text: 'By tapping "Register" you agree to our\n',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms of Use',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // === Custom Button (Register) ===
              CustomElevatedButton(
                width: screenWidth - 50,
                borderRadius: 50,
                label: 'Register',
                onPressed: () {
                  context.push(RouteConstants.verifyOtpScreen);
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
