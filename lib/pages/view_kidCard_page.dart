// // // // // // import 'package:bkid_frontend/pages/allowance_dialogue.dart';
// // // // // // import 'package:bkid_frontend/pages/goals_page.dart';
// // // // // // import 'package:bkid_frontend/pages/restrictions_page.dart';
// // // // // // import 'package:bkid_frontend/pages/tasks_page.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:go_router/go_router.dart';

// // // // // // class ViewKidCard extends StatelessWidget {
// // // // // //   final Map<String, dynamic> kid;

// // // // // //   const ViewKidCard({super.key, required this.kid});

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       backgroundColor: Colors.blue,
// // // // // //       appBar: AppBar(
// // // // // //         backgroundColor: Colors.blue,
// // // // // //         elevation: 0,
// // // // // //         leading: IconButton(
// // // // // //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // //           onPressed: () {
// // // // // //             Navigator.pop(context);
// // // // // //           },
// // // // // //         ),
// // // // // //         actions: [
// // // // // //           IconButton(
// // // // // //             icon: const Icon(Icons.notifications, color: Colors.white),
// // // // // //             onPressed: () {},
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //       body: SingleChildScrollView(
// // // // // //         child: Column(
// // // // // //           children: [
// // // // // //             Padding(
// // // // // //               padding: const EdgeInsets.all(16.0),
// // // // // //               child: Container(
// // // // // //                 padding: const EdgeInsets.all(16),
// // // // // //                 decoration: BoxDecoration(
// // // // // //                   color: Colors.white,
// // // // // //                   borderRadius: BorderRadius.circular(16),
// // // // // //                 ),
// // // // // //                 child: Column(
// // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                   children: [
// // // // // //                     Row(
// // // // // //                       children: [
// // // // // //                         const CircleAvatar(
// // // // // //                           radius: 30,
// // // // // //                           backgroundImage: AssetImage('assets/kid_image.png'),
// // // // // //                         ),
// // // // // //                         const SizedBox(width: 16),
// // // // // //                         Column(
// // // // // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                           children: [
// // // // // //                             Text(
// // // // // //                               kid['Kname'] ?? 'Unknown',
// // // // // //                               style: const TextStyle(
// // // // // //                                 fontSize: 20,
// // // // // //                                 fontWeight: FontWeight.bold,
// // // // // //                                 color: Colors.blue,
// // // // // //                               ),
// // // // // //                             ),
// // // // // //                             const Text(
// // // // // //                               '1234 5678 XXXX XXXX',
// // // // // //                               style: TextStyle(
// // // // // //                                 fontSize: 16,
// // // // // //                                 color: Colors.grey,
// // // // // //                               ),
// // // // // //                             ),
// // // // // //                           ],
// // // // // //                         ),
// // // // // //                         const Spacer(),
// // // // // //                         const Icon(Icons.qr_code, color: Colors.blue),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 16),
// // // // // //                     Row(
// // // // // //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //                       children: [
// // // // // //                         _buildInfoColumn('Balance',
// // // // // //                             '${kid['balance'] ?? 0.0} KWD', Colors.blue),
// // // // // //                         _buildInfoColumn('Savings',
// // // // // //                             '${kid['savings'] ?? 0.0} KWD', Colors.blue),
// // // // // //                         _buildInfoColumn(
// // // // // //                             'Steps', '${kid['steps'] ?? 0}', Colors.blue),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //             Padding(
// // // // // //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // // // //               child: Row(
// // // // // //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // // //                 children: [
// // // // // //                   GestureDetector(
// // // // // //                     onTap: () {
// // // // // //                       context.push('/tasks');
// // // // // //                     },
// // // // // //                     child: const Column(
// // // // // //                       children: [
// // // // // //                         CircleAvatar(
// // // // // //                           radius: 30,
// // // // // //                           backgroundColor: Colors.white,
// // // // // //                           child: Icon(Icons.checklist,
// // // // // //                               color: Colors.blue, size: 30),
// // // // // //                         ),
// // // // // //                         SizedBox(height: 8),
// // // // // //                         Text(
// // // // // //                           'Tasks',
// // // // // //                           style: TextStyle(
// // // // // //                             color: Colors.white,
// // // // // //                             fontSize: 14,
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   GestureDetector(
// // // // // //                     onTap: () {
// // // // // //                       showDialog(
// // // // // //                         context: context,
// // // // // //                         builder: (BuildContext context) {
// // // // // //                           return AllowanceDialog();
// // // // // //                         },
// // // // // //                       );
// // // // // //                     },
// // // // // //                     child: const Column(
// // // // // //                       children: [
// // // // // //                         CircleAvatar(
// // // // // //                           radius: 30,
// // // // // //                           backgroundColor: Colors.white,
// // // // // //                           child:
// // // // // //                               Icon(Icons.money, color: Colors.blue, size: 30),
// // // // // //                         ),
// // // // // //                         SizedBox(height: 8),
// // // // // //                         Text(
// // // // // //                           'Allowance',
// // // // // //                           style: TextStyle(
// // // // // //                             color: Colors.white,
// // // // // //                             fontSize: 14,
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   GestureDetector(
// // // // // //                     onTap: () {
// // // // // //                       context.push('/restriction');
// // // // // //                     },
// // // // // //                     child: const Column(
// // // // // //                       children: [
// // // // // //                         CircleAvatar(
// // // // // //                           radius: 30,
// // // // // //                           backgroundColor: Colors.white,
// // // // // //                           child:
// // // // // //                               Icon(Icons.shield, color: Colors.blue, size: 30),
// // // // // //                         ),
// // // // // //                         SizedBox(height: 8),
// // // // // //                         Text(
// // // // // //                           'Restriction',
// // // // // //                           style: TextStyle(
// // // // // //                             color: Colors.white,
// // // // // //                             fontSize: 14,
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   GestureDetector(
// // // // // //                     onTap: () {
// // // // // //                       context.push('/goals', extra: kid['Kname']);
// // // // // //                     },
// // // // // //                     child: const Column(
// // // // // //                       children: [
// // // // // //                         CircleAvatar(
// // // // // //                           radius: 30,
// // // // // //                           backgroundColor: Colors.white,
// // // // // //                           child: Icon(Icons.flag, color: Colors.blue, size: 30),
// // // // // //                         ),
// // // // // //                         SizedBox(height: 8),
// // // // // //                         Text(
// // // // // //                           'Goals',
// // // // // //                           style: TextStyle(
// // // // // //                             color: Colors.white,
// // // // // //                             fontSize: 14,
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 16),
// // // // // //             const Padding(
// // // // // //               padding: EdgeInsets.symmetric(horizontal: 16.0),
// // // // // //               child: Align(
// // // // // //                 alignment: Alignment.centerLeft,
// // // // // //                 child: Text(
// // // // // //                   'Redeem points:',
// // // // // //                   style: TextStyle(
// // // // // //                     fontSize: 18,
// // // // // //                     fontWeight: FontWeight.bold,
// // // // // //                     color: Colors.white,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 8),
// // // // // //             ..._buildRewardCards(),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   Widget _buildInfoColumn(String title, String value, Color color) {
// // // // // //     return Column(
// // // // // //       children: [
// // // // // //         Text(
// // // // // //           value,
// // // // // //           style: TextStyle(
// // // // // //             fontSize: 18,
// // // // // //             fontWeight: FontWeight.bold,
// // // // // //             color: color,
// // // // // //           ),
// // // // // //         ),
// // // // // //         Text(
// // // // // //           title,
// // // // // //           style: const TextStyle(
// // // // // //             fontSize: 14,
// // // // // //             color: Colors.grey,
// // // // // //           ),
// // // // // //         ),
// // // // // //       ],
// // // // // //     );
// // // // // //   }

// // // // // //   List<Widget> _buildRewardCards() {
// // // // // //     final List<Map<String, dynamic>> rewards = [
// // // // // //       // {'title': 'dabdoob', 'points': '3213/1500', 'color': Colors.green},
// // // // // //       // {'title': 'Kidzania', 'points': '3213/3000', 'color': Colors.green},
// // // // // //       // {'title': 'SEPHORA', 'points': '3213/4000', 'color': Colors.red},
// // // // // //     ];

// // // // // //     return rewards.map((Map<String, dynamic> reward) {
// // // // // //       return Padding(
// // // // // //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// // // // // //         child: Container(
// // // // // //           padding: const EdgeInsets.all(16),
// // // // // //           decoration: BoxDecoration(
// // // // // //             color: reward['color'],
// // // // // //             borderRadius: BorderRadius.circular(12),
// // // // // //           ),
// // // // // //           child: Column(
// // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //             children: [
// // // // // //               Text(
// // // // // //                 reward['title'],
// // // // // //                 style: const TextStyle(
// // // // // //                   color: Colors.white,
// // // // // //                   fontSize: 18,
// // // // // //                   fontWeight: FontWeight.bold,
// // // // // //                 ),
// // // // // //               ),
// // // // // //               const SizedBox(height: 8),
// // // // // //               Text(
// // // // // //                 reward['points'],
// // // // // //                 style: const TextStyle(
// // // // // //                   color: Colors.white,
// // // // // //                   fontSize: 14,
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //         ),
// // // // // //       );
// // // // // //     }).toList();
// // // // // //   }
// // // // // // }
// // // // // import 'package:bkid_frontend/pages/allowance_dialogue.dart';
// // // // // import 'package:bkid_frontend/pages/goals_page.dart';
// // // // // import 'package:bkid_frontend/pages/restrictions_page.dart';
// // // // // import 'package:bkid_frontend/pages/tasks_page.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:go_router/go_router.dart';

// // // // // class ViewKidCard extends StatelessWidget {
// // // // //   final Map<String, dynamic> kid;

// // // // //   const ViewKidCard({super.key, required this.kid});

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       backgroundColor: blueBackground,
// // // // //       appBar: AppBar(
// // // // //         backgroundColor: blueBackground,
// // // // //         elevation: 0,
// // // // //         leading: IconButton(
// // // // //           icon: const Icon(Icons.arrow_back, color: whiteText),
// // // // //           onPressed: () {
// // // // //             Navigator.pop(context);
// // // // //           },
// // // // //         ),
// // // // //         actions: [
// // // // //           IconButton(
// // // // //             icon: const Icon(Icons.notifications, color: whiteText),
// // // // //             onPressed: () {},
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //       body: SingleChildScrollView(
// // // // //         child: Column(
// // // // //           children: [
// // // // //             Padding(
// // // // //               padding: const EdgeInsets.all(16.0),
// // // // //               child: Stack(
// // // // //                 children: [
// // // // //                   Container(
// // // // //                     padding: const EdgeInsets.all(16),
// // // // //                     decoration: BoxDecoration(
// // // // //                       color: whitecard,
// // // // //                       borderRadius: BorderRadius.circular(16),
// // // // //                     ),
// // // // //                     child: Column(
// // // // //                       crossAxisAlignment: CrossAxisAlignment.center,
// // // // //                       children: [
// // // // //                         const SizedBox(height: 40),
// // // // //                         Text(
// // // // //                           '1234 5678 XXXX XXXX',
// // // // //                           style: const TextStyle(
// // // // //                             fontSize: 16,
// // // // //                             color: Colors.grey,
// // // // //                           ),
// // // // //                         ),
// // // // //                         const SizedBox(height: 16),
// // // // //                         Text(
// // // // //                           '${kid['balance'] ?? 0.0} KWD',
// // // // //                           style: const TextStyle(
// // // // //                             fontSize: 20,
// // // // //                             fontWeight: FontWeight.bold,
// // // // //                             color: blueText,
// // // // //                           ),
// // // // //                         ),
// // // // //                         const Divider(color: Colors.grey),
// // // // //                         Row(
// // // // //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // //                           children: [
// // // // //                             _buildInfoColumn('Points', '3213', blueText),
// // // // //                             _buildInfoColumn('Savings',
// // // // //                                 '${kid['savings'] ?? 0.0} KWD', blueText),
// // // // //                             _buildInfoColumn(
// // // // //                                 'Steps', '${kid['steps'] ?? 0}', blueText),
// // // // //                           ],
// // // // //                         ),
// // // // //                       ],
// // // // //                     ),
// // // // //                   ),
// // // // //                   Positioned(
// // // // //                     top: -20,
// // // // //                     left: -20,
// // // // //                     child: const CircleAvatar(
// // // // //                       radius: 30,
// // // // //                       backgroundImage: AssetImage('assets/kid_image.png'),
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //             Padding(
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // // //               child: Row(
// // // // //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // //                 children: [
// // // // //                   _buildCircleButton(
// // // // //                       context, Icons.checklist, 'Tasks', '/tasks'),
// // // // //                   _buildCircleButton(context, Icons.money, 'Allowance', null,
// // // // //                       isDialog: true),
// // // // //                   _buildCircleButton(
// // // // //                       context, Icons.shield, 'Restriction', '/restriction'),
// // // // //                   _buildCircleButton(context, Icons.flag, 'Goals', '/goals',
// // // // //                       extra: kid['Kname']),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 16),
// // // // //             const Padding(
// // // // //               padding: EdgeInsets.symmetric(horizontal: 16.0),
// // // // //               child: Align(
// // // // //                 alignment: Alignment.centerLeft,
// // // // //                 child: Text(
// // // // //                   'Redeem points:',
// // // // //                   style: TextStyle(
// // // // //                     fontSize: 18,
// // // // //                     fontWeight: FontWeight.bold,
// // // // //                     color: whiteText,
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 8),
// // // // //             ..._buildRewardCards(),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildInfoColumn(String title, String value, Color color) {
// // // // //     return Column(
// // // // //       children: [
// // // // //         Text(
// // // // //           value,
// // // // //           style: TextStyle(
// // // // //             fontSize: 18,
// // // // //             fontWeight: FontWeight.bold,
// // // // //             color: color,
// // // // //           ),
// // // // //         ),
// // // // //         Text(
// // // // //           title,
// // // // //           style: const TextStyle(
// // // // //             fontSize: 14,
// // // // //             color: Colors.grey,
// // // // //           ),
// // // // //         ),
// // // // //       ],
// // // // //     );
// // // // //   }

// // // // //   Widget _buildCircleButton(
// // // // //       BuildContext context, IconData icon, String label, String? route,
// // // // //       {bool isDialog = false, String? extra}) {
// // // // //     return GestureDetector(
// // // // //       onTap: () {
// // // // //         if (isDialog) {
// // // // //           showDialog(
// // // // //             context: context,
// // // // //             builder: (BuildContext context) {
// // // // //               return AllowanceDialog();
// // // // //             },
// // // // //           );
// // // // //         } else if (route != null) {
// // // // //           context.push(route, extra: extra);
// // // // //         }
// // // // //       },
// // // // //       child: Column(
// // // // //         children: [
// // // // //           CircleAvatar(
// // // // //             radius: 30,
// // // // //             backgroundColor: blueCard,
// // // // //             child: Icon(icon, color: whiteText, size: 30),
// // // // //           ),
// // // // //           const SizedBox(height: 8),
// // // // //           Text(
// // // // //             label,
// // // // //             style: const TextStyle(
// // // // //               color: whiteText,
// // // // //               fontSize: 14,
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   List<Widget> _buildRewardCards() {
// // // // //     final List<Map<String, dynamic>> rewards = [
// // // // //       {'title': 'dabdoob', 'points': '3213/1500', 'color': whitecard},
// // // // //       {'title': 'Kidzania', 'points': '3213/3000', 'color': whitecard},
// // // // //       {'title': 'SEPHORA', 'points': '3213/4000', 'color': whitecard},
// // // // //     ];

// // // // //     return rewards.map((Map<String, dynamic> reward) {
// // // // //       return Padding(
// // // // //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// // // // //         child: Container(
// // // // //           padding: const EdgeInsets.all(16),
// // // // //           decoration: BoxDecoration(
// // // // //             color: reward['color'],
// // // // //             borderRadius: BorderRadius.circular(12),
// // // // //           ),
// // // // //           child: Row(
// // // // //             children: [
// // // // //               Image.network(
// // // // //                 'https://dashboard.codeparrot.ai/api/assets/Z49T3LJ_hFeCeO1N',
// // // // //                 width: 50,
// // // // //                 height: 50,
// // // // //               ),
// // // // //               const SizedBox(width: 16),
// // // // //               Expanded(
// // // // //                 child: Column(
// // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                   children: [
// // // // //                     Text(
// // // // //                       reward['title'],
// // // // //                       style: const TextStyle(
// // // // //                         color: blueText,
// // // // //                         fontSize: 18,
// // // // //                         fontWeight: FontWeight.bold,
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 8),
// // // // //                     Text(
// // // // //                       reward['points'],
// // // // //                       style: const TextStyle(
// // // // //                         color: blueText,
// // // // //                         fontSize: 14,
// // // // //                       ),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       );
// // // // //     }).toList();
// // // // //   }
// // // // // }

// // // // // const Color blueBackground = Color(0xFF2675CC);
// // // // // const Color blueCard = Color(0xFF7CACE0);
// // // // // const Color blueText = Color(0xFF2575CC);
// // // // // const Color whiteText = Color(0xFFFFFFFF);
// // // // // const Color whitecard = Color(0xFFFFFFFF);
// // // // import 'package:bkid_frontend/pages/allowance_dialogue.dart';
// // // // import 'package:bkid_frontend/pages/goals_page.dart';
// // // // import 'package:bkid_frontend/pages/restrictions_page.dart';
// // // // import 'package:bkid_frontend/pages/tasks_page.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:go_router/go_router.dart';

// // // // const Color blueBackground = Color(0xFF2675CC); // Blue background
// // // // const Color blueCard = Color(0xFF7CACE0); // Blue card
// // // // const Color blueText = Color(0xFF2575CC); // Blue text
// // // // const Color whiteText = Color(0xFFFFFFFF); // White text
// // // // const Color whitecard = Color(0xFFFFFFFF); // White card

// // // // class ViewKidCard extends StatelessWidget {
// // // //   final Map<String, dynamic> kid;

// // // //   const ViewKidCard({super.key, required this.kid});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: blueBackground,
// // // //       appBar: AppBar(
// // // //         backgroundColor: blueBackground,
// // // //         elevation: 0,
// // // //         leading: IconButton(
// // // //           icon: const Icon(Icons.arrow_back, color: whiteText),
// // // //           onPressed: () {
// // // //             Navigator.pop(context);
// // // //           },
// // // //         ),
// // // //         actions: [
// // // //           IconButton(
// // // //             icon: const Icon(Icons.notifications, color: whiteText),
// // // //             onPressed: () {},
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       body: SingleChildScrollView(
// // // //         child: Column(
// // // //           children: [
// // // //             Padding(
// // // //               padding: const EdgeInsets.all(16.0),
// // // //               child: Stack(
// // // //                 children: [
// // // //                   Container(
// // // //                     padding: const EdgeInsets.all(16),
// // // //                     decoration: BoxDecoration(
// // // //                       color: whiteText.withOpacity(0.3),
// // // //                       borderRadius: BorderRadius.circular(25),
// // // //                     ),
// // // //                     child: Column(
// // // //                       crossAxisAlignment: CrossAxisAlignment.center,
// // // //                       children: [
// // // //                         const SizedBox(height: 40),
// // // //                         Row(
// // // //                           mainAxisAlignment: MainAxisAlignment.start,
// // // //                           children: [
// // // //                             const SizedBox(width: 60),
// // // //                             Text(
// // // //                               kid['Kname'] ?? 'Maymoona',
// // // //                               style: const TextStyle(
// // // //                                 fontSize: 16,
// // // //                                 color: whiteText,
// // // //                               ),
// // // //                             ),
// // // //                           ],
// // // //                         ),
// // // //                         const Text(
// // // //                           '1234 5678 XXXX XXXX',
// // // //                           style: TextStyle(
// // // //                             fontSize: 18,
// // // //                             color: whiteText,
// // // //                           ),
// // // //                         ),
// // // //                         Row(
// // // //                           mainAxisAlignment: MainAxisAlignment.center,
// // // //                           children: [
// // // //                             const Text(
// // // //                               'Balance ',
// // // //                               style: TextStyle(
// // // //                                 fontSize: 16,
// // // //                                 color: whiteText,
// // // //                               ),
// // // //                             ),
// // // //                             Text(
// // // //                               '${kid['balance'] ?? 23.980}',
// // // //                               style: const TextStyle(
// // // //                                 fontSize: 24,
// // // //                                 fontWeight: FontWeight.bold,
// // // //                                 color: whiteText,
// // // //                               ),
// // // //                             ),
// // // //                             const Text(
// // // //                               ' KWD',
// // // //                               style: TextStyle(
// // // //                                 fontSize: 16,
// // // //                                 color: whiteText,
// // // //                               ),
// // // //                             ),
// // // //                           ],
// // // //                         ),
// // // //                         const Divider(color: whiteText),
// // // //                         Row(
// // // //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //                           children: [
// // // //                             _buildInfoColumn(
// // // //                                 '3213', 'Points', whiteText, Icons.star),
// // // //                             _buildInfoColumn('${kid['savings'] ?? 33.870} KWD',
// // // //                                 'Savings', whiteText, null),
// // // //                             _buildInfoColumn('${kid['steps'] ?? 2902}', 'Steps',
// // // //                                 whiteText, Icons.directions_walk),
// // // //                           ],
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                   ),
// // // //                   Positioned(
// // // //                     top: -20,
// // // //                     left: -20,
// // // //                     child: CircleAvatar(
// // // //                       radius: 40,
// // // //                       backgroundColor: whiteText,
// // // //                       child: CircleAvatar(
// // // //                         radius: 38,
// // // //                         backgroundImage:
// // // //                             const AssetImage('assets/kid_image.png'),
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             Padding(
// // // //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // //               child: Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //                 children: [
// // // //                   _buildCircleButton(
// // // //                       context, Icons.checklist, 'Tasks', '/tasks'),
// // // //                   _buildCircleButton(context, Icons.money, 'Allowance', null,
// // // //                       isDialog: true),
// // // //                   _buildCircleButton(
// // // //                       context, Icons.shield, 'Restriction', '/restriction'),
// // // //                   _buildCircleButton(context, Icons.flag, 'Goals', '/goals',
// // // //                       extra: kid['Kname']),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 16),
// // // //             const Padding(
// // // //               padding: EdgeInsets.symmetric(horizontal: 16.0),
// // // //               child: Align(
// // // //                 alignment: Alignment.centerLeft,
// // // //                 child: Text(
// // // //                   'Redeem points:',
// // // //                   style: TextStyle(
// // // //                     fontSize: 18,
// // // //                     fontWeight: FontWeight.bold,
// // // //                     color: whiteText,
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 8),
// // // //             ..._buildRewardCards(),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildInfoColumn(
// // // //       String value, String label, Color color, IconData? icon) {
// // // //     return Column(
// // // //       children: [
// // // //         Row(
// // // //           mainAxisSize: MainAxisSize.min,
// // // //           children: [
// // // //             Text(
// // // //               value,
// // // //               style: TextStyle(
// // // //                 fontSize: 18,
// // // //                 fontWeight: FontWeight.bold,
// // // //                 color: color,
// // // //               ),
// // // //             ),
// // // //             if (icon != null) ...[
// // // //               const SizedBox(width: 4),
// // // //               Icon(icon, color: color, size: 16),
// // // //             ],
// // // //           ],
// // // //         ),
// // // //         Text(
// // // //           label,
// // // //           style: TextStyle(
// // // //             fontSize: 12,
// // // //             color: color.withOpacity(0.5),
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget _buildCircleButton(
// // // //       BuildContext context, IconData icon, String label, String? route,
// // // //       {bool isDialog = false, String? extra}) {
// // // //     return GestureDetector(
// // // //       onTap: () {
// // // //         if (isDialog) {
// // // //           showDialog(
// // // //             context: context,
// // // //             builder: (BuildContext context) => AllowanceDialog(),
// // // //           );
// // // //         } else if (route != null) {
// // // //           context.push(route, extra: extra);
// // // //         }
// // // //       },
// // // //       child: Column(
// // // //         children: [
// // // //           Container(
// // // //             width: 69,
// // // //             height: 69,
// // // //             decoration: BoxDecoration(
// // // //               color: blueCard,
// // // //               shape: BoxShape.circle,
// // // //             ),
// // // //             child: Icon(icon, color: whiteText, size: 30),
// // // //           ),
// // // //           const SizedBox(height: 8),
// // // //           Text(
// // // //             label,
// // // //             style: const TextStyle(
// // // //               color: whiteText,
// // // //               fontSize: 14,
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   List<Widget> _buildRewardCards() {
// // // //     final List<Map<String, dynamic>> rewards = [
// // // //       {
// // // //         'title': 'dabdoob',
// // // //         'points': '3213/1500',
// // // //         'color': whitecard,
// // // //         'requested': true
// // // //       },
// // // //       {
// // // //         'title': 'Kidzania',
// // // //         'points': '3213/3000',
// // // //         'color': whitecard,
// // // //         'requested': false
// // // //       },
// // // //       {
// // // //         'title': 'SEPHORA',
// // // //         'points': '3213/4000',
// // // //         'color': whitecard,
// // // //         'requested': false
// // // //       },
// // // //     ];

// // // //     return rewards.map((Map<String, dynamic> reward) {
// // // //       return _buildRewardCard(reward);
// // // //     }).toList();
// // // //   }

// // // //   Widget _buildRewardCard(Map<String, dynamic> reward) {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// // // //       child: Container(
// // // //         padding: const EdgeInsets.all(16),
// // // //         decoration: BoxDecoration(
// // // //           color: reward['color'],
// // // //           borderRadius: BorderRadius.circular(20),
// // // //         ),
// // // //         child: Row(
// // // //           children: [
// // // //             ClipRRect(
// // // //               borderRadius: BorderRadius.circular(100),
// // // //               child: Image.network(
// // // //                 'https://dashboard.codeparrot.ai/api/assets/Z49T3LJ_hFeCeO1N',
// // // //                 width: 50,
// // // //                 height: 50,
// // // //                 fit: BoxFit.cover,
// // // //               ),
// // // //             ),
// // // //             const SizedBox(width: 16),
// // // //             Expanded(
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   Text(
// // // //                     reward['title'],
// // // //                     style: const TextStyle(
// // // //                       color: blueText,
// // // //                       fontSize: 20,
// // // //                       fontWeight: FontWeight.w600,
// // // //                     ),
// // // //                   ),
// // // //                   const Text(
// // // //                     'Enjoy a 30% OFF on Kids Entry Ticket!',
// // // //                     style: TextStyle(
// // // //                       color: blueText,
// // // //                       fontSize: 14,
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             Column(
// // // //               crossAxisAlignment: CrossAxisAlignment.end,
// // // //               children: [
// // // //                 if (reward['requested'] == true)
// // // //                   Container(
// // // //                     padding:
// // // //                         const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
// // // //                     decoration: BoxDecoration(
// // // //                       color: Colors.green,
// // // //                       borderRadius: BorderRadius.circular(12),
// // // //                     ),
// // // //                     child: const Text(
// // // //                       'requested',
// // // //                       style: TextStyle(
// // // //                         color: whiteText,
// // // //                         fontSize: 12,
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 const SizedBox(height: 4),
// // // //                 Text(
// // // //                   reward['points'],
// // // //                   style: const TextStyle(
// // // //                     color: blueText,
// // // //                     fontSize: 14,
// // // //                     fontWeight: FontWeight.w500,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // void main() {
// // // //   runApp(MaterialApp(
// // // //     debugShowCheckedModeBanner: false,
// // // //     home: ViewKidCard(
// // // //       kid: {
// // // //         'Kname': 'Maymoona',
// // // //         'balance': 23.980,
// // // //         'savings': 33.870,
// // // //         'steps': 2902,
// // // //       },
// // // //     ),
// // // //     theme: ThemeData(
// // // //       primaryColor: blueBackground,
// // // //       scaffoldBackgroundColor: blueBackground,
// // // //     ),
// // // //   ));
// // // // }
// // // import 'package:bkid_frontend/pages/allowance_dialogue.dart';
// // // import 'package:bkid_frontend/pages/goals_page.dart';
// // // import 'package:bkid_frontend/pages/restrictions_page.dart';
// // // import 'package:bkid_frontend/pages/tasks_page.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:go_router/go_router.dart';

// // // const Color blueBackground = Color(0xFF2675CC); // Blue background
// // // const Color blueCard = Color(0xFF7CACE0); // Blue card
// // // const Color blueText = Color(0xFF2575CC); // Blue text
// // // const Color whiteText = Color(0xFFFFFFFF); // White text
// // // const Color whitecard = Color(0xFFFFFFFF); // White card
// // // const Color greenText = Color(0xFF25CC25); // Green text

// // // class ViewKidCard extends StatelessWidget {
// // //   final Map<String, dynamic> kid;

// // //   const ViewKidCard({super.key, required this.kid});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: blueBackground,
// // //       appBar: AppBar(
// // //         backgroundColor: blueBackground,
// // //         elevation: 0,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back, color: whiteText),
// // //           onPressed: () {
// // //             Navigator.pop(context);
// // //           },
// // //         ),
// // //         actions: [
// // //           IconButton(
// // //             icon: const Icon(Icons.notifications, color: whiteText),
// // //             onPressed: () {},
// // //           ),
// // //         ],
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Column(
// // //           children: [
// // //             Padding(
// // //               padding: const EdgeInsets.all(16.0),
// // //               child: Stack(
// // //                 children: [
// // //                   Container(
// // //                     padding: const EdgeInsets.all(16),
// // //                     decoration: BoxDecoration(
// // //                       color: whiteText.withOpacity(0.3),
// // //                       borderRadius: BorderRadius.circular(25),
// // //                     ),
// // //                     child: Column(
// // //                       crossAxisAlignment: CrossAxisAlignment.center,
// // //                       children: [
// // //                         const SizedBox(height: 40),
// // //                         const Text(
// // //                           '1234 5678 XXXX XXXX',
// // //                           style: TextStyle(
// // //                             fontSize: 18,
// // //                             color: whiteText,
// // //                           ),
// // //                         ),
// // //                         Row(
// // //                           mainAxisAlignment: MainAxisAlignment.center,
// // //                           children: [
// // //                             const Text(
// // //                               'Balance ',
// // //                               style: TextStyle(
// // //                                 fontSize: 16,
// // //                                 color: whiteText,
// // //                               ),
// // //                             ),
// // //                             Text(
// // //                               '${kid['balance'] ?? 23.980}',
// // //                               style: const TextStyle(
// // //                                 fontSize: 24,
// // //                                 fontWeight: FontWeight.bold,
// // //                                 color: whiteText,
// // //                               ),
// // //                             ),
// // //                             const Text(
// // //                               ' KWD',
// // //                               style: TextStyle(
// // //                                 fontSize: 16,
// // //                                 color: whiteText,
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                         const Divider(color: whiteText),
// // //                         Row(
// // //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //                           children: [
// // //                             _buildInfoColumn(
// // //                                 '3213', 'Points', whiteText, Icons.star),
// // //                             _buildInfoColumn('${kid['savings'] ?? 33.870} KWD',
// // //                                 'Savings', whiteText, null),
// // //                             _buildInfoColumn('${kid['steps'] ?? 2902}', 'Steps',
// // //                                 whiteText, Icons.directions_walk),
// // //                           ],
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                   Positioned(
// // //                     top: -20,
// // //                     left: -20,
// // //                     child: CircleAvatar(
// // //                       radius: 40,
// // //                       backgroundColor: whiteText,
// // //                       child: CircleAvatar(
// // //                         radius: 38,
// // //                         backgroundImage:
// // //                             const AssetImage('assets/kid_image.png'),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //             Padding(
// // //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // //               child: Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //                 children: [
// // //                   _buildCircleButton(
// // //                       context, Icons.checklist, 'Tasks', '/tasks'),
// // //                   _buildCircleButton(context, Icons.money, 'Allowance', null,
// // //                       isDialog: true),
// // //                   _buildCircleButton(
// // //                       context, Icons.shield, 'Restriction', '/restriction'),
// // //                   _buildCircleButton(context, Icons.flag, 'Goals', '/goals',
// // //                       extra: kid['Kname']),
// // //                 ],
// // //               ),
// // //             ),
// // //             const SizedBox(height: 16),
// // //             const Padding(
// // //               padding: EdgeInsets.symmetric(horizontal: 16.0),
// // //               child: Align(
// // //                 alignment: Alignment.centerLeft,
// // //                 child: Text(
// // //                   'Redeem points:',
// // //                   style: TextStyle(
// // //                     fontSize: 18,
// // //                     fontWeight: FontWeight.bold,
// // //                     color: whiteText,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //             const SizedBox(height: 8),
// // //             Container(
// // //               color: blueCard,
// // //               child: Column(
// // //                 children: _buildRewardCards(context),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildInfoColumn(
// // //       String value, String label, Color color, IconData? icon) {
// // //     return Column(
// // //       children: [
// // //         Row(
// // //           mainAxisSize: MainAxisSize.min,
// // //           children: [
// // //             Text(
// // //               value,
// // //               style: TextStyle(
// // //                 fontSize: 18,
// // //                 fontWeight: FontWeight.bold,
// // //                 color: color,
// // //               ),
// // //             ),
// // //             if (icon != null) ...[
// // //               const SizedBox(width: 4),
// // //               Icon(icon, color: color, size: 16),
// // //             ],
// // //           ],
// // //         ),
// // //         Text(
// // //           label,
// // //           style: TextStyle(
// // //             fontSize: 12,
// // //             color: color.withOpacity(0.5),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildCircleButton(
// // //       BuildContext context, IconData icon, String label, String? route,
// // //       {bool isDialog = false, String? extra}) {
// // //     return GestureDetector(
// // //       onTap: () {
// // //         if (isDialog) {
// // //           showDialog(
// // //             context: context,
// // //             builder: (BuildContext context) => AllowanceDialog(),
// // //           );
// // //         } else if (route != null) {
// // //           context.push(route, extra: extra);
// // //         }
// // //       },
// // //       child: Column(
// // //         children: [
// // //           Container(
// // //             width: 69,
// // //             height: 69,
// // //             decoration: BoxDecoration(
// // //               color: blueCard,
// // //               shape: BoxShape.circle,
// // //             ),
// // //             child: Icon(icon, color: whiteText, size: 30),
// // //           ),
// // //           const SizedBox(height: 8),
// // //           Text(
// // //             label,
// // //             style: const TextStyle(
// // //               color: whiteText,
// // //               fontSize: 14,
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   List<Widget> _buildRewardCards(BuildContext context) {
// // //     final List<Map<String, dynamic>> rewards = [
// // //       {
// // //         'title': 'dabdoob',
// // //         'points': 3213,
// // //         'required': 1500,
// // //         'color': whitecard,
// // //         'requested': true
// // //       },
// // //       {
// // //         'title': 'Kidzania',
// // //         'points': 3213,
// // //         'required': 3000,
// // //         'color': whitecard,
// // //         'requested': false
// // //       },
// // //       {
// // //         'title': 'SEPHORA',
// // //         'points': 3213,
// // //         'required': 4000,
// // //         'color': whitecard,
// // //         'requested': false
// // //       },
// // //     ];

// // //     return rewards.map((Map<String, dynamic> reward) {
// // //       return _buildRewardCard(context, reward);
// // //     }).toList();
// // //   }

// // //   Widget _buildRewardCard(BuildContext context, Map<String, dynamic> reward) {
// // //     return GestureDetector(
// // //       onTap: () {
// // //         _showRewardInfo(context, reward);
// // //       },
// // //       child: Padding(
// // //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// // //         child: Container(
// // //           padding: const EdgeInsets.all(16),
// // //           decoration: BoxDecoration(
// // //             color: reward['color'],
// // //             borderRadius: BorderRadius.circular(20),
// // //           ),
// // //           child: Row(
// // //             children: [
// // //               ClipRRect(
// // //                 borderRadius: BorderRadius.circular(100),
// // //                 child: Image.network(
// // //                   'https://dashboard.codeparrot.ai/api/assets/Z49T3LJ_hFeCeO1N',
// // //                   width: 50,
// // //                   height: 50,
// // //                   fit: BoxFit.cover,
// // //                 ),
// // //               ),
// // //               const SizedBox(width: 16),
// // //               Expanded(
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Text(
// // //                       reward['title'],
// // //                       style: const TextStyle(
// // //                         color: blueText,
// // //                         fontSize: 20,
// // //                         fontWeight: FontWeight.w600,
// // //                       ),
// // //                     ),
// // //                     const Text(
// // //                       'Enjoy a 30% OFF on Kids Entry Ticket!',
// // //                       style: TextStyle(
// // //                         color: blueText,
// // //                         fontSize: 14,
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //               Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.end,
// // //                 children: [
// // //                   if (reward['requested'] == true)
// // //                     Container(
// // //                       padding: const EdgeInsets.symmetric(
// // //                           horizontal: 8, vertical: 2),
// // //                       decoration: BoxDecoration(
// // //                         color: Colors.green,
// // //                         borderRadius: BorderRadius.circular(12),
// // //                       ),
// // //                       child: const Text(
// // //                         'requested',
// // //                         style: TextStyle(
// // //                           color: whiteText,
// // //                           fontSize: 12,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   const SizedBox(height: 4),
// // //                   Row(
// // //                     children: [
// // //                       Text(
// // //                         '${reward['points']}',
// // //                         style: TextStyle(
// // //                           color: reward['points'] >= reward['required']
// // //                               ? greenText
// // //                               : blueText,
// // //                           fontSize: 14,
// // //                           fontWeight: FontWeight.w500,
// // //                         ),
// // //                       ),
// // //                       Text(
// // //                         '/${reward['required']}',
// // //                         style: const TextStyle(
// // //                           color: blueText,
// // //                           fontSize: 14,
// // //                           fontWeight: FontWeight.w500,
// // //                         ),
// // //                       ),
// // //                       IconButton(
// // //                         icon: const Icon(Icons.info, color: blueText),
// // //                         onPressed: () {
// // //                           _showRewardInfo(context, reward);
// // //                         },
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   void _showRewardInfo(BuildContext context, Map<String, dynamic> reward) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: Text(reward['title']),
// // //           content: const Text('Enjoy a 30% OFF on Kids Entry Ticket!'),
// // //           actions: [
// // //             TextButton(
// // //               onPressed: () => Navigator.of(context).pop(),
// // //               child: const Text('Close'),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // // }

// // // void main() {
// // //   runApp(MaterialApp(
// // //     debugShowCheckedModeBanner: false,
// // //     home: ViewKidCard(
// // //       kid: {
// // //         'balance': 23.980,
// // //         'savings': 33.870,
// // //         'steps': 2902,
// // //       },
// // //     ),
// // //     theme: ThemeData(
// // //       primaryColor: blueBackground,
// // //       scaffoldBackgroundColor: blueBackground,
// // //     ),
// // //   ));
// // // }
// // import 'package:bkid_frontend/pages/allowance_dialogue.dart';
// // import 'package:bkid_frontend/pages/goals_page.dart';
// // import 'package:bkid_frontend/pages/restrictions_page.dart';
// // import 'package:bkid_frontend/pages/tasks_page.dart';
// // import 'package:flutter/material.dart';
// // import 'package:go_router/go_router.dart';

// // const Color blueBackground = Color(0xFF2675CC);
// // const Color blueCard = Color(0xFF7CACE0);
// // const Color blueText = Color(0xFF2575CC);
// // const Color whiteText = Color(0xFFFFFFFF);
// // const Color whitecard = Color(0xFFFFFFFF);
// // const Color greenText = Color(0xFF25CC25);

// // class ViewKidCard extends StatelessWidget {
// //   final Map<String, dynamic> kid;

// //   const ViewKidCard({super.key, required this.kid});

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
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.notifications, color: whiteText),
// //             onPressed: () {},
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Stack(
// //               children: [
// //                 Container(
// //                   padding: const EdgeInsets.all(16),
// //                   decoration: BoxDecoration(
// //                     color: whiteText.withOpacity(0.3),
// //                     borderRadius: BorderRadius.circular(25),
// //                   ),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       const SizedBox(height: 40),
// //                       const Text(
// //                         '1234 5678 XXXX XXXX',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           color: whiteText,
// //                         ),
// //                       ),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           const Text(
// //                             'Balance ',
// //                             style: TextStyle(
// //                               fontSize: 16,
// //                               color: whiteText,
// //                             ),
// //                           ),
// //                           Text(
// //                             '${kid['balance'] ?? 23.980}',
// //                             style: const TextStyle(
// //                               fontSize: 24,
// //                               fontWeight: FontWeight.bold,
// //                               color: whiteText,
// //                             ),
// //                           ),
// //                           const Text(
// //                             ' KWD',
// //                             style: TextStyle(
// //                               fontSize: 16,
// //                               color: whiteText,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       const Divider(color: whiteText),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                         children: [
// //                           _buildInfoColumn(
// //                               '3213', 'Points', whiteText, Icons.star),
// //                           _buildInfoColumn('${kid['savings'] ?? 33.870} KWD',
// //                               'Savings', whiteText, null),
// //                           _buildInfoColumn('${kid['steps'] ?? 2902}', 'Steps',
// //                               whiteText, Icons.directions_walk),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 Positioned(
// //                   top: -20,
// //                   left: -20,
// //                   child: CircleAvatar(
// //                     radius: 40,
// //                     backgroundColor: whiteText,
// //                     child: CircleAvatar(
// //                       radius: 38,
// //                       backgroundImage: const AssetImage('assets/kid_image.png'),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// //               children: [
// //                 _buildCircleButton(context, Icons.checklist, 'Tasks', '/tasks'),
// //                 _buildCircleButton(context, Icons.money, 'Allowance', null,
// //                     isDialog: true),
// //                 _buildCircleButton(
// //                     context, Icons.shield, 'Restriction', '/restriction'),
// //                 _buildCircleButton(context, Icons.flag, 'Goals', '/goals',
// //                     extra: kid['Kname']),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(height: 16),
// //           const Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 16.0),
// //             child: Align(
// //               alignment: Alignment.centerLeft,
// //               child: Text(
// //                 'Redeem points:',
// //                 style: TextStyle(
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.bold,
// //                   color: whiteText,
// //                 ),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(height: 8),
// //           Expanded(
// //             child: Container(
// //               decoration: const BoxDecoration(
// //                 color: blueCard,
// //                 borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
// //               ),
// //               child: SingleChildScrollView(
// //                 physics: const BouncingScrollPhysics(),
// //                 child: Column(
// //                   children: _buildRewardCards(context),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildInfoColumn(
// //       String value, String label, Color color, IconData? icon) {
// //     return Column(
// //       children: [
// //         Row(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             Text(
// //               value,
// //               style: TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.bold,
// //                 color: color,
// //               ),
// //             ),
// //             if (icon != null) ...[
// //               const SizedBox(width: 4),
// //               Icon(icon, color: color, size: 16),
// //             ],
// //           ],
// //         ),
// //         Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 12,
// //             color: color.withOpacity(0.5),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildCircleButton(
// //       BuildContext context, IconData icon, String label, String? route,
// //       {bool isDialog = false, String? extra}) {
// //     return GestureDetector(
// //       onTap: () {
// //         if (isDialog) {
// //           showDialog(
// //             context: context,
// //             builder: (BuildContext context) => AllowanceDialog(),
// //           );
// //         } else if (route != null) {
// //           context.push(route, extra: extra);
// //         }
// //       },
// //       child: Column(
// //         children: [
// //           Container(
// //             width: 69,
// //             height: 69,
// //             decoration: BoxDecoration(
// //               color: blueCard,
// //               shape: BoxShape.circle,
// //             ),
// //             child: Icon(icon, color: whiteText, size: 30),
// //           ),
// //           const SizedBox(height: 8),
// //           Text(
// //             label,
// //             style: const TextStyle(
// //               color: whiteText,
// //               fontSize: 14,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   List<Widget> _buildRewardCards(BuildContext context) {
// //     final List<Map<String, dynamic>> rewards = [
// //       {
// //         'title': 'dabdoob',
// //         'points': 3213,
// //         'required': 1500,
// //         'color': whitecard,
// //         'requested': true
// //       },
// //       {
// //         'title': 'Kidzania',
// //         'points': 3213,
// //         'required': 3000,
// //         'color': whitecard,
// //         'requested': false
// //       },
// //       {
// //         'title': 'SEPHORA',
// //         'points': 3213,
// //         'required': 4000,
// //         'color': whitecard,
// //         'requested': false
// //       },
// //     ];

// //     return rewards.map((Map<String, dynamic> reward) {
// //       return _buildRewardCard(context, reward);
// //     }).toList();
// //   }

// //   Widget _buildRewardCard(BuildContext context, Map<String, dynamic> reward) {
// //     return GestureDetector(
// //       onTap: () {
// //         _showRewardInfo(context, reward);
// //       },
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// //         child: Container(
// //           padding: const EdgeInsets.all(16),
// //           decoration: BoxDecoration(
// //             color: reward['color'],
// //             borderRadius: BorderRadius.circular(25),
// //           ),
// //           child: Row(
// //             children: [
// //               ClipRRect(
// //                 borderRadius: BorderRadius.circular(100),
// //                 child: Image.network(
// //                   'https://dashboard.codeparrot.ai/api/assets/Z49T3LJ_hFeCeO1N',
// //                   width: 50,
// //                   height: 50,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //               const SizedBox(width: 16),
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       reward['title'],
// //                       style: const TextStyle(
// //                         color: blueText,
// //                         fontSize: 20,
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                     const Text(
// //                       'Enjoy a 30% OFF on Kids Entry Ticket!',
// //                       style: TextStyle(
// //                         color: blueText,
// //                         fontSize: 14,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.end,
// //                 children: [
// //                   if (reward['requested'] == true)
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: 8, vertical: 2),
// //                       decoration: BoxDecoration(
// //                         color: Colors.green,
// //                         borderRadius: BorderRadius.circular(12),
// //                       ),
// //                       child: const Text(
// //                         'requested',
// //                         style: TextStyle(
// //                           color: whiteText,
// //                           fontSize: 12,
// //                         ),
// //                       ),
// //                     ),
// //                   const SizedBox(height: 4),
// //                   Row(
// //                     children: [
// //                       Text(
// //                         '${reward['points']}',
// //                         style: TextStyle(
// //                           color: reward['points'] >= reward['required']
// //                               ? greenText
// //                               : blueText,
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.w500,
// //                         ),
// //                       ),
// //                       Text(
// //                         '/${reward['required']}',
// //                         style: const TextStyle(
// //                           color: blueText,
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.w500,
// //                         ),
// //                       ),
// //                       IconButton(
// //                         icon: const Icon(Icons.info, color: blueText),
// //                         onPressed: () {
// //                           _showRewardInfo(context, reward);
// //                         },
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   void _showRewardInfo(BuildContext context, Map<String, dynamic> reward) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return Dialog(
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(25),
// //           ),
// //           child: Container(
// //             padding: const EdgeInsets.all(20),
// //             decoration: BoxDecoration(
// //               color: whitecard,
// //               borderRadius: BorderRadius.circular(25),
// //             ),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Row(
// //                   children: [
// //                     ClipRRect(
// //                       borderRadius: BorderRadius.circular(100),
// //                       child: Image.network(
// //                         'https://dashboard.codeparrot.ai/api/assets/Z49T3LJ_hFeCeO1N',
// //                         width: 50,
// //                         height: 50,
// //                         fit: BoxFit.cover,
// //                       ),
// //                     ),
// //                     const SizedBox(width: 16),
// //                     Text(
// //                       reward['title'],
// //                       style: const TextStyle(
// //                         color: blueText,
// //                         fontSize: 20,
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 20),
// //                 const Text(
// //                   'Enjoy a 30% OFF on Kids Entry Ticket!',
// //                   style: TextStyle(
// //                     color: blueText,
// //                     fontSize: 16,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       'Points needed:',
// //                       style: TextStyle(
// //                         color: blueText,
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.w500,
// //                       ),
// //                     ),
// //                     Row(
// //                       children: [
// //                         Text(
// //                           '${reward['points']}',
// //                           style: TextStyle(
// //                             color: reward['points'] >= reward['required']
// //                                 ? greenText
// //                                 : blueText,
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.w500,
// //                           ),
// //                         ),
// //                         Text(
// //                           '/${reward['required']}',
// //                           style: TextStyle(
// //                             color: blueText,
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.w500,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 20),
// //                 SizedBox(
// //                   width: double.infinity,
// //                   height: 50,
// //                   child: ElevatedButton(
// //                     onPressed: () => Navigator.of(context).pop(),
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: blueBackground,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(25),
// //                       ),
// //                     ),
// //                     child: const Text(
// //                       'Close',
// //                       style: TextStyle(
// //                         color: whiteText,
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.w500,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // void main() {
// //   runApp(MaterialApp(
// //     debugShowCheckedModeBanner: false,
// //     home: ViewKidCard(
// //       kid: {
// //         'balance': 23.980,
// //         'savings': 33.870,
// //         'steps': 2902,
// //       },
// //     ),
// //     theme: ThemeData(
// //       primaryColor: blueBackground,
// //       scaffoldBackgroundColor: blueBackground,
// //     ),
// //   ));
// // }
// import 'package:bkid_frontend/pages/allowance_dialogue.dart';
// import 'package:bkid_frontend/pages/goals_page.dart';
// import 'package:bkid_frontend/pages/restrictions_page.dart';
// import 'package:bkid_frontend/pages/tasks_page.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// const Color blueBackground = Color(0xFF2675CC);
// const Color blueCard = Color(0xFF7CACE0);
// const Color blueText = Color(0xFF2575CC);
// const Color whiteText = Color(0xFFFFFFFF);
// const Color whitecard = Color(0xFFFFFFFF);
// const Color greenText = Color(0xFF25CC25);

// class ViewKidCard extends StatelessWidget {
//   final Map<String, dynamic> kid;

//   const ViewKidCard({super.key, required this.kid});

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
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications, color: whiteText),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Stack(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: whiteText.withOpacity(0.3),
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 40),
//                       const Text(
//                         '1234 5678 XXXX XXXX',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: whiteText,
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             'Balance ',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: whiteText,
//                             ),
//                           ),
//                           Text(
//                             '${kid['balance'] ?? 23.980}',
//                             style: const TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: whiteText,
//                             ),
//                           ),
//                           const Text(
//                             ' KWD',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: whiteText,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Divider(color: whiteText),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           _buildInfoColumn(
//                               '3213', 'Points', whiteText, Icons.star),
//                           _buildInfoColumn('${kid['savings'] ?? 33.870} KWD',
//                               'Savings', whiteText, null),
//                           _buildInfoColumn('${kid['steps'] ?? 2902}', 'Steps',
//                               whiteText, Icons.directions_walk),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: -20,
//                   left: -20,
//                   child: CircleAvatar(
//                     radius: 40,
//                     backgroundColor: whiteText,
//                     child: CircleAvatar(
//                       radius: 38,
//                       backgroundImage: const AssetImage('assets/kid_image.png'),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildCircleButton(context, Icons.checklist, 'Tasks', '/tasks'),
//                 _buildCircleButton(context, Icons.money, 'Allowance', null,
//                     isDialog: true),
//                 _buildCircleButton(
//                     context, Icons.shield, 'Restriction', '/restriction'),
//                 _buildCircleButton(context, Icons.flag, 'Goals', '/goals',
//                     extra: kid['Kname']),
//               ],
//             ),
//           ),
//           const SizedBox(height: 16),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Redeem points:',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: whiteText,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: blueCard,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
//               ),
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: _buildRewardCards(context),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoColumn(
//       String value, String label, Color color, IconData? icon) {
//     return Column(
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               value,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: color,
//               ),
//             ),
//             if (icon != null) ...[
//               const SizedBox(width: 4),
//               Icon(icon, color: color, size: 16),
//             ],
//           ],
//         ),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             color: color.withOpacity(0.5),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildCircleButton(
//       BuildContext context, IconData icon, String label, String? route,
//       {bool isDialog = false, String? extra}) {
//     return GestureDetector(
//       onTap: () {
//         if (isDialog) {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) => AllowanceDialog(),
//           );
//         } else if (route != null) {
//           context.push(route, extra: extra);
//         }
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 69,
//             height: 69,
//             decoration: BoxDecoration(
//               color: blueCard,
//               shape: BoxShape.circle,
//             ),
//             child: Icon(icon, color: whiteText, size: 30),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             label,
//             style: const TextStyle(
//               color: whiteText,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   List<Widget> _buildRewardCards(BuildContext context) {
//     final List<Map<String, dynamic>> rewards = [
//       {
//         'title': 'dabdoob',
//         'points': 3213,
//         'required': 1500,
//         'color': whitecard,
//         'requested': true
//       },
//       {
//         'title': 'Kidzania',
//         'points': 3213,
//         'required': 3000,
//         'color': whitecard,
//         'requested': false
//       },
//       {
//         'title': 'SEPHORA',
//         'points': 3213,
//         'required': 4000,
//         'color': whitecard,
//         'requested': false
//       },
//     ];

//     return rewards.map((Map<String, dynamic> reward) {
//       return _buildRewardCard(context, reward);
//     }).toList();
//   }

//   Widget _buildRewardCard(BuildContext context, Map<String, dynamic> reward) {
//     return GestureDetector(
//       onTap: () {
//         _showRewardInfo(context, reward);
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: reward['color'],
//             borderRadius: BorderRadius.circular(25),
//           ),
//           child: Row(
//             children: [
//               ClipOval(
//                 child: Image.network(
//                   'https://dashboard.codeparrot.ai/api/assets/Z49T3LJ_hFeCeO1N',
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       reward['title'],
//                       style: const TextStyle(
//                         color: blueText,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const Text(
//                       'Enjoy a 30% OFF on Kids Entry Ticket!',
//                       style: TextStyle(
//                         color: blueText,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   if (reward['requested'] == true)
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 2),
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const Text(
//                         'requested',
//                         style: TextStyle(
//                           color: whiteText,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                   const SizedBox(height: 4),
//                   Row(
//                     children: [
//                       Text(
//                         '${reward['points']}',
//                         style: TextStyle(
//                           color: reward['points'] >= reward['required']
//                               ? greenText
//                               : blueText,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       Text(
//                         '/${reward['required']}',
//                         style: const TextStyle(
//                           color: blueText,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.info, color: blueText),
//                         onPressed: () {
//                           _showRewardInfo(context, reward);
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showRewardInfo(BuildContext context, Map<String, dynamic> reward) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(25),
//           ),
//           child: Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: whitecard,
//               borderRadius: BorderRadius.circular(25),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   children: [
//                     ClipOval(
//                       child: Image.network(
//                         'https://dashboard.codeparrot.ai/api/assets/Z49T3LJ_hFeCeO1N',
//                         width: 50,
//                         height: 50,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Text(
//                       reward['title'],
//                       style: const TextStyle(
//                         color: blueText,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Enjoy a 30% OFF on Kids Entry Ticket!',
//                   style: TextStyle(
//                     color: blueText,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Points needed:',
//                       style: TextStyle(
//                         color: blueText,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           '${reward['points']}',
//                           style: TextStyle(
//                             color: reward['points'] >= reward['required']
//                                 ? greenText
//                                 : blueText,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Text(
//                           '/${reward['required']}',
//                           style: TextStyle(
//                             color: blueText,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () => Navigator.of(context).pop(),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: blueBackground,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                     child: const Text(
//                       'Close',
//                       style: TextStyle(
//                         color: whiteText,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: ViewKidCard(
//       kid: {
//         'balance': 23.980,
//         'savings': 33.870,
//         'steps': 2902,
//       },
//     ),
//     theme: ThemeData(
//       primaryColor: blueBackground,
//       scaffoldBackgroundColor: blueBackground,
//     ),
//   ));
// }
import 'package:bkid_frontend/pages/allowance_dialogue.dart';
import 'package:bkid_frontend/pages/goals_page.dart';
import 'package:bkid_frontend/pages/restrictions_page.dart';
import 'package:bkid_frontend/pages/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const Color blueBackground = Color(0xFF2675CC);
const Color blueCard = Color(0xFF7CACE0);
const Color blueText = Color(0xFF2575CC);
const Color whiteText = Color(0xFFFFFFFF);
const Color whitecard = Color(0xFFFFFFFF);
const Color greenText = Color(0xFF25CC25);

class ViewKidCard extends StatelessWidget {
  final Map<String, dynamic> kid;

  const ViewKidCard({super.key, required this.kid});

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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: whiteText),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: whiteText.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        '1234 5678 XXXX XXXX',
                        style: TextStyle(
                          fontSize: 18,
                          color: whiteText,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Balance ',
                            style: TextStyle(
                              fontSize: 16,
                              color: whiteText,
                            ),
                          ),
                          Text(
                            '${kid['balance'] ?? 23.980}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: whiteText,
                            ),
                          ),
                          const Text(
                            ' KWD',
                            style: TextStyle(
                              fontSize: 16,
                              color: whiteText,
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: whiteText),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildInfoColumn(
                              '3213', 'Points', whiteText, Icons.star),
                          _buildInfoColumn('${kid['savings'] ?? 33.870} KWD',
                              'Savings', whiteText, null),
                          _buildInfoColumn('${kid['steps'] ?? 2902}', 'Steps',
                              whiteText, Icons.directions_walk),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -20,
                  left: -20,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: blueCard,
                        width: 4.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: const AssetImage('assets/kid_image.png'),
                      radius: 40.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleButton(context, Icons.checklist, 'Tasks', '/tasks'),
                _buildCircleButton(context, Icons.money, 'Allowance', null,
                    isDialog: true),
                _buildCircleButton(
                    context, Icons.shield, 'Restriction', '/restriction'),
                _buildCircleButton(context, Icons.flag, 'Goals', '/goals',
                    extra: kid['Kname']),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Redeem points:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: whiteText,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: blueCard,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: _buildRewardCards(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(
      String value, String label, Color color, IconData? icon) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 4),
              Icon(icon, color: color, size: 16),
            ],
          ],
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildCircleButton(
      BuildContext context, IconData icon, String label, String? route,
      {bool isDialog = false, String? extra}) {
    return GestureDetector(
      onTap: () {
        if (isDialog) {
          showDialog(
            context: context,
            builder: (BuildContext context) => AllowanceDialog(),
          );
        } else if (route != null) {
          context.push(route, extra: extra);
        }
      },
      child: Column(
        children: [
          Container(
            width: 69,
            height: 69,
            decoration: BoxDecoration(
              color: blueCard,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: whiteText, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: whiteText,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRewardCards(BuildContext context) {
    final List<Map<String, dynamic>> rewards = [
      {
        'title': 'dabdoob',
        'points': 3213,
        'required': 1500,
        'color': whitecard,
        'requested': true
      },
      {
        'title': 'Kidzania',
        'points': 3213,
        'required': 3000,
        'color': whitecard,
        'requested': false
      },
      {
        'title': 'SEPHORA',
        'points': 3213,
        'required': 4000,
        'color': whitecard,
        'requested': false
      },
    ];

    return rewards.map((Map<String, dynamic> reward) {
      return _buildRewardCard(context, reward);
    }).toList();
  }

  Widget _buildRewardCard(BuildContext context, Map<String, dynamic> reward) {
    return GestureDetector(
      onTap: () {
        _showRewardInfo(context, reward);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: reward['color'],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  'https://dashboard.codeparrot.ai/api/assets/Z49T3LJ_hFeCeO1N',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reward['title'],
                      style: const TextStyle(
                        color: blueText,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'Enjoy a 30% OFF on Kids Entry Ticket!',
                      style: TextStyle(
                        color: blueText,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (reward['requested'] == true)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'requested',
                        style: TextStyle(
                          color: whiteText,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '${reward['points']}',
                        style: TextStyle(
                          color: reward['points'] >= reward['required']
                              ? greenText
                              : blueText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '/${reward['required']}',
                        style: const TextStyle(
                          color: blueText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.info, color: blueText),
                        onPressed: () {
                          _showRewardInfo(context, reward);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRewardInfo(BuildContext context, Map<String, dynamic> reward) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: whitecard,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://dashboard.codeparrot.ai/api/assets/Z49T3LJ_hFeCeO1N',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      reward['title'],
                      style: const TextStyle(
                        color: blueText,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enjoy a 30% OFF on Kids Entry Ticket!',
                  style: TextStyle(
                    color: blueText,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Points needed:',
                      style: TextStyle(
                        color: blueText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${reward['points']}',
                          style: TextStyle(
                            color: reward['points'] >= reward['required']
                                ? greenText
                                : blueText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '/${reward['required']}',
                          style: TextStyle(
                            color: blueText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blueBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                        color: whiteText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ViewKidCard(
      kid: {
        'balance': 23.980,
        'savings': 33.870,
        'steps': 2902,
      },
    ),
    theme: ThemeData(
      primaryColor: blueBackground,
      scaffoldBackgroundColor: blueBackground,
    ),
  ));
}
