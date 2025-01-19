// import 'package:flutter/material.dart';

// class GoalsManagingScreen extends StatefulWidget {
//   @override
//   _GoalsManagingScreenState createState() => _GoalsManagingScreenState();
// }

// class _GoalsManagingScreenState extends State<GoalsManagingScreen> {
//   bool isInProgress = true;
//   List<Map<String, dynamic>> inProgressGoals = [
//     {'name': 'Stanley cup', 'amount': 50, 'date': '12 December 2024'},
//   ];
//   List<Map<String, dynamic>> achievedGoals = [
//     {'name': 'Stanley cup', 'amount': 50, 'date': '12 December 2024'},
//     {'name': 'Stanley cup', 'amount': 50, 'date': '12 December 2024'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF2575CC),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Header
//             Container(
//               width: double.infinity,
//               height: 56,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               color: Color(0xFF2575CC),
//               child: Center(
//                 child: Text(
//                   'Goals Managing',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w600,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             // Tab Switcher
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//               child: LayoutBuilder(
//                 builder: (context, constraints) {
//                   return Container(
//                     width: constraints.maxWidth,
//                     height: 35,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(
//                         color: const Color(0xFF2575CC),
//                         width: 1,
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 isInProgress = true;
//                               });
//                             },
//                             child: Container(
//                               height: 33,
//                               decoration: BoxDecoration(
//                                 color: isInProgress
//                                     ? const Color(0xFF2575CC)
//                                     : Colors.white,
//                                 borderRadius: BorderRadius.horizontal(
//                                   left: Radius.circular(10),
//                                 ),
//                               ),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 'In Progress',
//                                 style: TextStyle(
//                                   color: isInProgress
//                                       ? Colors.white
//                                       : const Color(0xFF9A9A9A),
//                                   fontSize: 16,
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 1,
//                           height: 34,
//                           color: const Color(0xFF2575CC),
//                         ),
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 isInProgress = false;
//                               });
//                             },
//                             child: Container(
//                               height: 33,
//                               decoration: BoxDecoration(
//                                 color: !isInProgress
//                                     ? const Color(0xFF2575CC)
//                                     : Colors.white,
//                                 borderRadius: BorderRadius.horizontal(
//                                   right: Radius.circular(10),
//                                 ),
//                               ),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 'Achieved',
//                                 style: TextStyle(
//                                   color: !isInProgress
//                                       ? Colors.white
//                                       : const Color(0xFF9A9A9A),
//                                   fontSize: 16,
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Main Content
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(25),
//                     topRight: Radius.circular(25),
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: Column(
//                           children:
//                               (isInProgress ? inProgressGoals : achievedGoals)
//                                   .map((goal) => GoalItem(
//                                         goalName: goal['name'],
//                                         amount: goal['amount'],
//                                         date: goal['date'],
//                                         isAchieved: !isInProgress,
//                                       ))
//                                   .toList(),
//                         ),
//                       ),
//                       SizedBox(height: 16),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class GoalItem extends StatelessWidget {
//   final String goalName;
//   final int amount;
//   final String date;
//   final bool isAchieved;

//   const GoalItem({
//     Key? key,
//     required this.goalName,
//     required this.amount,
//     required this.date,
//     required this.isAchieved,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       padding: EdgeInsets.all(12.0),
//       decoration: BoxDecoration(
//         color: isAchieved ? Color(0xFFD3E2F5) : Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Color(0xFF2575CC)),
//       ),
//       child: Row(
//         children: [
//           Image.network(
//             'https://dashboard.codeparrot.ai/api/assets/Z4oyQBgaGNOSvOa1', // Default image
//             width: 50,
//             height: 50,
//             fit: BoxFit.cover,
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   goalName,
//                   style: TextStyle(
//                     color: Color(0xFF2575CC),
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   date,
//                   style: TextStyle(
//                     color: Color(0xFF2575CC),
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             '$amount kwd',
//             style: TextStyle(
//               color: Color(0xFF2575CC),
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: GoalsManagingScreen(),
//   ));
// }

import 'package:bkid_frontend/batolPages/AddGoalsDialog.dart';
import 'package:flutter/material.dart';
// import 'add_goals_dialog.dart';

class GoalsManagingScreen extends StatefulWidget {
  @override
  _GoalsManagingScreenState createState() => _GoalsManagingScreenState();
}

class _GoalsManagingScreenState extends State<GoalsManagingScreen> {
  bool isInProgress = true;
  List<Map<String, dynamic>> goals = [
    {'name': 'Rare Blush', 'amount': 35},
    {'name': 'Rare Blush', 'amount': 35},
  ];

  void addGoal() async {
    final newGoal = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return AddGoalsDialog();
      },
    );

    if (newGoal != null) {
      setState(() {
        goals.add(newGoal);
      });
    }
  }

  void deleteGoal(int index) {
    setState(() {
      goals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2575CC),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Color(0xFF2575CC),
              child: Center(
                child: Text(
                  'Goals Managing',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Main Content
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    // Tab Switcher
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            width: constraints.maxWidth,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFF2575CC),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isInProgress = true;
                                      });
                                    },
                                    child: Container(
                                      height: 33,
                                      decoration: BoxDecoration(
                                        color: isInProgress
                                            ? const Color(0xFF2575CC)
                                            : Colors.white,
                                        borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(10),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'In Progress',
                                        style: TextStyle(
                                          color: isInProgress
                                              ? Colors.white
                                              : const Color(0xFF9A9A9A),
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 34,
                                  color: const Color(0xFF2575CC),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isInProgress = false;
                                      });
                                    },
                                    child: Container(
                                      height: 33,
                                      decoration: BoxDecoration(
                                        color: !isInProgress
                                            ? const Color(0xFF2575CC)
                                            : Colors.white,
                                        borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(10),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Achieved',
                                        style: TextStyle(
                                          color: !isInProgress
                                              ? Colors.white
                                              : const Color(0xFF9A9A9A),
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Goal Name',
                                      style: TextStyle(
                                        color: Color(0xFF2575CC),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Amount',
                                      style: TextStyle(
                                        color: Color(0xFF2575CC),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Image',
                                      style: TextStyle(
                                        color: Color(0xFF2575CC),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: goals.length,
                                itemBuilder: (context, index) {
                                  final goal = goals[index];
                                  return GoalItem(
                                    goalName: goal['name'],
                                    amount: goal['amount'],
                                    onAmountChanged: (newAmount) {
                                      setState(() {
                                        goal['amount'] = newAmount;
                                      });
                                    },
                                    onDelete: () => deleteGoal(index),
                                  );
                                },
                              ),
                            ),
                            AddGoalButton(onPressed: addGoal),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoalItem extends StatelessWidget {
  final String goalName;
  final int amount;
  final ValueChanged<int> onAmountChanged;
  final VoidCallback onDelete;

  const GoalItem({
    Key? key,
    required this.goalName,
    required this.amount,
    required this.onAmountChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF2575CC)),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                goalName,
                style: TextStyle(
                  color: Color(0xFF2575CC).withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF2575CC)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '$amount KD',
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
                onChanged: (value) {
                  int newAmount = int.tryParse(value) ?? amount;
                  onAmountChanged(newAmount);
                },
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    'https://dashboard.codeparrot.ai/api/assets/Z4oyQBgaGNOSvOa1', // Default image
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  icon: Image.network(
                      'https://dashboard.codeparrot.ai/api/assets/Z4oy1RgaGNOSvOa7'),
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddGoalButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddGoalButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: const Color(0xFF2575CC),
                width: 1,
                style: BorderStyle.solid),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://dashboard.codeparrot.ai/api/assets/Z4oyQBgaGNOSvOa2',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              const Text(
                'Add Goal',
                style: TextStyle(
                  color: Color(0xFF2575CC),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
