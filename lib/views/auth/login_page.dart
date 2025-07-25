import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/text_theme.dart';
import 'package:linkedin_clone/viewmodels/auth_viewmodel.dart';
import 'package:linkedin_clone/widgets/custom_button.dart';
import 'package:linkedin_clone/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewmodel>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Sign in', style: LinkedInTextTheme.title),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Stay updated on your professional world',
                style: LinkedInTextTheme.subtitle,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(controller: emailController, label: 'Email'),
            const SizedBox(height: 20),
            CustomTextField(
              controller: passwordController,
              label: 'Password',
              isPassword: true,
              initialPasswordVisibilityToggle: authViewModel.isPasswordVisible,
              onPasswordVisibilityToggle: () {
                authViewModel.togglePasswordVisibility();
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password',
                  style: LinkedInTextTheme.hyperlink,
                ),
              ),
            ),
            authViewModel.isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                  text: 'Sign In',
                  onPressed: () async {
                    bool success = await authViewModel.login(
                      emailController.text,
                      passwordController.text,
                    );
                    // guard with mounted check
                    if (!context.mounted) return;
                    if (success) {
                      Navigator.pushReplacementNamed(context, '/home');
                      emailController.clear();
                      passwordController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login failed. Check credentials.'),
                        ),
                      );
                    }
                  },
                ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: const Text(
                'New user? Sign Up',
                style: LinkedInTextTheme.hyperlink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
