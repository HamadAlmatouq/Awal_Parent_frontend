import 'package:bkid_frontend/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final pnameController = TextEditingController(); // Add controller for Pname
  final emailController = TextEditingController(); // Add controller for email

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
                const SizedBox(height: 80),
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
                const SizedBox(height: 40),

                // Username Field
                _buildInputField('Username', usernameController, false),
                const SizedBox(height: 20),

                // Parent Name Field
                _buildInputField('Parent Name', pnameController, false),
                const SizedBox(height: 20),

                // Email Field
                _buildInputField('Email', emailController, false),
                const SizedBox(height: 20),

                // Password Field
                _buildInputField('Password', passwordController, true),
                const SizedBox(height: 20),

                // Confirm Password Field
                _buildInputField(
                    'Confirm Password', confirmPasswordController, true),
                const SizedBox(height: 40),

                // Sign Up Button
                ElevatedButton(
                  onPressed: () async {
                    if (usernameController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty ||
                        pnameController.text.isEmpty ||
                        emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please fill in all fields")),
                      );
                      return;
                    }
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Passwords do not match")),
                      );
                      return;
                    }
                    var result =
                        await Provider.of<AuthProvider>(context, listen: false)
                            .signup(
                      username: usernameController.text,
                      password: passwordController.text,
                      pname: pnameController.text,
                      email: emailController.text,
                    );
                    if (result) {
                      context.go("/home");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Sign up failed, please try again.")),
                      );
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
                    'Sign Up',
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

                // Sign In Link
                TextButton(
                  onPressed: () => context.push('/signin'),
                  child: Text(
                    'Already have an account? Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      letterSpacing: -0.23,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      String label, TextEditingController controller, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
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
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: '$label...',
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
    );
  }
}
