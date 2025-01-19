// import 'package:bkid_frontend/pages/Allowance_page.dart';
// import 'package:bkid_frontend/pages/add_kid_page.dart';
// import 'package:bkid_frontend/pages/allowance_dialogue.dart';
// import 'package:bkid_frontend/pages/goals_page.dart';
// import 'package:bkid_frontend/pages/home_page.dart';
// import 'package:bkid_frontend/pages/restrictions_page.dart';
// import 'package:bkid_frontend/pages/signIn_page.dart';
// import 'package:bkid_frontend/pages/signUp_page.dart';
// import 'package:bkid_frontend/pages/tasks_page.dart';
// import 'package:bkid_frontend/pages/view_kidCard_page.dart';
// import 'package:bkid_frontend/providers/auth_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//         //Second provider
//       ],
//       child: MainApp(),
//     ),
//   );
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final GoRouter router = GoRouter(
//       initialLocation: '/signin',
//       routes: [
//         GoRoute(
//           path: '/signup',
//           builder: (context, state) => SignupPage(),
//         ),
//         GoRoute(
//           path: '/signin',
//           builder: (context, state) => SigninPage(),
//         ),
//         GoRoute(
//           path: '/home',
//           builder: (context, state) => DashboardPage(),
//         ),
//         GoRoute(
//           path: '/add-kid',
//           builder: (context, state) => AddKidPage(),
//         ),
//         GoRoute(
//           path: '/view-kid',
//           builder: (context, state) => ViewKidCard(kid: {},),
//         ),
//         GoRoute(
//           path: '/Restriction',
//           builder: (context, state) => RestrictionsPage(),
//         ),
//         GoRoute(
//           path: '/Goals',
//           builder: (context, state) => GoalsPage(),
//         ),
//         GoRoute(
//           path: '/Allowance',
//           builder: (context, state) => AllowanceDialog(),
//         ),
//         GoRoute(
//           path: '/Tasks',
//           builder: (context, state) => TasksPage(),
//         ),
//       ],
//     );
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       routerConfig: router,
//     );
//   }
// }

import 'package:bkid_frontend/batolPages/AddGoalsDialog.dart';
import 'package:bkid_frontend/batolPages/GoalsManagingScreenState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

// Import your pages
import 'package:bkid_frontend/pages/Allowance_page.dart';
import 'package:bkid_frontend/pages/add_kid_page.dart';
import 'package:bkid_frontend/pages/allowance_dialogue.dart';
import 'package:bkid_frontend/pages/goals_page.dart';
import 'package:bkid_frontend/pages/home_page.dart';
import 'package:bkid_frontend/pages/restrictions_page.dart';
import 'package:bkid_frontend/pages/signIn_page.dart';
import 'package:bkid_frontend/pages/signUp_page.dart';
import 'package:bkid_frontend/pages/tasks_page.dart';
import 'package:bkid_frontend/pages/view_kidCard_page.dart';
import 'package:bkid_frontend/providers/auth_provider.dart';

// Import the new pages
// import 'package:bkid_frontend/pages/goals_managing_screen.dart';
// import 'package:bkid_frontend/pages/add_goals_dialog.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        // Add any additional providers here
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
      initialLocation: '/goals-managing',
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
            kid: {},
          ),
        ),
        GoRoute(
          path: '/Restriction',
          builder: (context, state) => RestrictionsPage(),
        ),
        GoRoute(
          path: '/Goals',
          builder: (context, state) => GoalsPage(),
        ),
        GoRoute(
          path: '/Allowance',
          builder: (context, state) => AllowanceDialog(),
        ),
        GoRoute(
          path: '/Tasks',
          builder: (context, state) => TasksPage(),
        ),
        // Add routes for GoalsManagingScreen and AddGoalsDialog
        GoRoute(
          path: '/goals-managing',
          builder: (context, state) => GoalsManagingScreen(),
        ),
        GoRoute(
          path: '/add-goals-dialog',
          builder: (context, state) => AddGoalsDialog(),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
