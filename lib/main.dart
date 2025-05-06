import 'package:flutter/material.dart';
import 'package:linkedin_clone/viewmodels/auth_viewmodel.dart';
import 'package:linkedin_clone/views/home_page.dart';
import 'package:linkedin_clone/views/login_page.dart';
import 'package:linkedin_clone/views/signup_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewmodel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LinkedIn Clone',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignupPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}