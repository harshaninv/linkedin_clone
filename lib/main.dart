import 'package:flutter/material.dart';
import 'package:linkedin_clone/viewmodels/auth_viewmodel.dart';
import 'package:linkedin_clone/viewmodels/home_viewmodel.dart';
import 'package:linkedin_clone/viewmodels/profile_viewmodel.dart';
import 'package:linkedin_clone/views/auth/login_page.dart';
import 'package:linkedin_clone/views/auth/signup_page.dart';
import 'package:linkedin_clone/views/profile/profile_page.dart';
import 'package:linkedin_clone/widgets/bottomTabBar/fab_tabs.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewmodel()),
        ChangeNotifierProvider(create: (_) => HomeViewmodel()),
        ChangeNotifierProvider(create: (_) => ProfileViewmodel()),
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
          '/home': (context) => FabTabs(),
          '/profile': (context) => ProfilePage(),
        },
      ),
    );
  }
}