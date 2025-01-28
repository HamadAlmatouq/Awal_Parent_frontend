import 'package:bkid_frontend/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2575CC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 120),
                // Logo
                Text(
                  'awal.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 128,
                    fontFamily: 'Jua',
                    letterSpacing: -0.23,
                    height: 0.16,
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  "Your child's future starts here",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Jua',
                    letterSpacing: -0.23,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'log in with burgan account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Jua',
                    letterSpacing: -0.23,
                  ),
                ),
                const SizedBox(height: 40),

                // Username Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        letterSpacing: -0.23,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: 'Username...',
                          hintStyle: TextStyle(
                            color: Color(0xFFA9A9A9),
                            fontSize: 15,
                            fontFamily: 'Inter',
                            letterSpacing: -0.23,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Password Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Inter',
                        letterSpacing: -0.23,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password...',
                          hintStyle: TextStyle(
                            color: Color(0xFFA9A9A9),
                            fontSize: 15,
                            fontFamily: 'Inter',
                            letterSpacing: -0.23,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),

                // Login Button
                ElevatedButton(
                  onPressed: () async {
                    if (usernameController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text("Please fill in all fields"),
                      ));
                      return;
                    }
                    var result = await Provider.of<AuthProvider>(context,
                            listen: false)
                        .signin(
                            username: usernameController.text,
                            password: passwordController.text);
                    if (result) {
                      context.go("/home");
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text("Invalid credentials, please try again."),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: Size(double.infinity, 51),
                  ),
                  
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF2575CC),
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.23,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Forget Password
                TextButton(
                  onPressed: () {
                    
                  },
                  child: Text(
                    'Forget password?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      letterSpacing: -0.23,
                    ),
                  ),
                ),
                const SizedBox(height: 2),

                // Sign Up
                TextButton(
                  onPressed: () {
                    context.push('/signup');
                  },
                  child: const Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}