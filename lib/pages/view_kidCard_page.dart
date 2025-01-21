// import 'package:bkid_frontend/pages/allowance_dialogue.dart';
// import 'package:bkid_frontend/pages/goals_page.dart';
// import 'package:bkid_frontend/pages/restrictions_page.dart';
// import 'package:bkid_frontend/pages/tasks_page.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class ViewKidCard extends StatelessWidget {
//   final Map<String, dynamic> kid;

//   const ViewKidCard({super.key, required this.kid});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.white),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         const CircleAvatar(
//                           radius: 30,
//                           backgroundImage: AssetImage('assets/kid_image.png'),
//                         ),
//                         const SizedBox(width: 16),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               kid['Kname'] ?? 'Unknown',
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                             const Text(
//                               '1234 5678 XXXX XXXX',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const Spacer(),
//                         const Icon(Icons.qr_code, color: Colors.blue),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _buildInfoColumn('Balance',
//                             '${kid['balance'] ?? 0.0} KWD', Colors.blue),
//                         _buildInfoColumn('Savings',
//                             '${kid['savings'] ?? 0.0} KWD', Colors.blue),
//                         _buildInfoColumn(
//                             'Steps', '${kid['steps'] ?? 0}', Colors.blue),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       context.push('/tasks');
//                     },
//                     child: const Column(
//                       children: [
//                         CircleAvatar(
//                           radius: 30,
//                           backgroundColor: Colors.white,
//                           child: Icon(Icons.checklist,
//                               color: Colors.blue, size: 30),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Tasks',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AllowanceDialog();
//                         },
//                       );
//                     },
//                     child: const Column(
//                       children: [
//                         CircleAvatar(
//                           radius: 30,
//                           backgroundColor: Colors.white,
//                           child:
//                               Icon(Icons.money, color: Colors.blue, size: 30),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Allowance',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       context.push('/restriction');
//                     },
//                     child: const Column(
//                       children: [
//                         CircleAvatar(
//                           radius: 30,
//                           backgroundColor: Colors.white,
//                           child:
//                               Icon(Icons.shield, color: Colors.blue, size: 30),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Restriction',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       context.push('/goals', extra: kid['Kname']);
//                     },
//                     child: const Column(
//                       children: [
//                         CircleAvatar(
//                           radius: 30,
//                           backgroundColor: Colors.white,
//                           child: Icon(Icons.flag, color: Colors.blue, size: 30),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Goals',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Redeem points:',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8),
//             ..._buildRewardCards(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoColumn(String title, String value, Color color) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: color,
//           ),
//         ),
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 14,
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     );
//   }

//   List<Widget> _buildRewardCards() {
//     final List<Map<String, dynamic>> rewards = [
//       // {'title': 'dabdoob', 'points': '3213/1500', 'color': Colors.green},
//       // {'title': 'Kidzania', 'points': '3213/3000', 'color': Colors.green},
//       // {'title': 'SEPHORA', 'points': '3213/4000', 'color': Colors.red},
//     ];

//     return rewards.map((Map<String, dynamic> reward) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: reward['color'],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 reward['title'],
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 reward['points'],
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }).toList();
//   }
// }
import 'package:bkid_frontend/pages/allowance_dialogue.dart';
import 'package:bkid_frontend/pages/goals_page.dart';
import 'package:bkid_frontend/pages/restrictions_page.dart';
import 'package:bkid_frontend/pages/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: whiteText),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: whitecard,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          '1234 5678 XXXX XXXX',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${kid['balance'] ?? 0.0} KWD',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: blueText,
                          ),
                        ),
                        const Divider(color: Colors.grey),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildInfoColumn('Points', '3213', blueText),
                            _buildInfoColumn('Savings',
                                '${kid['savings'] ?? 0.0} KWD', blueText),
                            _buildInfoColumn(
                                'Steps', '${kid['steps'] ?? 0}', blueText),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -20,
                    left: -20,
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/kid_image.png'),
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
                  _buildCircleButton(
                      context, Icons.checklist, 'Tasks', '/tasks'),
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
            ..._buildRewardCards(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
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
            builder: (BuildContext context) {
              return AllowanceDialog();
            },
          );
        } else if (route != null) {
          context.push(route, extra: extra);
        }
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: blueCard,
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

  List<Widget> _buildRewardCards() {
    final List<Map<String, dynamic>> rewards = [
      {'title': 'dabdoob', 'points': '3213/1500', 'color': whitecard},
      {'title': 'Kidzania', 'points': '3213/3000', 'color': whitecard},
      {'title': 'SEPHORA', 'points': '3213/4000', 'color': whitecard},
    ];

    return rewards.map((Map<String, dynamic> reward) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: reward['color'],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Image.network(
                'https://dashboard.codeparrot.ai/api/assets/Z49T3LJ_hFeCeO1N',
                width: 50,
                height: 50,
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      reward['points'],
                      style: const TextStyle(
                        color: blueText,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}

const Color blueBackground = Color(0xFF2675CC);
const Color blueCard = Color(0xFF7CACE0);
const Color blueText = Color(0xFF2575CC);
const Color whiteText = Color(0xFFFFFFFF);
const Color whitecard = Color(0xFFFFFFFF);
