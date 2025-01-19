// // // // // // // import 'package:flutter/material.dart';

// // // // // // // class CreateKidPage extends StatelessWidget {
// // // // // // //   final _formKey = GlobalKey<FormState>();
// // // // // // //   final TextEditingController _nameController = TextEditingController();
// // // // // // //   final TextEditingController _emailController = TextEditingController();
// // // // // // //   final TextEditingController _birthdayController = TextEditingController();
// // // // // // //   final TextEditingController _civilIdController = TextEditingController();
// // // // // // //   final TextEditingController _mobileController = TextEditingController();

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       appBar: AppBar(
// // // // // // //         backgroundColor: Color(0xFF2575CC),
// // // // // // //         elevation: 0,
// // // // // // //         title: Text('Create Kid'),
// // // // // // //       ),
// // // // // // //       body: Container(
// // // // // // //         decoration: BoxDecoration(
// // // // // // //           gradient: LinearGradient(
// // // // // // //             colors: [
// // // // // // //               Color(0xFF2575CC),
// // // // // // //               Colors.grey,
// // // // // // //             ],
// // // // // // //             begin: Alignment.topLeft,
// // // // // // //             end: Alignment.bottomRight,
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //         child: Center(
// // // // // // //           child: SingleChildScrollView(
// // // // // // //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
// // // // // // //             child: Form(
// // // // // // //               key: _formKey,
// // // // // // //               child: Column(
// // // // // // //                 mainAxisAlignment: MainAxisAlignment.center,
// // // // // // //                 children: [
// // // // // // //                   Text(
// // // // // // //                     "Create Kid",
// // // // // // //                     style: TextStyle(
// // // // // // //                       fontSize: 32,
// // // // // // //                       fontWeight: FontWeight.bold,
// // // // // // //                       color: Colors.white,
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                   SizedBox(height: 20),
// // // // // // //                   _buildTextField(
// // // // // // //                     controller: _nameController,
// // // // // // //                     labelText: 'Name',
// // // // // // //                     validator: (value) {
// // // // // // //                       if (value == null || value.isEmpty) {
// // // // // // //                         return 'Please enter the name';
// // // // // // //                       }
// // // // // // //                       return null;
// // // // // // //                     },
// // // // // // //                   ),
// // // // // // //                   SizedBox(height: 16),
// // // // // // //                   _buildTextField(
// // // // // // //                     controller: _emailController,
// // // // // // //                     labelText: 'Email',
// // // // // // //                     validator: (value) {
// // // // // // //                       if (value == null || value.isEmpty) {
// // // // // // //                         return 'Please enter the email';
// // // // // // //                       }
// // // // // // //                       if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
// // // // // // //                         return 'Please enter a valid email';
// // // // // // //                       }
// // // // // // //                       return null;
// // // // // // //                     },
// // // // // // //                   ),
// // // // // // //                   SizedBox(height: 16),
// // // // // // //                   _buildTextField(
// // // // // // //                     controller: _birthdayController,
// // // // // // //                     labelText: 'Birthday (YYYY-MM-DD)',
// // // // // // //                     validator: (value) {
// // // // // // //                       if (value == null || value.isEmpty) {
// // // // // // //                         return 'Please enter the birthday';
// // // // // // //                       }
// // // // // // //                       if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
// // // // // // //                         return 'Please enter a valid date (YYYY-MM-DD)';
// // // // // // //                       }
// // // // // // //                       return null;
// // // // // // //                     },
// // // // // // //                   ),
// // // // // // //                   SizedBox(height: 16),
// // // // // // //                   _buildTextField(
// // // // // // //                     controller: _civilIdController,
// // // // // // //                     labelText: 'Civil ID',
// // // // // // //                     validator: (value) {
// // // // // // //                       if (value == null || value.isEmpty) {
// // // // // // //                         return 'Please enter the civil ID';
// // // // // // //                       }
// // // // // // //                       if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
// // // // // // //                         return 'Please enter a valid civil ID';
// // // // // // //                       }
// // // // // // //                       return null;
// // // // // // //                     },
// // // // // // //                   ),
// // // // // // //                   SizedBox(height: 16),
// // // // // // //                   _buildTextField(
// // // // // // //                     controller: _mobileController,
// // // // // // //                     labelText: 'Mobile Phone',
// // // // // // //                     validator: (value) {
// // // // // // //                       if (value == null || value.isEmpty) {
// // // // // // //                         return 'Please enter the mobile phone';
// // // // // // //                       }
// // // // // // //                       if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
// // // // // // //                         return 'Please enter a valid phone number';
// // // // // // //                       }
// // // // // // //                       return null;
// // // // // // //                     },
// // // // // // //                   ),
// // // // // // //                   SizedBox(height: 20),
// // // // // // //                   ElevatedButton(
// // // // // // //                     onPressed: () {
// // // // // // //                       if (_formKey.currentState!.validate()) {
// // // // // // //                         // Process data
// // // // // // //                         ScaffoldMessenger.of(context).showSnackBar(
// // // // // // //                           SnackBar(content: Text('Processing Data')),
// // // // // // //                         );
// // // // // // //                       }
// // // // // // //                     },
// // // // // // //                     style: ElevatedButton.styleFrom(
// // // // // // //                       backgroundColor: Color(0xFF2575CC),
// // // // // // //                       foregroundColor: Colors.white,
// // // // // // //                       padding:
// // // // // // //                           EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // // // // //                       shape: RoundedRectangleBorder(
// // // // // // //                         borderRadius: BorderRadius.circular(12),
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                     child: Text('Create Kid'),
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildTextField({
// // // // // // //     required TextEditingController controller,
// // // // // // //     required String labelText,
// // // // // // //     required String? Function(String?) validator,
// // // // // // //   }) {
// // // // // // //     return TextFormField(
// // // // // // //       controller: controller,
// // // // // // //       decoration: InputDecoration(
// // // // // // //         labelText: labelText,
// // // // // // //         filled: true,
// // // // // // //         fillColor: Colors.grey[200],
// // // // // // //         border: OutlineInputBorder(
// // // // // // //           borderRadius: BorderRadius.circular(30),
// // // // // // //           borderSide: BorderSide.none,
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       validator: validator,
// // // // // // //     );
// // // // // // //   }
// // // // // // // }
// // // // // // import 'package:flutter/material.dart';

// // // // // // class CreateKidPage extends StatelessWidget {
// // // // // //   final _formKey = GlobalKey<FormState>();
// // // // // //   final TextEditingController _nameController = TextEditingController();
// // // // // //   final TextEditingController _emailController = TextEditingController();
// // // // // //   final TextEditingController _birthdayController = TextEditingController();
// // // // // //   final TextEditingController _civilIdController = TextEditingController();
// // // // // //   final TextEditingController _mobileController = TextEditingController();

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         backgroundColor: Color(0xFF2575CC),
// // // // // //         elevation: 0,
// // // // // //         title: Text('Create Kid'),
// // // // // //       ),
// // // // // //       body: Container(
// // // // // //         decoration: BoxDecoration(
// // // // // //           gradient: LinearGradient(
// // // // // //             colors: [
// // // // // //               Color(0xFF2575CC),
// // // // // //               Color(0xFF2575CC),
// // // // // //             ],
// // // // // //             begin: Alignment.topLeft,
// // // // // //             end: Alignment.bottomRight,
// // // // // //           ),
// // // // // //         ),
// // // // // //         child: Center(
// // // // // //           child: SingleChildScrollView(
// // // // // //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
// // // // // //             child: Form(
// // // // // //               key: _formKey,
// // // // // //               child: Column(
// // // // // //                 mainAxisAlignment: MainAxisAlignment.center,
// // // // // //                 children: [
// // // // // //                   Text(
// // // // // //                     "Create Kid",
// // // // // //                     style: TextStyle(
// // // // // //                       fontSize: 32,
// // // // // //                       fontWeight: FontWeight.bold,
// // // // // //                       color: Colors.white,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   SizedBox(height: 20),
// // // // // //                   _buildTextField(
// // // // // //                     controller: _nameController,
// // // // // //                     labelText: 'Name',
// // // // // //                     validator: (value) {
// // // // // //                       if (value == null || value.isEmpty) {
// // // // // //                         return 'Please enter the name';
// // // // // //                       }
// // // // // //                       return null;
// // // // // //                     },
// // // // // //                   ),
// // // // // //                   SizedBox(height: 16),
// // // // // //                   _buildTextField(
// // // // // //                     controller: _emailController,
// // // // // //                     labelText: 'Email',
// // // // // //                     validator: (value) {
// // // // // //                       if (value == null || value.isEmpty) {
// // // // // //                         return 'Please enter the email';
// // // // // //                       }
// // // // // //                       if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
// // // // // //                         return 'Please enter a valid email';
// // // // // //                       }
// // // // // //                       return null;
// // // // // //                     },
// // // // // //                   ),
// // // // // //                   SizedBox(height: 16),
// // // // // //                   _buildTextField(
// // // // // //                     controller: _birthdayController,
// // // // // //                     labelText: 'Birthday (YYYY-MM-DD)',
// // // // // //                     validator: (value) {
// // // // // //                       if (value == null || value.isEmpty) {
// // // // // //                         return 'Please enter the birthday';
// // // // // //                       }
// // // // // //                       if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
// // // // // //                         return 'Please enter a valid date (YYYY-MM-DD)';
// // // // // //                       }
// // // // // //                       return null;
// // // // // //                     },
// // // // // //                   ),
// // // // // //                   SizedBox(height: 16),
// // // // // //                   _buildTextField(
// // // // // //                     controller: _civilIdController,
// // // // // //                     labelText: 'Civil ID',
// // // // // //                     validator: (value) {
// // // // // //                       if (value == null || value.isEmpty) {
// // // // // //                         return 'Please enter the civil ID';
// // // // // //                       }
// // // // // //                       if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
// // // // // //                         return 'Please enter a valid civil ID';
// // // // // //                       }
// // // // // //                       return null;
// // // // // //                     },
// // // // // //                   ),
// // // // // //                   SizedBox(height: 16),
// // // // // //                   _buildTextField(
// // // // // //                     controller: _mobileController,
// // // // // //                     labelText: 'Mobile Phone',
// // // // // //                     validator: (value) {
// // // // // //                       if (value == null || value.isEmpty) {
// // // // // //                         return 'Please enter the mobile phone';
// // // // // //                       }
// // // // // //                       if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
// // // // // //                         return 'Please enter a valid phone number';
// // // // // //                       }
// // // // // //                       return null;
// // // // // //                     },
// // // // // //                   ),
// // // // // //                   SizedBox(height: 20),
// // // // // //                   ElevatedButton(
// // // // // //                     onPressed: () {
// // // // // //                       if (_formKey.currentState!.validate()) {
// // // // // //                         // Process data
// // // // // //                         ScaffoldMessenger.of(context).showSnackBar(
// // // // // //                           SnackBar(content: Text('Processing Data')),
// // // // // //                         );
// // // // // //                       }
// // // // // //                     },
// // // // // //                     style: ElevatedButton.styleFrom(
// // // // // //                       backgroundColor: Color(0xFF2575CC),
// // // // // //                       foregroundColor: Colors.white,
// // // // // //                       padding:
// // // // // //                           EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // // // //                       shape: RoundedRectangleBorder(
// // // // // //                         borderRadius: BorderRadius.circular(12),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     child: Text('Create Kid'),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildTextField({
// // // // // //     required TextEditingController controller,
// // // // // //     required String labelText,
// // // // // //     required String? Function(String?) validator,
// // // // // //   }) {
// // // // // //     return TextFormField(
// // // // // //       controller: controller,
// // // // // //       decoration: InputDecoration(
// // // // // //         labelText: labelText,
// // // // // //         filled: true,
// // // // // //         fillColor: Colors.grey[200],
// // // // // //         border: OutlineInputBorder(
// // // // // //           borderRadius: BorderRadius.circular(30),
// // // // // //           borderSide: BorderSide.none,
// // // // // //         ),
// // // // // //       ),
// // // // // //       validator: validator,
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // // import 'package:flutter/material.dart';

// // // // // class CreateKidPage extends StatelessWidget {
// // // // //   final _formKey = GlobalKey<FormState>();
// // // // //   final TextEditingController _nameController = TextEditingController();
// // // // //   final TextEditingController _emailController = TextEditingController();
// // // // //   final TextEditingController _birthdayController = TextEditingController();
// // // // //   final TextEditingController _civilIdController = TextEditingController();
// // // // //   final TextEditingController _mobileController = TextEditingController();

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         backgroundColor: Color(0xFF2575CC),
// // // // //         elevation: 0,
// // // // //         leading: IconButton(
// // // // //           icon: Icon(Icons.arrow_back, color: Colors.white),
// // // // //           onPressed: () {
// // // // //             Navigator.of(context).pop();
// // // // //           },
// // // // //         ),
// // // // //         title: Text('Create Kid', style: TextStyle(color: Colors.white)),
// // // // //         centerTitle: true,
// // // // //       ),
// // // // //       body: Container(
// // // // //         decoration: BoxDecoration(
// // // // //           gradient: LinearGradient(
// // // // //             colors: [
// // // // //               Color(0xFF2575CC),
// // // // //               Color(0xFF2575CC),
// // // // //             ],
// // // // //             begin: Alignment.topLeft,
// // // // //             end: Alignment.bottomRight,
// // // // //           ),
// // // // //         ),
// // // // //         child: Center(
// // // // //           child: SingleChildScrollView(
// // // // //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
// // // // //             child: Stack(
// // // // //               alignment: Alignment.center,
// // // // //               children: [
// // // // //                 Container(
// // // // //                   width: double.infinity,
// // // // //                   padding: EdgeInsets.all(20.0),
// // // // //                   decoration: BoxDecoration(
// // // // //                     color: Colors.white,
// // // // //                     borderRadius: BorderRadius.circular(12),
// // // // //                     boxShadow: [
// // // // //                       BoxShadow(
// // // // //                         color: Colors.black26,
// // // // //                         blurRadius: 10,
// // // // //                         offset: Offset(0, 5),
// // // // //                       ),
// // // // //                     ],
// // // // //                   ),
// // // // //                   child: Form(
// // // // //                     key: _formKey,
// // // // //                     child: Column(
// // // // //                       mainAxisAlignment: MainAxisAlignment.center,
// // // // //                       children: [
// // // // //                         Text(
// // // // //                           "Create Kid",
// // // // //                           style: TextStyle(
// // // // //                             fontSize: 32,
// // // // //                             fontWeight: FontWeight.bold,
// // // // //                             color: Color(0xFF2575CC),
// // // // //                           ),
// // // // //                         ),
// // // // //                         SizedBox(height: 20),
// // // // //                         _buildTextField(
// // // // //                           controller: _nameController,
// // // // //                           labelText: 'Name',
// // // // //                           validator: (value) {
// // // // //                             if (value == null || value.isEmpty) {
// // // // //                               return 'Please enter the name';
// // // // //                             }
// // // // //                             return null;
// // // // //                           },
// // // // //                         ),
// // // // //                         SizedBox(height: 16),
// // // // //                         _buildTextField(
// // // // //                           controller: _emailController,
// // // // //                           labelText: 'Email',
// // // // //                           validator: (value) {
// // // // //                             if (value == null || value.isEmpty) {
// // // // //                               return 'Please enter the email';
// // // // //                             }
// // // // //                             if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
// // // // //                                 .hasMatch(value)) {
// // // // //                               return 'Please enter a valid email';
// // // // //                             }
// // // // //                             return null;
// // // // //                           },
// // // // //                         ),
// // // // //                         SizedBox(height: 16),
// // // // //                         _buildTextField(
// // // // //                           controller: _birthdayController,
// // // // //                           labelText: 'Birthday (YYYY-MM-DD)',
// // // // //                           validator: (value) {
// // // // //                             if (value == null || value.isEmpty) {
// // // // //                               return 'Please enter the birthday';
// // // // //                             }
// // // // //                             if (!RegExp(r'^\d{4}-\d{2}-\d{2}$')
// // // // //                                 .hasMatch(value)) {
// // // // //                               return 'Please enter a valid date (YYYY-MM-DD)';
// // // // //                             }
// // // // //                             return null;
// // // // //                           },
// // // // //                         ),
// // // // //                         SizedBox(height: 16),
// // // // //                         _buildTextField(
// // // // //                           controller: _civilIdController,
// // // // //                           labelText: 'Civil ID',
// // // // //                           validator: (value) {
// // // // //                             if (value == null || value.isEmpty) {
// // // // //                               return 'Please enter the civil ID';
// // // // //                             }
// // // // //                             if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
// // // // //                               return 'Please enter a valid civil ID';
// // // // //                             }
// // // // //                             return null;
// // // // //                           },
// // // // //                         ),
// // // // //                         SizedBox(height: 16),
// // // // //                         _buildTextField(
// // // // //                           controller: _mobileController,
// // // // //                           labelText: 'Mobile Phone',
// // // // //                           validator: (value) {
// // // // //                             if (value == null || value.isEmpty) {
// // // // //                               return 'Please enter the mobile phone';
// // // // //                             }
// // // // //                             if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
// // // // //                               return 'Please enter a valid phone number';
// // // // //                             }
// // // // //                             return null;
// // // // //                           },
// // // // //                         ),
// // // // //                         SizedBox(height: 20),
// // // // //                         ElevatedButton(
// // // // //                           onPressed: () {
// // // // //                             if (_formKey.currentState!.validate()) {
// // // // //                               // Process data
// // // // //                               ScaffoldMessenger.of(context).showSnackBar(
// // // // //                                 SnackBar(content: Text('Processing Data')),
// // // // //                               );
// // // // //                             }
// // // // //                           },
// // // // //                           style: ElevatedButton.styleFrom(
// // // // //                             backgroundColor: Color(0xFF2575CC),
// // // // //                             foregroundColor: Colors.white,
// // // // //                             padding: EdgeInsets.symmetric(
// // // // //                                 horizontal: 16, vertical: 12),
// // // // //                             shape: RoundedRectangleBorder(
// // // // //                               borderRadius: BorderRadius.circular(12),
// // // // //                             ),
// // // // //                           ),
// // // // //                           child: Text('Create Kid'),
// // // // //                         ),
// // // // //                       ],
// // // // //                     ),
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildTextField({
// // // // //     required TextEditingController controller,
// // // // //     required String labelText,
// // // // //     required String? Function(String?) validator,
// // // // //   }) {
// // // // //     return TextFormField(
// // // // //       controller: controller,
// // // // //       decoration: InputDecoration(
// // // // //         labelText: labelText,
// // // // //         filled: true,
// // // // //         fillColor: Colors.grey[200],
// // // // //         border: OutlineInputBorder(
// // // // //           borderRadius: BorderRadius.circular(30),
// // // // //           borderSide: BorderSide.none,
// // // // //         ),
// // // // //       ),
// // // // //       validator: validator,
// // // // //     );
// // // // //   }
// // // // // }
// // // // import 'package:flutter/material.dart';

// // // // class CreateKidPage extends StatelessWidget {
// // // //   final _formKey = GlobalKey<FormState>();
// // // //   final TextEditingController _nameController = TextEditingController();
// // // //   final TextEditingController _emailController = TextEditingController();
// // // //   final TextEditingController _birthdayController = TextEditingController();
// // // //   final TextEditingController _civilIdController = TextEditingController();
// // // //   final TextEditingController _mobileController = TextEditingController();

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         backgroundColor: Color(0xFF2575CC),
// // // //         elevation: 0,
// // // //         leading: IconButton(
// // // //           icon: Icon(Icons.arrow_back, color: Colors.white),
// // // //           onPressed: () {
// // // //             Navigator.of(context).pop();
// // // //           },
// // // //         ),
// // // //         title: Text('Create Kid', style: TextStyle(color: Colors.white)),
// // // //         centerTitle: true,
// // // //       ),
// // // //       body: Container(
// // // //         decoration: BoxDecoration(
// // // //           gradient: LinearGradient(
// // // //             colors: [
// // // //               Color(0xFF2575CC),
// // // //               Color(0xFF2575CC),
// // // //             ],
// // // //             begin: Alignment.topLeft,
// // // //             end: Alignment.bottomRight,
// // // //           ),
// // // //         ),
// // // //         child: Center(
// // // //           child: SingleChildScrollView(
// // // //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
// // // //             child: Stack(
// // // //               alignment: Alignment.center,
// // // //               children: [
// // // //                 Container(
// // // //                   width: double.infinity,
// // // //                   padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100.0),
// // // //                   decoration: BoxDecoration(
// // // //                     color: Colors.white,
// // // //                     borderRadius: BorderRadius.circular(12),
// // // //                     boxShadow: [
// // // //                       BoxShadow(
// // // //                         color: Colors.black26,
// // // //                         blurRadius: 10,
// // // //                         offset: Offset(0, 5),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   child: Form(
// // // //                     key: _formKey,
// // // //                     child: Column(
// // // //                       mainAxisAlignment: MainAxisAlignment.center,
// // // //                       children: [
// // // //                         SizedBox(height: 20),
// // // //                         _buildTextField(
// // // //                           controller: _nameController,
// // // //                           labelText: 'Name',
// // // //                           validator: (value) {
// // // //                             if (value == null || value.isEmpty) {
// // // //                               return 'Please enter the name';
// // // //                             }
// // // //                             return null;
// // // //                           },
// // // //                         ),
// // // //                         SizedBox(height: 16),
// // // //                         _buildTextField(
// // // //                           controller: _emailController,
// // // //                           labelText: 'Email',
// // // //                           validator: (value) {
// // // //                             if (value == null || value.isEmpty) {
// // // //                               return 'Please enter the email';
// // // //                             }
// // // //                             if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
// // // //                                 .hasMatch(value)) {
// // // //                               return 'Please enter a valid email';
// // // //                             }
// // // //                             return null;
// // // //                           },
// // // //                         ),
// // // //                         SizedBox(height: 16),
// // // //                         _buildTextField(
// // // //                           controller: _birthdayController,
// // // //                           labelText: 'Birthday (YYYY-MM-DD)',
// // // //                           validator: (value) {
// // // //                             if (value == null || value.isEmpty) {
// // // //                               return 'Please enter the birthday';
// // // //                             }
// // // //                             if (!RegExp(r'^\d{4}-\d{2}-\d{2}$')
// // // //                                 .hasMatch(value)) {
// // // //                               return 'Please enter a valid date (YYYY-MM-DD)';
// // // //                             }
// // // //                             return null;
// // // //                           },
// // // //                         ),
// // // //                         SizedBox(height: 16),
// // // //                         _buildTextField(
// // // //                           controller: _civilIdController,
// // // //                           labelText: 'Civil ID',
// // // //                           validator: (value) {
// // // //                             if (value == null || value.isEmpty) {
// // // //                               return 'Please enter the civil ID';
// // // //                             }
// // // //                             if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
// // // //                               return 'Please enter a valid civil ID';
// // // //                             }
// // // //                             return null;
// // // //                           },
// // // //                         ),
// // // //                         SizedBox(height: 16),
// // // //                         _buildTextField(
// // // //                           controller: _mobileController,
// // // //                           labelText: 'Mobile Phone',
// // // //                           validator: (value) {
// // // //                             if (value == null || value.isEmpty) {
// // // //                               return 'Please enter the mobile phone';
// // // //                             }
// // // //                             if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
// // // //                               return 'Please enter a valid phone number';
// // // //                             }
// // // //                             return null;
// // // //                           },
// // // //                         ),
// // // //                         SizedBox(height: 20),
// // // //                         ElevatedButton(
// // // //                           onPressed: () {
// // // //                             if (_formKey.currentState!.validate()) {
// // // //                               // Process data
// // // //                               ScaffoldMessenger.of(context).showSnackBar(
// // // //                                 SnackBar(content: Text('Processing Data')),
// // // //                               );
// // // //                             }
// // // //                           },
// // // //                           style: ElevatedButton.styleFrom(
// // // //                             backgroundColor: Color(0xFF2575CC),
// // // //                             foregroundColor: Colors.white,
// // // //                             padding: EdgeInsets.symmetric(
// // // //                                 horizontal: 16, vertical: 12),
// // // //                             shape: RoundedRectangleBorder(
// // // //                               borderRadius: BorderRadius.circular(12),
// // // //                             ),
// // // //                           ),
// // // //                           child: Text('Create Kid'),
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildTextField({
// // // //     required TextEditingController controller,
// // // //     required String labelText,
// // // //     required String? Function(String?) validator,
// // // //   }) {
// // // //     return TextFormField(
// // // //       controller: controller,
// // // //       decoration: InputDecoration(
// // // //         labelText: labelText,
// // // //         filled: true,
// // // //         fillColor: Colors.grey[200],
// // // //         border: OutlineInputBorder(
// // // //           borderRadius: BorderRadius.circular(30),
// // // //           borderSide: BorderSide.none,
// // // //         ),
// // // //       ),
// // // //       validator: validator,
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';

// // // class CreateKidPage extends StatelessWidget {
// // //   final _formKey = GlobalKey<FormState>();
// // //   final TextEditingController _nameController = TextEditingController();
// // //   final TextEditingController _emailController = TextEditingController();
// // //   final TextEditingController _birthdayController = TextEditingController();
// // //   final TextEditingController _civilIdController = TextEditingController();
// // //   final TextEditingController _mobileController = TextEditingController();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         backgroundColor: Color(0xFF2575CC),
// // //         elevation: 0,
// // //         leading: IconButton(
// // //           icon: Icon(Icons.arrow_back, color: Colors.white),
// // //           onPressed: () {
// // //             Navigator.of(context).pop();
// // //           },
// // //         ),
// // //         title: Text('Create Kid', style: TextStyle(color: Colors.white)),
// // //         centerTitle: true,
// // //       ),
// // //       body: Container(
// // //         decoration: BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [
// // //               Color(0xFF2575CC),
// // //               Color(0xFF2575CC),
// // //             ],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Center(
// // //           child: SingleChildScrollView(
// // //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
// // //             child: Stack(
// // //               alignment: Alignment.center,
// // //               children: [
// // //                 Container(
// // //                   margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 50.0),
// // //                   padding: EdgeInsets.all(20.0),
// // //                   decoration: BoxDecoration(
// // //                     color: Colors.white,
// // //                     borderRadius: BorderRadius.circular(12),
// // //                     boxShadow: [
// // //                       BoxShadow(
// // //                         color: Colors.black26,
// // //                         blurRadius: 10,
// // //                         offset: Offset(0, 5),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   child: Form(
// // //                     key: _formKey,
// // //                     child: Column(
// // //                       mainAxisAlignment: MainAxisAlignment.center,
// // //                       children: [
// // //                         SizedBox(height: 20),
// // //                         _buildTextField(
// // //                           controller: _nameController,
// // //                           labelText: 'Name',
// // //                           validator: (value) {
// // //                             if (value == null || value.isEmpty) {
// // //                               return 'Please enter the name';
// // //                             }
// // //                             return null;
// // //                           },
// // //                         ),
// // //                         SizedBox(height: 16),
// // //                         _buildTextField(
// // //                           controller: _emailController,
// // //                           labelText: 'Email',
// // //                           validator: (value) {
// // //                             if (value == null || value.isEmpty) {
// // //                               return 'Please enter the email';
// // //                             }
// // //                             if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
// // //                                 .hasMatch(value)) {
// // //                               return 'Please enter a valid email';
// // //                             }
// // //                             return null;
// // //                           },
// // //                         ),
// // //                         SizedBox(height: 16),
// // //                         _buildTextField(
// // //                           controller: _birthdayController,
// // //                           labelText: 'Birthday (YYYY-MM-DD)',
// // //                           validator: (value) {
// // //                             if (value == null || value.isEmpty) {
// // //                               return 'Please enter the birthday';
// // //                             }
// // //                             if (!RegExp(r'^\d{4}-\d{2}-\d{2}$')
// // //                                 .hasMatch(value)) {
// // //                               return 'Please enter a valid date (YYYY-MM-DD)';
// // //                             }
// // //                             return null;
// // //                           },
// // //                         ),
// // //                         SizedBox(height: 16),
// // //                         _buildTextField(
// // //                           controller: _civilIdController,
// // //                           labelText: 'Civil ID',
// // //                           validator: (value) {
// // //                             if (value == null || value.isEmpty) {
// // //                               return 'Please enter the civil ID';
// // //                             }
// // //                             if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
// // //                               return 'Please enter a valid civil ID';
// // //                             }
// // //                             return null;
// // //                           },
// // //                         ),
// // //                         SizedBox(height: 16),
// // //                         _buildTextField(
// // //                           controller: _mobileController,
// // //                           labelText: 'Mobile Phone',
// // //                           validator: (value) {
// // //                             if (value == null || value.isEmpty) {
// // //                               return 'Please enter the mobile phone';
// // //                             }
// // //                             if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
// // //                               return 'Please enter a valid phone number';
// // //                             }
// // //                             return null;
// // //                           },
// // //                         ),
// // //                         SizedBox(height: 20),
// // //                         ElevatedButton(
// // //                           onPressed: () {
// // //                             if (_formKey.currentState!.validate()) {
// // //                               // Process data
// // //                               ScaffoldMessenger.of(context).showSnackBar(
// // //                                 SnackBar(content: Text('Processing Data')),
// // //                               );
// // //                             }
// // //                           },
// // //                           style: ElevatedButton.styleFrom(
// // //                             backgroundColor: Color(0xFF2575CC),
// // //                             foregroundColor: Colors.white,
// // //                             padding: EdgeInsets.symmetric(
// // //                                 horizontal: 16, vertical: 12),
// // //                             shape: RoundedRectangleBorder(
// // //                               borderRadius: BorderRadius.circular(12),
// // //                             ),
// // //                           ),
// // //                           child: Text('Create Kid'),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildTextField({
// // //     required TextEditingController controller,
// // //     required String labelText,
// // //     required String? Function(String?) validator,
// // //   }) {
// // //     return TextFormField(
// // //       controller: controller,
// // //       decoration: InputDecoration(
// // //         labelText: labelText,
// // //         filled: true,
// // //         fillColor: Colors.grey[200],
// // //         border: OutlineInputBorder(
// // //           borderRadius: BorderRadius.circular(30),
// // //           borderSide: BorderSide.none,
// // //         ),
// // //       ),
// // //       validator: validator,
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';

// // class CreateKidPage extends StatelessWidget {
// //   final _formKey = GlobalKey<FormState>();
// //   final TextEditingController _nameController = TextEditingController();
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _birthdayController = TextEditingController();
// //   final TextEditingController _civilIdController = TextEditingController();
// //   final TextEditingController _mobileController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Color(0xFF2575CC),
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back, color: Colors.white),
// //           onPressed: () {
// //             Navigator.of(context).pop();
// //           },
// //         ),
// //         title: Text('Create Kid', style: TextStyle(color: Colors.white)),
// //         centerTitle: true,
// //       ),
// //       body: Container(
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [
// //               Color(0xFF2575CC),
// //               Color(0xFF2575CC),
// //             ],
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //           ),
// //         ),
// //         child: Center(
// //           child: SingleChildScrollView(
// //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //             child: Stack(
// //               alignment: Alignment.center,
// //               children: [
// //                 Container(
// //                   margin: EdgeInsets.fromLTRB(0, 0, 0, 0), // Adjusted margin
// //                   padding: EdgeInsets.all(20.0),
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.circular(12),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.black26,
// //                         blurRadius: 10,
// //                         offset: Offset(0, 5),
// //                       ),
// //                     ],
// //                   ),
// //                   child: Form(
// //                     key: _formKey,
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         SizedBox(height: 20),
// //                         _buildTextField(
// //                           controller: _nameController,
// //                           labelText: 'Name',
// //                           validator: (value) {
// //                             if (value == null || value.isEmpty) {
// //                               return 'Please enter the name';
// //                             }
// //                             return null;
// //                           },
// //                         ),
// //                         SizedBox(height: 16),
// //                         _buildTextField(
// //                           controller: _emailController,
// //                           labelText: 'Email',
// //                           validator: (value) {
// //                             if (value == null || value.isEmpty) {
// //                               return 'Please enter the email';
// //                             }
// //                             if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
// //                                 .hasMatch(value)) {
// //                               return 'Please enter a valid email';
// //                             }
// //                             return null;
// //                           },
// //                         ),
// //                         SizedBox(height: 16),
// //                         _buildTextField(
// //                           controller: _birthdayController,
// //                           labelText: 'Birthday (YYYY-MM-DD)',
// //                           validator: (value) {
// //                             if (value == null || value.isEmpty) {
// //                               return 'Please enter the birthday';
// //                             }
// //                             if (!RegExp(r'^\d{4}-\d{2}-\d{2}$')
// //                                 .hasMatch(value)) {
// //                               return 'Please enter a valid date (YYYY-MM-DD)';
// //                             }
// //                             return null;
// //                           },
// //                         ),
// //                         SizedBox(height: 16),
// //                         _buildTextField(
// //                           controller: _civilIdController,
// //                           labelText: 'Civil ID',
// //                           validator: (value) {
// //                             if (value == null || value.isEmpty) {
// //                               return 'Please enter the civil ID';
// //                             }
// //                             if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
// //                               return 'Please enter a valid civil ID';
// //                             }
// //                             return null;
// //                           },
// //                         ),
// //                         SizedBox(height: 16),
// //                         _buildTextField(
// //                           controller: _mobileController,
// //                           labelText: 'Mobile Phone',
// //                           validator: (value) {
// //                             if (value == null || value.isEmpty) {
// //                               return 'Please enter the mobile phone';
// //                             }
// //                             if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
// //                               return 'Please enter a valid phone number';
// //                             }
// //                             return null;
// //                           },
// //                         ),
// //                         SizedBox(height: 20),
// //                         ElevatedButton(
// //                           onPressed: () {
// //                             if (_formKey.currentState!.validate()) {
// //                               // Process data
// //                               ScaffoldMessenger.of(context).showSnackBar(
// //                                 SnackBar(content: Text('Processing Data')),
// //                               );
// //                             }
// //                           },
// //                           style: ElevatedButton.styleFrom(
// //                             backgroundColor: Color(0xFF2575CC),
// //                             foregroundColor: Colors.white,
// //                             padding: EdgeInsets.symmetric(
// //                                 horizontal: 16, vertical: 12),
// //                             shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(12),
// //                             ),
// //                           ),
// //                           child: Text('Create Kid'),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildTextField({
// //     required TextEditingController controller,
// //     required String labelText,
// //     required String? Function(String?) validator,
// //   }) {
// //     return TextFormField(
// //       controller: controller,
// //       decoration: InputDecoration(
// //         labelText: labelText,
// //         filled: true,
// //         fillColor: Colors.grey[200],
// //         border: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(30),
// //           borderSide: BorderSide.none,
// //         ),
// //       ),
// //       validator: validator,
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class CreateKidPage extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _birthdayController = TextEditingController();
//   final TextEditingController _civilIdController = TextEditingController();
//   final TextEditingController _mobileController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF2575CC),
//         elevation: 0,
//         title: Text('Create Kid'),
//       ),
//       body: Container(
//         color: Color(0xFF2575CC), // Set the background color to blue
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16.0),
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _buildTextField(
//                       controller: _nameController,
//                       labelText: 'Name',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter the name';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextField(
//                       controller: _emailController,
//                       labelText: 'Email',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter the email';
//                         }
//                         if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                           return 'Please enter a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextField(
//                       controller: _birthdayController,
//                       labelText: 'Birthday (YYYY-MM-DD)',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter the birthday';
//                         }
//                         if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
//                           return 'Please enter a valid date (YYYY-MM-DD)';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextField(
//                       controller: _civilIdController,
//                       labelText: 'Civil ID',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter the civil ID';
//                         }
//                         if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
//                           return 'Please enter a valid civil ID';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextField(
//                       controller: _mobileController,
//                       labelText: 'Mobile Phone',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter the mobile phone';
//                         }
//                         if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
//                           return 'Please enter a valid phone number';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           // Process data
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text('Processing Data')),
//                           );
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF2575CC),
//                         foregroundColor: Colors.white,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: Text('Create Kid'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String labelText,
//     required String? Function(String?) validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         filled: true,
//         fillColor: Colors.grey[200],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide.none,
//         ),
//       ),
//       validator: validator,
//     );
//   }
// }
import 'package:flutter/material.dart';

class CreateKidPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _civilIdController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2575CC),
        elevation: 0,
        title: Text('Create Kid'),
      ),
      body: Container(
        color: Color(0xFF2575CC), // Set the background color to blue
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: const EdgeInsets.all(
                  24.0), // Increased padding for more space
              margin: const EdgeInsets.symmetric(
                  vertical: 40.0), // Added margin for vertical centering
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Align text fields to the start
                  children: [
                    _buildTextField(
                      controller: _nameController,
                      labelText: 'Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20), // Increased spacing between fields
                    _buildTextField(
                      controller: _emailController,
                      labelText: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _birthdayController,
                      labelText: 'Birthday (YYYY-MM-DD)',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the birthday';
                        }
                        if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
                          return 'Please enter a valid date (YYYY-MM-DD)';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _civilIdController,
                      labelText: 'Civil ID',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the civil ID';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Please enter a valid civil ID';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _mobileController,
                      labelText: 'Mobile Phone',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the mobile phone';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30), // Increased spacing before the button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Process data
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2575CC),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Create Kid'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    );
  }
}
