// // // // // import 'package:bkid_frontend/main.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter/cupertino.dart';
// // // // // import 'package:go_router/go_router.dart';

// // // // // class RestrictionsPage extends StatefulWidget {
// // // // //   const RestrictionsPage({super.key});

// // // // //   @override
// // // // //   _RestrictionsPageState createState() => _RestrictionsPageState();
// // // // // }

// // // // // class _RestrictionsPageState extends State<RestrictionsPage> {
// // // // //   bool enableRestrictions = true;
// // // // //   bool fractionToSaving = true;
// // // // //   bool allowOnlinePayment = true;
// // // // //   bool foodAndDrinks = true;
// // // // //   bool entertainment = false;
// // // // //   bool shopping = true;

// // // // //   List<String> categories = ['Food & Drinks', 'Entertainment', 'Shopping'];
// // // // //   List<String> restrictedCategories = [];

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       backgroundColor: Colors.blue,
// // // // //       appBar: AppBar(
// // // // //         backgroundColor: Colors.blue,
// // // // //         elevation: 0,
// // // // //         leading: IconButton(
// // // // //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // //           onPressed: () {
// // // // //             Navigator.pop(context);
// // // // //           },
// // // // //         ),
// // // // //         title:
// // // // //             const Text('Restrictions', style: TextStyle(color: Colors.white)),
// // // // //       ),
// // // // //       body: Container(
// // // // //         padding: const EdgeInsets.all(16),
// // // // //         decoration: const BoxDecoration(
// // // // //           color: Colors.white,
// // // // //           borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
// // // // //         ),
// // // // //         child: ListView(
// // // // //           children: [
// // // // //             ListTile(
// // // // //               title: const Text(
// // // // //                 'Enable Restrictions',
// // // // //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // // //               ),
// // // // //               trailing: CupertinoSwitch(
// // // // //                 value: enableRestrictions,
// // // // //                 onChanged: (value) {
// // // // //                   setState(() {
// // // // //                     enableRestrictions = value;
// // // // //                   });
// // // // //                 },
// // // // //                 activeTrackColor: Colors.green,
// // // // //               ),
// // // // //             ),
// // // // //             const Divider(),
// // // // //             _buildInputField(
// // // // //                 'Daily spending limits', 'amount... KD', enableRestrictions),
// // // // //             const SizedBox(height: 16),
// // // // //             _buildCardBlockRow(enableRestrictions),
// // // // //             const SizedBox(height: 16),
// // // // //             _buildInputField(
// // // // //                 'Saving limits account', 'amount... KD', enableRestrictions),
// // // // //             const SizedBox(height: 16),
// // // // //             _buildToggle(
// // // // //                 'Allow online payment', allowOnlinePayment, enableRestrictions,
// // // // //                 (value) {
// // // // //               setState(() {
// // // // //                 allowOnlinePayment = value;
// // // // //               });
// // // // //             }),
// // // // //             _buildToggle(
// // // // //                 'Fraction to saving', fractionToSaving, enableRestrictions,
// // // // //                 (value) {
// // // // //               setState(() {
// // // // //                 fractionToSaving = value;
// // // // //               });
// // // // //             }),
// // // // //             const SizedBox(height: 16),
// // // // //             _buildCategoryRestrictions(enableRestrictions),
// // // // //             const SizedBox(height: 16),
// // // // //             ElevatedButton(
// // // // //               onPressed: enableRestrictions
// // // // //                   ? () {
// // // // //                       context.pop();
// // // // //                     }
// // // // //                   : null,
// // // // //               style: ElevatedButton.styleFrom(
// // // // //                 foregroundColor: Colors.white,
// // // // //                 backgroundColor: Colors.blue,
// // // // //                 padding:
// // // // //                     const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
// // // // //                 shape: RoundedRectangleBorder(
// // // // //                   borderRadius: BorderRadius.circular(8),
// // // // //                 ),
// // // // //               ),
// // // // //               child: const Text('Save'),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildInputField(String label, String hint, bool enabled) {
// // // // //     return TextField(
// // // // //       enabled: enabled,
// // // // //       decoration: InputDecoration(
// // // // //         labelText: label,
// // // // //         hintText: hint,
// // // // //         border: OutlineInputBorder(
// // // // //           borderRadius: BorderRadius.circular(8),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildCardBlockRow(bool enabled) {
// // // // //     return Row(
// // // // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //       children: [
// // // // //         _buildCardBlockButton('Block Card', Colors.red, enabled),
// // // // //         _buildCardBlockButton('Unblock Card', Colors.green, enabled),
// // // // //       ],
// // // // //     );
// // // // //   }

// // // // //   Widget _buildCardBlockButton(String label, Color color, bool enabled) {
// // // // //     return ElevatedButton(
// // // // //       onPressed: enabled ? () {} : null,
// // // // //       style: ElevatedButton.styleFrom(
// // // // //         foregroundColor: Colors.white,
// // // // //         backgroundColor: enabled ? color : Colors.grey,
// // // // //         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
// // // // //         shape: RoundedRectangleBorder(
// // // // //           borderRadius: BorderRadius.circular(8),
// // // // //         ),
// // // // //       ),
// // // // //       child: Text(label),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildToggle(
// // // // //       String title, bool value, bool enabled, ValueChanged<bool> onChanged) {
// // // // //     return ListTile(
// // // // //       title: Text(
// // // // //         title,
// // // // //         style: TextStyle(
// // // // //             fontSize: 16,
// // // // //             fontWeight: FontWeight.bold,
// // // // //             color: enabled ? Colors.black : Colors.grey),
// // // // //       ),
// // // // //       trailing: CupertinoSwitch(
// // // // //         value: value,
// // // // //         onChanged: enabled ? onChanged : null,
// // // // //         activeTrackColor: Colors.green,
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildCategoryRestrictions(bool enabled) {
// // // // //     return Column(
// // // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // // //       children: [
// // // // //         Text(
// // // // //           'Category Restrictions',
// // // // //           style: TextStyle(
// // // // //               fontSize: 16,
// // // // //               fontWeight: FontWeight.bold,
// // // // //               color: enabled ? Colors.black : Colors.grey),
// // // // //         ),
// // // // //         const SizedBox(height: 8),
// // // // //         DropdownButtonFormField<String>(
// // // // //           value: null,
// // // // //           hint: const Text('Select category'),
// // // // //           items: categories.map((String category) {
// // // // //             return DropdownMenuItem<String>(
// // // // //               value: category,
// // // // //               child: Text(category),
// // // // //             );
// // // // //           }).toList(),
// // // // //           onChanged: enabled
// // // // //               ? (String? newValue) {
// // // // //                   if (newValue != null &&
// // // // //                       !restrictedCategories.contains(newValue)) {
// // // // //                     setState(() {
// // // // //                       restrictedCategories.add(newValue);
// // // // //                     });
// // // // //                   }
// // // // //                 }
// // // // //               : null,
// // // // //         ),
// // // // //         const SizedBox(height: 8),
// // // // //         Wrap(
// // // // //           spacing: 8.0,
// // // // //           children: restrictedCategories.map((String category) {
// // // // //             return Chip(
// // // // //               label: Text(category),
// // // // //               deleteIcon: const Icon(Icons.close),
// // // // //               onDeleted: () {
// // // // //                 setState(() {
// // // // //                   restrictedCategories.remove(category);
// // // // //                 });
// // // // //               },
// // // // //             );
// // // // //           }).toList(),
// // // // //         ),
// // // // //       ],
// // // // //     );
// // // // //   }
// // // // // }
// // // // import 'package:bkid_frontend/main.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter/cupertino.dart';
// // // // import 'package:go_router/go_router.dart';

// // // // const Color blueBackground = Color(0xFF2675CC); // Blue background
// // // // const Color blueCard = Color(0xFF7CACE0); // Blue card
// // // // const Color blueText = Color(0xFF2575CC); // Blue text
// // // // const Color whiteText = Color(0xFFFFFFFF); // White text
// // // // const Color whitecard = Color(0xFFFFFFFF); // White text

// // // // class RestrictionsPage extends StatefulWidget {
// // // //   const RestrictionsPage({super.key});

// // // //   @override
// // // //   _RestrictionsPageState createState() => _RestrictionsPageState();
// // // // }

// // // // class _RestrictionsPageState extends State<RestrictionsPage> {
// // // //   bool enableRestrictions = false;
// // // //   bool fractionToSaving = false;
// // // //   bool allowOnlinePayment = false;

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: blueBackground,
// // // //       appBar: AppBar(
// // // //         backgroundColor: blueBackground,
// // // //         elevation: 0,
// // // //         leading: IconButton(
// // // //           icon: const Icon(Icons.arrow_back, color: whiteText),
// // // //           onPressed: () => Navigator.pop(context),
// // // //         ),
// // // //         title: const Text(
// // // //           'Restrictions',
// // // //           style: TextStyle(color: whiteText, fontSize: 20),
// // // //         ),
// // // //         centerTitle: true,
// // // //       ),
// // // //       body: Stack(
// // // //         children: [
// // // //           Container(
// // // //             margin: const EdgeInsets.only(top: 20),
// // // //             decoration: const BoxDecoration(
// // // //               color: whitecard,
// // // //               borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
// // // //             ),
// // // //             child: ListView(
// // // //               padding: const EdgeInsets.all(20),
// // // //               children: [
// // // //                 // Enable Restrictions Toggle
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     const Text(
// // // //                       'Enable Restrictions',
// // // //                       style: TextStyle(
// // // //                         fontSize: 18,
// // // //                         fontWeight: FontWeight.w500,
// // // //                       ),
// // // //                     ),
// // // //                     CupertinoSwitch(
// // // //                       value: enableRestrictions,
// // // //                       onChanged: (value) {
// // // //                         setState(() => enableRestrictions = value);
// // // //                       },
// // // //                       activeColor: blueBackground,
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 const Divider(height: 40),

// // // //                 // Daily Spending Limits
// // // //                 const Text(
// // // //                   'Daily spending limits',
// // // //                   style: TextStyle(
// // // //                     fontSize: 16,
// // // //                     color: Colors.grey,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(height: 8),
// // // //                 TextField(
// // // //                   enabled: enableRestrictions,
// // // //                   decoration: InputDecoration(
// // // //                     hintText: 'amount...',
// // // //                     suffixText: 'KD',
// // // //                     border: OutlineInputBorder(
// // // //                       borderRadius: BorderRadius.circular(8),
// // // //                       borderSide: BorderSide(color: Colors.grey.shade300),
// // // //                     ),
// // // //                     enabledBorder: OutlineInputBorder(
// // // //                       borderRadius: BorderRadius.circular(8),
// // // //                       borderSide: BorderSide(color: Colors.grey.shade300),
// // // //                     ),
// // // //                     focusedBorder: OutlineInputBorder(
// // // //                       borderRadius: BorderRadius.circular(8),
// // // //                       borderSide: BorderSide(color: blueBackground),
// // // //                     ),
// // // //                     filled: true,
// // // //                     fillColor: enableRestrictions
// // // //                         ? Colors.white
// // // //                         : Colors.grey.shade100,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(height: 24),

// // // //                 // Block Card Usage
// // // //                 const Text(
// // // //                   'Block the card usage',
// // // //                   style: TextStyle(
// // // //                     fontSize: 16,
// // // //                     color: Colors.grey,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(height: 8),
// // // //                 Row(
// // // //                   children: [
// // // //                     Expanded(
// // // //                       child: Container(
// // // //                         height: 45,
// // // //                         decoration: BoxDecoration(
// // // //                           color: Colors.grey.shade200,
// // // //                           borderRadius: BorderRadius.circular(8),
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                     const SizedBox(width: 8),
// // // //                     const Text(
// // // //                       'until:',
// // // //                       style: TextStyle(color: Colors.grey),
// // // //                     ),
// // // //                     const SizedBox(width: 8),
// // // //                     Expanded(
// // // //                       child: Container(
// // // //                         height: 45,
// // // //                         decoration: BoxDecoration(
// // // //                           color: Colors.grey.shade200,
// // // //                           borderRadius: BorderRadius.circular(8),
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 const SizedBox(height: 24),

// // // //                 // Saving Limits Account
// // // //                 const Text(
// // // //                   'Saving limits account',
// // // //                   style: TextStyle(
// // // //                     fontSize: 16,
// // // //                     color: Colors.grey,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(height: 8),
// // // //                 TextField(
// // // //                   enabled: enableRestrictions,
// // // //                   decoration: InputDecoration(
// // // //                     hintText: 'amount...',
// // // //                     suffixText: 'KD',
// // // //                     border: OutlineInputBorder(
// // // //                       borderRadius: BorderRadius.circular(8),
// // // //                       borderSide: BorderSide(color: Colors.grey.shade300),
// // // //                     ),
// // // //                     enabledBorder: OutlineInputBorder(
// // // //                       borderRadius: BorderRadius.circular(8),
// // // //                       borderSide: BorderSide(color: Colors.grey.shade300),
// // // //                     ),
// // // //                     focusedBorder: OutlineInputBorder(
// // // //                       borderRadius: BorderRadius.circular(8),
// // // //                       borderSide: BorderSide(color: blueBackground),
// // // //                     ),
// // // //                     filled: true,
// // // //                     fillColor: enableRestrictions
// // // //                         ? Colors.white
// // // //                         : Colors.grey.shade100,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(height: 24),

// // // //                 // Fraction to Saving Toggle
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     const Text(
// // // //                       'Fraction to saving',
// // // //                       style: TextStyle(
// // // //                         fontSize: 16,
// // // //                         color: Colors.grey,
// // // //                       ),
// // // //                     ),
// // // //                     CupertinoSwitch(
// // // //                       value: fractionToSaving,
// // // //                       onChanged: enableRestrictions
// // // //                           ? (value) {
// // // //                               setState(() => fractionToSaving = value);
// // // //                             }
// // // //                           : null,
// // // //                       activeColor: blueBackground,
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 const SizedBox(height: 24),

// // // //                 // Allow Online Payment Toggle
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     const Text(
// // // //                       'Allow online payment',
// // // //                       style: TextStyle(
// // // //                         fontSize: 16,
// // // //                         color: Colors.grey,
// // // //                       ),
// // // //                     ),
// // // //                     CupertinoSwitch(
// // // //                       value: allowOnlinePayment,
// // // //                       onChanged: enableRestrictions
// // // //                           ? (value) {
// // // //                               setState(() => allowOnlinePayment = value);
// // // //                             }
// // // //                           : null,
// // // //                       activeColor: blueBackground,
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 const SizedBox(height: 24),

// // // //                 // Category Restrictions
// // // //                 const Text(
// // // //                   'Category Restrictions',
// // // //                   style: TextStyle(
// // // //                     fontSize: 16,
// // // //                     color: Colors.grey,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(height: 16),
// // // //                 Wrap(
// // // //                   spacing: 8,
// // // //                   children: [
// // // //                     _buildCategoryChip('Education and Learning'),
// // // //                     _buildCategoryChip('Electronics and Gadgets'),
// // // //                   ],
// // // //                 ),
// // // //                 const SizedBox(height: 40),

// // // //                 // Save Button
// // // //                 SizedBox(
// // // //                   width: double.infinity,
// // // //                   height: 50,
// // // //                   child: ElevatedButton(
// // // //                     onPressed: enableRestrictions ? () => context.pop() : null,
// // // //                     style: ElevatedButton.styleFrom(
// // // //                       backgroundColor: blueBackground,
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(25),
// // // //                       ),
// // // //                     ),
// // // //                     child: const Text(
// // // //                       'Save',
// // // //                       style: TextStyle(
// // // //                         color: whiteText,
// // // //                         fontSize: 16,
// // // //                         fontWeight: FontWeight.w500,
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(height: 20),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildCategoryChip(String label) {
// // // //     return Chip(
// // // //       label: Text(
// // // //         label,
// // // //         style: const TextStyle(color: Colors.grey),
// // // //       ),
// // // //       backgroundColor: Colors.grey.shade200,
// // // //       deleteIcon: const Icon(Icons.close, size: 18),
// // // //       onDeleted: () {},
// // // //       shape: RoundedRectangleBorder(
// // // //         borderRadius: BorderRadius.circular(20),
// // // //       ),
// // // //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // // //     );
// // // //   }
// // // // }

// // // // void main() {
// // // //   runApp(MaterialApp(
// // // //     debugShowCheckedModeBanner: false,
// // // //     home: RestrictionsPage(),
// // // //     theme: ThemeData(
// // // //       primaryColor: blueBackground,
// // // //       scaffoldBackgroundColor: blueBackground,
// // // //     ),
// // // //   ));
// // // // }
// // // import 'package:bkid_frontend/main.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/cupertino.dart';
// // // import 'package:go_router/go_router.dart';

// // // const Color blueBackground = Color(0xFF2675CC); // Blue background
// // // const Color blueCard = Color(0xFF7CACE0); // Blue card
// // // const Color blueText = Color(0xFF2575CC); // Blue text
// // // const Color whiteText = Color(0xFFFFFFFF); // White text
// // // const Color whitecard = Color(0xFFFFFFFF); // White text

// // // class RestrictionsPage extends StatefulWidget {
// // //   const RestrictionsPage({super.key});

// // //   @override
// // //   _RestrictionsPageState createState() => _RestrictionsPageState();
// // // }

// // // class _RestrictionsPageState extends State<RestrictionsPage> {
// // //   bool enableRestrictions = true;
// // //   bool fractionToSaving = true;
// // //   bool allowOnlinePayment = true;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: blueBackground,
// // //       appBar: AppBar(
// // //         backgroundColor: blueBackground,
// // //         elevation: 0,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back, color: whiteText),
// // //           onPressed: () => Navigator.pop(context),
// // //         ),
// // //         title: const Text(
// // //           'Restrictions',
// // //           style: TextStyle(color: whiteText, fontSize: 20),
// // //         ),
// // //         centerTitle: true,
// // //       ),
// // //       body: Stack(
// // //         children: [
// // //           Container(
// // //             margin: const EdgeInsets.only(top: 20),
// // //             decoration: const BoxDecoration(
// // //               color: whitecard,
// // //               borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
// // //             ),
// // //             child: ListView(
// // //               padding: const EdgeInsets.all(20),
// // //               children: [
// // //                 // Enable Restrictions Toggle
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     const Text(
// // //                       'Enable Restrictions',
// // //                       style: TextStyle(
// // //                         fontSize: 18,
// // //                         fontWeight: FontWeight.w500,
// // //                       ),
// // //                     ),
// // //                     CupertinoSwitch(
// // //                       value: enableRestrictions,
// // //                       onChanged: (value) {
// // //                         setState(() => enableRestrictions = value);
// // //                       },
// // //                       activeColor: Colors.green,
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const Divider(height: 40),

// // //                 // Daily Spending Limits
// // //                 const Text(
// // //                   'Daily spending limits',
// // //                   style: TextStyle(
// // //                     fontSize: 16,
// // //                     color: Colors.black,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 8),
// // //                 TextField(
// // //                   enabled: enableRestrictions,
// // //                   decoration: InputDecoration(
// // //                     hintText: 'amount...',
// // //                     suffixText: 'KD',
// // //                     border: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(8),
// // //                       borderSide: BorderSide(color: Colors.grey.shade300),
// // //                     ),
// // //                     enabledBorder: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(8),
// // //                       borderSide: BorderSide(color: Colors.grey.shade300),
// // //                     ),
// // //                     focusedBorder: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(8),
// // //                       borderSide: BorderSide(color: blueBackground),
// // //                     ),
// // //                     filled: true,
// // //                     fillColor: enableRestrictions
// // //                         ? Colors.white
// // //                         : Colors.grey.shade100,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 24),

// // //                 // Block Card Usage
// // //                 const Text(
// // //                   'Block the card usage',
// // //                   style: TextStyle(
// // //                     fontSize: 16,
// // //                     color: Colors.black,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 8),
// // //                 Row(
// // //                   children: [
// // //                     Expanded(
// // //                       child: Container(
// // //                         height: 45,
// // //                         decoration: BoxDecoration(
// // //                           color: Colors.grey.shade200,
// // //                           borderRadius: BorderRadius.circular(8),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                     const SizedBox(width: 8),
// // //                     const Text(
// // //                       'until:',
// // //                       style: TextStyle(color: Colors.black),
// // //                     ),
// // //                     const SizedBox(width: 8),
// // //                     Expanded(
// // //                       child: Container(
// // //                         height: 45,
// // //                         decoration: BoxDecoration(
// // //                           color: Colors.grey.shade200,
// // //                           borderRadius: BorderRadius.circular(8),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 24),

// // //                 // Saving Limits Account
// // //                 const Text(
// // //                   'Saving limits account',
// // //                   style: TextStyle(
// // //                     fontSize: 16,
// // //                     color: Colors.black,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 8),
// // //                 TextField(
// // //                   enabled: enableRestrictions,
// // //                   decoration: InputDecoration(
// // //                     hintText: 'amount...',
// // //                     suffixText: 'KD',
// // //                     border: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(8),
// // //                       borderSide: BorderSide(color: Colors.grey.shade300),
// // //                     ),
// // //                     enabledBorder: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(8),
// // //                       borderSide: BorderSide(color: Colors.grey.shade300),
// // //                     ),
// // //                     focusedBorder: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(8),
// // //                       borderSide: BorderSide(color: blueBackground),
// // //                     ),
// // //                     filled: true,
// // //                     fillColor: enableRestrictions
// // //                         ? Colors.white
// // //                         : Colors.grey.shade100,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 24),

// // //                 // Fraction to Saving Toggle
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     const Text(
// // //                       'Fraction to saving',
// // //                       style: TextStyle(
// // //                         fontSize: 16,
// // //                         color: Colors.black,
// // //                       ),
// // //                     ),
// // //                     CupertinoSwitch(
// // //                       value: fractionToSaving,
// // //                       onChanged: enableRestrictions
// // //                           ? (value) {
// // //                               setState(() => fractionToSaving = value);
// // //                             }
// // //                           : null,
// // //                       activeColor: Colors.green,
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 24),

// // //                 // Allow Online Payment Toggle
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     const Text(
// // //                       'Allow online payment',
// // //                       style: TextStyle(
// // //                         fontSize: 16,
// // //                         color: Colors.black,
// // //                       ),
// // //                     ),
// // //                     CupertinoSwitch(
// // //                       value: allowOnlinePayment,
// // //                       onChanged: enableRestrictions
// // //                           ? (value) {
// // //                               setState(() => allowOnlinePayment = value);
// // //                             }
// // //                           : null,
// // //                       activeColor: Colors.green,
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 24),

// // //                 // Category Restrictions
// // //                 const Text(
// // //                   'Category Restrictions',
// // //                   style: TextStyle(
// // //                     fontSize: 16,
// // //                     color: Colors.black,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 16),
// // //                 Wrap(
// // //                   spacing: 8,
// // //                   children: [
// // //                     _buildCategoryChip('Education and Learning'),
// // //                     _buildCategoryChip('Electronics and Gadgets'),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 40),

// // //                 // Save Button
// // //                 SizedBox(
// // //                   width: double.infinity,
// // //                   height: 50,
// // //                   child: ElevatedButton(
// // //                     onPressed: enableRestrictions ? () => context.pop() : null,
// // //                     style: ElevatedButton.styleFrom(
// // //                       backgroundColor: blueBackground,
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(25),
// // //                       ),
// // //                     ),
// // //                     child: const Text(
// // //                       'Save',
// // //                       style: TextStyle(
// // //                         color: whiteText,
// // //                         fontSize: 16,
// // //                         fontWeight: FontWeight.w500,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 20),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildCategoryChip(String label) {
// // //     return Chip(
// // //       label: Text(
// // //         label,
// // //         style: const TextStyle(color: Colors.grey),
// // //       ),
// // //       backgroundColor: Colors.grey.shade200,
// // //       deleteIcon: const Icon(Icons.close, size: 18),
// // //       onDeleted: () {},
// // //       shape: RoundedRectangleBorder(
// // //         borderRadius: BorderRadius.circular(20),
// // //       ),
// // //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // //     );
// // //   }
// // // }

// // // void main() {
// // //   runApp(MaterialApp(
// // //     debugShowCheckedModeBanner: false,
// // //     home: RestrictionsPage(),
// // //     theme: ThemeData(
// // //       primaryColor: blueBackground,
// // //       scaffoldBackgroundColor: blueBackground,
// // //     ),
// // //   ));
// // // }
// // import 'package:bkid_frontend/main.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:go_router/go_router.dart';

// // const Color blueBackground = Color(0xFF2675CC); // Blue background
// // const Color blueCard = Color(0xFF7CACE0); // Blue card
// // const Color blueText = Color(0xFF2575CC); // Blue text
// // const Color whiteText = Color(0xFFFFFFFF); // White text
// // const Color whitecard = Color(0xFFFFFFFF); // White text

// // class RestrictionsPage extends StatefulWidget {
// //   const RestrictionsPage({super.key});

// //   @override
// //   _RestrictionsPageState createState() => _RestrictionsPageState();
// // }

// // class _RestrictionsPageState extends State<RestrictionsPage> {
// //   bool enableRestrictions = true;
// //   bool fractionToSaving = true;
// //   bool allowOnlinePayment = true;

// //   List<String> categories = [
// //     'Education and Learning',
// //     'Electronics and Gadgets'
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: blueBackground,
// //       appBar: AppBar(
// //         backgroundColor: blueBackground,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: whiteText),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         title: const Text(
// //           'Restrictions',
// //           style: TextStyle(color: whiteText, fontSize: 20),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: Stack(
// //         children: [
// //           Container(
// //             margin: const EdgeInsets.only(top: 20),
// //             decoration: const BoxDecoration(
// //               color: whitecard,
// //               borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
// //             ),
// //             child: ListView(
// //               padding: const EdgeInsets.all(20),
// //               children: [
// //                 // Enable Restrictions Toggle
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     const Text(
// //                       'Enable Restrictions',
// //                       style: TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.w500,
// //                       ),
// //                     ),
// //                     CupertinoSwitch(
// //                       value: enableRestrictions,
// //                       onChanged: (value) {
// //                         setState(() => enableRestrictions = value);
// //                       },
// //                       activeColor: Colors.green,
// //                     ),
// //                   ],
// //                 ),
// //                 const Divider(height: 40),

// //                 // Daily Spending Limits
// //                 const Text(
// //                   'Daily spending limits',
// //                   style: TextStyle(
// //                     fontSize: 16,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 8),
// //                 TextField(
// //                   enabled: enableRestrictions,
// //                   decoration: InputDecoration(
// //                     hintText: 'amount...',
// //                     suffixText: 'KD',
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                       borderSide: BorderSide(color: Colors.grey.shade300),
// //                     ),
// //                     enabledBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                       borderSide: BorderSide(color: Colors.grey.shade300),
// //                     ),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                       borderSide: BorderSide(color: blueBackground),
// //                     ),
// //                     filled: true,
// //                     fillColor: enableRestrictions
// //                         ? Colors.white
// //                         : Colors.grey.shade100,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 24),

// //                 // Block Card Usage
// //                 const Text(
// //                   'Block the card usage',
// //                   style: TextStyle(
// //                     fontSize: 16,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 8),
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: Container(
// //                         height: 45,
// //                         decoration: BoxDecoration(
// //                           color: Colors.grey.shade200,
// //                           borderRadius: BorderRadius.circular(8),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(width: 8),
// //                     const Text(
// //                       'until:',
// //                       style: TextStyle(color: Colors.black),
// //                     ),
// //                     const SizedBox(width: 8),
// //                     Expanded(
// //                       child: Container(
// //                         height: 45,
// //                         decoration: BoxDecoration(
// //                           color: Colors.grey.shade200,
// //                           borderRadius: BorderRadius.circular(8),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 24),

// //                 // Saving Limits Account
// //                 const Text(
// //                   'Saving limits account',
// //                   style: TextStyle(
// //                     fontSize: 16,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 8),
// //                 TextField(
// //                   enabled: enableRestrictions,
// //                   decoration: InputDecoration(
// //                     hintText: 'amount...',
// //                     suffixText: 'KD',
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                       borderSide: BorderSide(color: Colors.grey.shade300),
// //                     ),
// //                     enabledBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                       borderSide: BorderSide(color: Colors.grey.shade300),
// //                     ),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                       borderSide: BorderSide(color: blueBackground),
// //                     ),
// //                     filled: true,
// //                     fillColor: enableRestrictions
// //                         ? Colors.white
// //                         : Colors.grey.shade100,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 24),

// //                 // Fraction to Saving Toggle
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     const Text(
// //                       'Fraction to saving',
// //                       style: TextStyle(
// //                         fontSize: 16,
// //                         color: Colors.black,
// //                       ),
// //                     ),
// //                     CupertinoSwitch(
// //                       value: fractionToSaving,
// //                       onChanged: enableRestrictions
// //                           ? (value) {
// //                               setState(() => fractionToSaving = value);
// //                             }
// //                           : null,
// //                       activeColor: Colors.green,
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 24),

// //                 // Allow Online Payment Toggle
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     const Text(
// //                       'Allow online payment',
// //                       style: TextStyle(
// //                         fontSize: 16,
// //                         color: Colors.black,
// //                       ),
// //                     ),
// //                     CupertinoSwitch(
// //                       value: allowOnlinePayment,
// //                       onChanged: enableRestrictions
// //                           ? (value) {
// //                               setState(() => allowOnlinePayment = value);
// //                             }
// //                           : null,
// //                       activeColor: Colors.green,
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 24),

// //                 // Category Restrictions
// //                 const Text(
// //                   'Category Restrictions',
// //                   style: TextStyle(
// //                     fontSize: 16,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 16),
// //                 Wrap(
// //                   spacing: 8,
// //                   children: categories.map((category) {
// //                     return _buildCategoryChip(category);
// //                   }).toList(),
// //                 ),
// //                 const SizedBox(height: 40),

// //                 // Save Button
// //                 SizedBox(
// //                   width: double.infinity,
// //                   height: 50,
// //                   child: ElevatedButton(
// //                     onPressed: enableRestrictions ? () => context.pop() : null,
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: blueBackground,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(25),
// //                       ),
// //                     ),
// //                     child: const Text(
// //                       'Save',
// //                       style: TextStyle(
// //                         color: whiteText,
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.w500,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildCategoryChip(String label) {
// //     return Chip(
// //       label: Text(
// //         label,
// //         style: const TextStyle(color: Colors.grey),
// //       ),
// //       backgroundColor: Colors.grey.shade200,
// //       deleteIcon: const Icon(Icons.close, size: 18),
// //       onDeleted: () {
// //         setState(() {
// //           categories.remove(label);
// //         });
// //       },
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(20),
// //       ),
// //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// //     );
// //   }
// // }

// // void main() {
// //   runApp(MaterialApp(
// //     debugShowCheckedModeBanner: false,
// //     home: RestrictionsPage(),
// //     theme: ThemeData(
// //       primaryColor: blueBackground,
// //       scaffoldBackgroundColor: blueBackground,
// //     ),
// //   ));
// // }
// import 'package:bkid_frontend/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:go_router/go_router.dart';

// const Color blueBackground = Color(0xFF2675CC); // Blue background
// const Color blueCard = Color(0xFF7CACE0); // Blue card
// const Color blueText = Color(0xFF2575CC); // Blue text
// const Color whiteText = Color(0xFFFFFFFF); // White text
// const Color whitecard = Color(0xFFFFFFFF); // White text

// class RestrictionsPage extends StatefulWidget {
//   const RestrictionsPage({super.key});

//   @override
//   _RestrictionsPageState createState() => _RestrictionsPageState();
// }

// class _RestrictionsPageState extends State<RestrictionsPage> {
//   bool enableRestrictions = true;
//   bool fractionToSaving = true;
//   bool allowOnlinePayment = true;

//   List<String> categories = [
//     'Education and Learning',
//     'Electronics and Gadgets'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: blueBackground,
//       appBar: AppBar(
//         backgroundColor: blueBackground,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: whiteText),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Restrictions',
//           style: TextStyle(color: whiteText, fontSize: 20),
//         ),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 20),
//             decoration: const BoxDecoration(
//               color: whitecard,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
//             ),
//             child: ListView(
//               padding: const EdgeInsets.all(20),
//               children: [
//                 // Enable Restrictions Toggle
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Enable Restrictions',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     CupertinoSwitch(
//                       value: enableRestrictions,
//                       onChanged: (value) {
//                         setState(() => enableRestrictions = value);
//                       },
//                       activeColor: Colors.green,
//                     ),
//                   ],
//                 ),
//                 const Divider(height: 40),

//                 // Daily Spending Limits
//                 const Text(
//                   'Daily spending limits',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   enabled: enableRestrictions,
//                   decoration: InputDecoration(
//                     hintText: 'amount...',
//                     suffixText: 'KD',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: Colors.grey.shade300),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: Colors.grey.shade300),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: blueBackground),
//                     ),
//                     filled: true,
//                     fillColor: enableRestrictions
//                         ? Colors.white
//                         : Colors.grey.shade100,
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 // Block Card Usage
//                 const Text(
//                   'Block the card usage',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 45,
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     const Text(
//                       'until:',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: Container(
//                         height: 45,
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 24),

//                 // Saving Limits Account
//                 const Text(
//                   'Saving limits account',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   enabled: enableRestrictions,
//                   decoration: InputDecoration(
//                     hintText: 'amount...',
//                     suffixText: 'KD',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: Colors.grey.shade300),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: Colors.grey.shade300),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: blueBackground),
//                     ),
//                     filled: true,
//                     fillColor: enableRestrictions
//                         ? Colors.white
//                         : Colors.grey.shade100,
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 // Fraction to Saving Toggle
//                 _buildToggle(
//                   'Fraction to saving',
//                   fractionToSaving,
//                   enableRestrictions,
//                   (value) {
//                     setState(() => fractionToSaving = value);
//                   },
//                 ),
//                 const SizedBox(height: 24),

//                 // Allow Online Payment Toggle
//                 _buildToggle(
//                   'Allow online payment',
//                   allowOnlinePayment,
//                   enableRestrictions,
//                   (value) {
//                     setState(() => allowOnlinePayment = value);
//                   },
//                 ),
//                 const SizedBox(height: 24),

//                 // Category Restrictions
//                 const Text(
//                   'Category Restrictions',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Wrap(
//                   spacing: 8,
//                   children: categories.map((category) {
//                     return _buildCategoryChip(category);
//                   }).toList(),
//                 ),
//                 const SizedBox(height: 40),

//                 // Save Button
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: enableRestrictions ? () => context.pop() : null,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: blueBackground,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                     child: const Text(
//                       'Save',
//                       style: TextStyle(
//                         color: whiteText,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildToggle(
//       String title, bool value, bool enabled, ValueChanged<bool> onChanged) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 16,
//             color: enabled ? Colors.black : Colors.grey,
//           ),
//         ),
//         CupertinoSwitch(
//           value: value,
//           onChanged: enabled ? onChanged : null,
//           activeColor: Colors.green,
//           trackColor: Colors.grey,
//         ),
//       ],
//     );
//   }

//   Widget _buildCategoryChip(String label) {
//     return Chip(
//       label: Text(
//         label,
//         style: const TextStyle(color: Colors.grey),
//       ),
//       backgroundColor: Colors.grey.shade200,
//       deleteIcon: const Icon(Icons.close, size: 18),
//       onDeleted: () {
//         setState(() {
//           categories.remove(label);
//         });
//       },
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: RestrictionsPage(),
//     theme: ThemeData(
//       primaryColor: blueBackground,
//       scaffoldBackgroundColor: blueBackground,
//     ),
//   ));
// }
import 'package:bkid_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

const Color blueBackground = Color(0xFF2675CC); // Blue background
const Color blueCard = Color(0xFF7CACE0); // Blue card
const Color blueText = Color(0xFF2575CC); // Blue text
const Color whiteText = Color(0xFFFFFFFF); // White text
const Color whitecard = Color(0xFFFFFFFF); // White text

class RestrictionsPage extends StatefulWidget {
  const RestrictionsPage({super.key});

  @override
  _RestrictionsPageState createState() => _RestrictionsPageState();
}

class _RestrictionsPageState extends State<RestrictionsPage> {
  bool enableRestrictions = true;
  bool fractionToSaving = true;
  bool allowOnlinePayment = true;

  List<String> categories = [
    'Education and Learning',
    'Electronics and Gadgets'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueBackground,
      appBar: AppBar(
        backgroundColor: blueBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: whiteText),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Restrictions',
          style: TextStyle(color: whiteText, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: whitecard,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Enable Restrictions Toggle
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Enable Restrictions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CupertinoSwitch(
                      value: enableRestrictions,
                      onChanged: (value) {
                        setState(() => enableRestrictions = value);
                      },
                      activeColor: Colors.green,
                    ),
                  ],
                ),
                const Divider(height: 40),

                // Daily Spending Limits
                const Text(
                  'Daily spending limits',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  enabled: enableRestrictions,
                  decoration: InputDecoration(
                    hintText: 'amount...',
                    suffixText: 'KD',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: blueBackground),
                    ),
                    filled: true,
                    fillColor: enableRestrictions
                        ? Colors.white
                        : Colors.grey.shade100,
                  ),
                ),
                const SizedBox(height: 24),

                // Block Card Usage
                const Text(
                  'Block the card usage',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'until:',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Saving Limits Account
                const Text(
                  'Saving limits account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  enabled: enableRestrictions,
                  decoration: InputDecoration(
                    hintText: 'amount...',
                    suffixText: 'KD',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: blueBackground),
                    ),
                    filled: true,
                    fillColor: enableRestrictions
                        ? Colors.white
                        : Colors.grey.shade100,
                  ),
                ),
                const SizedBox(height: 24),

                // Fraction to Saving Toggle
                _buildToggle(
                  'Fraction to saving',
                  fractionToSaving,
                  enableRestrictions && fractionToSaving,
                  (value) {
                    setState(() => fractionToSaving = value);
                  },
                ),
                const SizedBox(height: 24),

                // Allow Online Payment Toggle
                _buildToggle(
                  'Allow online payment',
                  allowOnlinePayment,
                  enableRestrictions && allowOnlinePayment,
                  (value) {
                    setState(() => allowOnlinePayment = value);
                  },
                ),
                const SizedBox(height: 24),

                // Category Restrictions
                const Text(
                  'Category Restrictions',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  children: categories.map((category) {
                    return _buildCategoryChip(category);
                  }).toList(),
                ),
                const SizedBox(height: 40),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: enableRestrictions ? () => context.pop() : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blueBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: whiteText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggle(
      String title, bool value, bool enabled, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: enabled ? Colors.black : Colors.grey,
          ),
        ),
        CupertinoSwitch(
          value: value,
          onChanged: enabled ? onChanged : null,
          activeColor: Colors.green,
          trackColor: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.grey),
      ),
      backgroundColor: Colors.grey.shade200,
      deleteIcon: const Icon(Icons.close, size: 18),
      onDeleted: () {
        setState(() {
          categories.remove(label);
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RestrictionsPage(),
    theme: ThemeData(
      primaryColor: blueBackground,
      scaffoldBackgroundColor: blueBackground,
    ),
  ));
}
