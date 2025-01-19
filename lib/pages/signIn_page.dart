// import 'package:bkid_frontend/providers/auth_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// class SigninPage extends StatelessWidget {
//   SigninPage({Key? key}) : super(key: key);
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Sign In"),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               const Color.fromARGB(207, 42, 148, 235),
//               Colors.grey,
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Awal",
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Sign in to your account",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Username',
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     prefixIcon: const Icon(Icons.person),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   controller: usernameController,
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Password',
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     prefixIcon: const Icon(Icons.lock),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   controller: passwordController,
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 30),
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.only(
//                               top: 20, bottom: 20, left: 30, right: 30),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//                         ),
//                         onPressed: () async {
//                           if (usernameController.text.isEmpty ||
//                               passwordController.text.isEmpty) {
//                             ScaffoldMessenger.of(context)
//                                 .showSnackBar(const SnackBar(
//                               content: Text("Please fill in all fields"),
//                             ));
//                             return;
//                           }
//                           var result = await Provider.of<AuthProvider>(context,
//                                   listen: false)
//                               .signin(
//                                   username: usernameController.text,
//                                   password: passwordController.text);
//                           if (result) {
//                             context.go("/home");
//                           } else {
//                             ScaffoldMessenger.of(context)
//                                 .showSnackBar(const SnackBar(
//                               content: Text(
//                                   "Invalid credentials, please try again."),
//                             ));
//                           }
//                         },
//                         child: const Text(
//                           "Sign In",
//                           style: TextStyle(fontSize: 22, color: Colors.white),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       TextButton(
//                         onPressed: () {
//                           context.push('/signup');
//                         },
//                         child: const Text("Don't have an account? Sign up",
//                             style: TextStyle(color: Colors.blue)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF2575CC),
        child: SafeArea(
          child: Column(
            children: [
              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 74),
                        Center(
                          child: Text(
                            "awal.",
                            style: TextStyle(
                              fontFamily: 'Jua', // Using Jua font
                              fontSize: 128,
                              color: Colors.white,
                              letterSpacing: -0.23,
                              height: 20 / 128,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50), // Increased spacing
                        Center(
                          child: Text(
                            "Your child's future starts here",
                            style: TextStyle(
                              fontFamily: 'Jua', // Using Jua font
                              fontSize: 20,
                              color: Colors.white,
                              letterSpacing: -0.23,
                              height: 1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Center(
                          child: Text(
                            "log in with burgan account",
                            style: TextStyle(
                              fontFamily: 'Jua', // Using Jua font
                              fontSize: 20,
                              color: Colors.white,
                              letterSpacing: -0.23,
                              height: 1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 136),
                        Text(
                          "Username",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            color: Colors.white,
                            letterSpacing: -0.23,
                            height: 20 / 15,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          height: 49,
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
                                fontFamily: 'Inter',
                                fontSize: 15,
                                color: Color(0xFFA9A9A9),
                                letterSpacing: -0.23,
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          "Password",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            color: Colors.white,
                            letterSpacing: -0.23,
                            height: 20 / 15,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          height: 49,
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
                                fontFamily: 'Inter',
                                fontSize: 15,
                                color: Color(0xFFA9A9A9),
                                letterSpacing: -0.23,
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 122),
                        Container(
                          width: double.infinity,
                          height: 51,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add login logic here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2575CC),
                                letterSpacing: -0.23,
                                height: 20 / 24,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              // Add forgot password logic here
                            },
                            child: Text(
                              'Forget password?',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 15,
                                color: Colors.white,
                                letterSpacing: -0.23,
                                height: 20 / 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
