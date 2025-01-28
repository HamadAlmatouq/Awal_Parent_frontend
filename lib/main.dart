import 'package:bkid_frontend/pages/add_kid_page.dart';
import 'package:bkid_frontend/pages/allowance_dialogue.dart';
import 'package:bkid_frontend/pages/goals_page.dart';
import 'package:bkid_frontend/pages/home_page.dart';
import 'package:bkid_frontend/pages/notification_page.dart';
import 'package:bkid_frontend/pages/restrictions_page.dart';
import 'package:bkid_frontend/pages/signIn_page.dart';
import 'package:bkid_frontend/pages/signUp_page.dart';
import 'package:bkid_frontend/pages/tasks_page.dart';
import 'package:bkid_frontend/pages/view_kidCard_page.dart';
import 'package:bkid_frontend/pages/transfer_dialogue.dart';
import 'package:bkid_frontend/providers/auth_provider.dart';
import 'package:bkid_frontend/providers/kid_provider.dart';
import 'package:bkid_frontend/services/client.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => KidProvider()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/signin',
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
        GoRoute(
          path: '/add-kid',
          builder: (context, state) => AddKidPage(),
        ),
        GoRoute(
          path: '/view-kid',
          builder: (context, state) => ViewKidCard(
            kid: state.extra as Map<String, dynamic>,
          ),
        ),
        GoRoute(
          path: '/Restriction',
          builder: (context, state) => RestrictionsPage(),
        ),
        GoRoute(
          path: '/Goals',
          builder: (context, state) {
            final kid = state.extra as Map<String, dynamic>;
            return GoalsManagingScreen(kidName: kid['Kname']);
          },
        ),
        GoRoute(
          path: '/Allowance',
          builder: (context, state) {
            final kid = state.extra as Map<String, dynamic>;
            return AllowanceDialog(kidName: kid['Kname']);
          },
        ),
        GoRoute(
          path: '/Tasks',
          builder: (context, state) => CreateTaskScreen(
            kidName: state.extra as String? ?? '',
          ),
        ),
        GoRoute(
          path: '/Transfer',
          builder: (context, state) => TransferDialog(),
        ),
        GoRoute(
          path: '/notifications',
          builder: (context, state) => NotificationScreen(
            kidName: state.extra as String,
          ),
        ),
      ],
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
