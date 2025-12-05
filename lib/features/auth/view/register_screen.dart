import 'package:cleclo/components/custom_appbar.dart';
import 'package:cleclo/components/custom_elevated_button.dart';
import 'package:cleclo/components/custom_textfeild.dart';
import 'package:cleclo/main.dart';
import 'package:cleclo/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import your custom widgets
// import 'widgets/custom_widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const Color _green = Color(0xFF28A745);

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
            children: [
              const SizedBox(height: 32),

              const Text(
                'Register',
                style: TextStyle(
                  color: _green,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),

              Text.rich(
                TextSpan(
                  text: 'Create an ',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    height: 1.4,
                    color: Colors.black87,
                  ),
                  children: [
                    TextSpan(
                      text: 'account',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: _green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(
                      text: ' to access all the\nfeatures of Cleclo',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Email
              const Text(
                'Email',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hint: 'Ex: abc@example.com',
                keyboardType: TextInputType.emailAddress,
                // prefixIcon: Icon(Icons.alternate_email_outlined, size: 20),
              ),

              const SizedBox(height: 24),

              // Name
              const Text(
                'Your Name',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hint: 'Ex. Saul Ramirez',
                keyboardType: TextInputType.name,
                // prefixIcon: Icon(Icons.person_outline, size: 20),
              ),

              const SizedBox(height: 24),

              // Password
              const Text(
                'Your Password',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hint: '••••••••••',
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                prefixIcon: Icon(Icons.lock_outline, size: 20),
              ),

              const SizedBox(height: 32),

              CustomElevatedButton(
                width: screenWidth - 50,
                borderRadius: 50,
                label: 'Register',
                onPressed: () {
                  context.push(RouteConstants.enableLocationScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
