import 'package:bkid_frontend/batolPages/CreateKidPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

// Import your pages
import 'package:bkid_frontend/pages/Allowance_page.dart';
import 'package:bkid_frontend/pages/add_kid_page.dart';
import 'package:bkid_frontend/pages/allowance_dialogue.dart';
import 'package:bkid_frontend/pages/goals_page.dart';
import 'package:bkid_frontend/pages/restrictions_page.dart';
import 'package:bkid_frontend/batolPages/signIn_page.dart';
import 'package:bkid_frontend/pages/signUp_page.dart';
import 'package:bkid_frontend/pages/tasks_page.dart';
import 'package:bkid_frontend/pages/view_kidCard_page.dart';
import 'package:bkid_frontend/providers/auth_provider.dart';

// Import the new pages
import 'package:bkid_frontend/batolPages/AddGoalsDialog.dart';
import 'package:bkid_frontend/batolPages/GoalsManagingScreenState.dart';

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
      initialLocation:
          '/dashboard', // Set the DashboardPage as the initial page
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
          path: '/dashboard', // This is the DashboardPage
          builder: (context, state) => DashboardPage(),
        ),
        GoRoute(
          path: '/home', // Define the route for HomePage
          builder: (context, state) =>
              HomePage(), // HomePage accessible from the Dashboard
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
        GoRoute(
          path: '/goals-managing',
          builder: (context, state) => GoalsManagingScreen(),
        ),
        GoRoute(
          path: '/create-kid',
          builder: (context, state) => CreateKidPage(),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => context.go('/signup'),
                child: Text('Signup Page'),
              ),
              ElevatedButton(
                onPressed: () => context.go('/signin'),
                child: Text('Signin Page'),
              ),
              // ElevatedButton(
              //   onPressed: () => context.go('/add-kid'),
              //   child: Text('Add Kid Page'),
              // ),
              ElevatedButton(
                onPressed: () => context.go('/view-kid'),
                child: Text('View Kid Card Page'),
              ),
              ElevatedButton(
                onPressed: () => context.go('/Restriction'),
                child: Text('Restrictions Page'),
              ),
              ElevatedButton(
                onPressed: () => context.go('/Goals'),
                child: Text('Goals Page'),
              ),
              ElevatedButton(
                onPressed: () => context.go('/Allowance'),
                child: Text('Allowance Dialog'),
              ),
              ElevatedButton(
                onPressed: () =>
                    context.go('/create-task'), // Button for CreateTaskScreen
                child: Text('Create Task Page'),
              ),
              ElevatedButton(
                onPressed: () => context.go('/goals-managing'),
                child: Text('Goals Managing Screen'),
              ),
              ElevatedButton(
                onPressed: () => context.go('/create-kid'),
                child: Text('Create Kid Page'),
              ),
              // Button to navigate to HomePage
              ElevatedButton(
                onPressed: () => context
                    .go('/home'), // Navigate to HomePage from the Dashboard
                child: Text('Go to Home Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              context.go('/dashboard'), // Navigate back to Dashboard
          child: Text('Back to Dashboard'),
        ),
      ),
    );
  }
}
