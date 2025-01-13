import 'package:bkid_frontend/pages/home_page.dart';
import 'package:bkid_frontend/pages/signIn_page.dart';
import 'package:bkid_frontend/pages/signUp_page.dart';
import 'package:bkid_frontend/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        //Second provider
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/signup',
      routes: [
        GoRoute(
          path: '/signup',
          builder: (context, state) => SignupPage(),
        ),
        GoRoute(
          path: '/signin',
          builder: (context, state) => SigninPage(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => DashboardPage(),
        ),
      ],
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}