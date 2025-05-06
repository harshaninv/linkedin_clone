import 'package:flutter/material.dart';
import 'package:linkedin_clone/viewmodels/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewmodel>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Stay updated on your professional world'),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextButton(onPressed: () {}, child: Text('Forgot password')),
            authViewModel.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: () async {
                    bool sucess = await authViewModel.login(
                        _emailController.text,
                        _passwordController.text
                    );
                    if (sucess) {
                        Navigator.pushReplacementNamed(context, '/home');
                    } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login Failed, Try Again')),
                        );
                    }
                  },
                  child: Text('Sign In'),
                ),
                TextButton(onPressed: () => Navigator.pushNamed(context, '/signup'), child: Text('New user? Sign Up')),
          ],
        ),
      ),
    );
  }
}
