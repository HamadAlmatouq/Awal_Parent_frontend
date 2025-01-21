import 'package:bkid_frontend/providers/kid_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddKidPage extends StatefulWidget {
  const AddKidPage({super.key});

  @override
  _AddKidPageState createState() => _AddKidPageState();
}

class _AddKidPageState extends State<AddKidPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _civilIdController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2575CC),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.network(
                      'https://dashboard.codeparrot.ai/api/assets/Z44LmL9JV5SvYOsm',
                      width: 25,
                      height: 38,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Add Kid account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Kid's Full Name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2575CC),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'Full name...',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xFFD9D9D9)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildInputField(
                            "Birthday (YYYY-MM-DD)", _dobController, (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the birthday';
                          }
                          if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
                            return 'Please enter a valid date (YYYY-MM-DD)';
                          }
                          return null;
                        }),
                        const SizedBox(height: 16),
                        _buildInputField("Civil ID", _civilIdController,
                            (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the civil ID';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'Please enter a valid civil ID';
                          }
                          return null;
                        }),
                        const SizedBox(height: 16),
                        _buildInputField(
                            "Parent's Mobile Number", _mobileController,
                            (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the mobile phone';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        }),
                        const SizedBox(height: 16),
                        _buildInputField("Email", _emailController, (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        }),
                        const SizedBox(height: 16),

                        // Terms and Conditions
                        Row(
                          children: [
                            Checkbox(
                              value: termsAccepted,
                              onChanged: (value) {
                                setState(() {
                                  termsAccepted = value ?? false;
                                });
                              },
                            ),
                            const Text(
                              'Terms and Conditions',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate() &&
                                  termsAccepted) {
                                var result = await Provider.of<KidProvider>(
                                        context,
                                        listen: false)
                                    .createKid(
                                  name: _nameController.text,
                                  civilId: _civilIdController.text,
                                  mobile: _mobileController.text,
                                  dob: _dobController.text,
                                  email: _emailController.text,
                                );
                                if (result) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Kid created successfully')),
                                  );
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Kid creation failed')),
                                  );
                                }
                              } else if (!termsAccepted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please accept the terms and conditions')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2575CC),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text(
                              'Create',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller,
      String? Function(String?) validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2575CC),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
