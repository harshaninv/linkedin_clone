import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:linkedin_clone/utils/text_theme.dart';
import 'package:linkedin_clone/viewmodels/auth_viewmodel.dart';
import 'package:linkedin_clone/widgets/custom_button.dart';
import 'package:linkedin_clone/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewmodel>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sign up',
                style: LinkedInTextTheme.title,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: emailController,
              label: 'Email',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: passwordController,
              label: 'Password(6 characters minimum)',
              isPassword: true,
              initialPasswordVisibilityToggle: authViewModel.isPasswordVisible,
              onPasswordVisibilityToggle: () {
                authViewModel.togglePasswordVisibility();
              },
            ),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: LinkedInTextTheme.paragraph,
                children: [
                  const TextSpan(text: 'By clicking Accept and Register, you agree to the '),
                  TextSpan(
                    text: 'Terms of Use',
                    style: LinkedInTextTheme.hyperlink,
                    recognizer: TapGestureRecognizer()..onTap = () {
                      // Handle Terms of Use link tap
                    },
                  ),
                  const TextSpan(text: ', the '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: LinkedInTextTheme.hyperlink,
                    recognizer: TapGestureRecognizer()..onTap = () {
                      // Handle Privacy Policy link tap
                    },
                  ),
                  const TextSpan(text: ', and '),
                  TextSpan(
                    text: 'Cookie Policy',
                    style: LinkedInTextTheme.hyperlink,
                    recognizer: TapGestureRecognizer()..onTap = () {
                      // Handle Cookie Policy link tap
                    },
                  ),
                  const TextSpan(text: ' LinkedIn.'),
                ],
              ),
            ),

            const SizedBox(height: 20),
            authViewModel.isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                    text: 'Accept and Register',
                    onPressed: () async {
                      bool success = await authViewModel.signUp(
                        emailController.text,
                        passwordController.text,
                      );
                      // guard with mounted check
                      if (!context.mounted) return;
                      if (success) {
                        Navigator.pushReplacementNamed(context, '/login');
                        emailController.clear();
                        passwordController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Signup successful. You can login now.'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Signup failed. Check credentials.'),
                          ),
                        );
                      }
                    },
                  ),
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              child: const Text('Already have an account? Login', style: LinkedInTextTheme.hyperlink,),
            ),
          ],
        ),
      ),
    );
  }
}