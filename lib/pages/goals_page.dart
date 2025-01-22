// import 'package:bkid_frontend/pages/add_goal_dialogue.dart';
// import 'package:bkid_frontend/services/goal_services.dart';
// import 'package:flutter/material.dart';

// class GoalsManagingScreen extends StatefulWidget {
//   final String kidName;

//   const GoalsManagingScreen({super.key, required this.kidName});

//   @override
//   _GoalsManagingScreenState createState() => _GoalsManagingScreenState();
// }

// class _GoalsManagingScreenState extends State<GoalsManagingScreen> {
//   bool isInProgress = true;
//   List<Map<String, dynamic>> goals = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchGoals();
//   }

//   void fetchGoals() async {
//     try {
//       goals = await GoalServices().getGoalsByKidName(widget.kidName);
//       setState(() {});
//     } catch (e) {
//       print("Error fetching goals: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching goals: $e')),
//       );
//     }
//   }

//   void addGoal() async {
//     final newGoal = await showDialog<Map<String, dynamic>>(
//       context: context,
//       builder: (BuildContext context) {
//         return const AddGoalsDialog();
//       },
//     );

//     if (newGoal != null) {
//       newGoal['Kname'] = widget.kidName;
//       if (newGoal.containsKey('name')) {
//         newGoal['title'] = newGoal.remove('name'); // Rename 'name' to 'title'
//       }
//       try {
//         await GoalServices().createGoal(newGoal);
//         fetchGoals(); // Refresh the goals list
//       } catch (e) {
//         print("Error creating goal: $e");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error creating goal: $e')),
//         );
//       }
//     }
//   }

//   void deleteGoal(String? goalId) async {
//     if (goalId == null) {
//       print("Error: goalId is null");
//       return;
//     }
//     try {
//       await GoalServices().deleteGoal(goalId);
//       fetchGoals(); // Refresh the goals list
//     } catch (e) {
//       print("Error deleting goal: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error deleting goal: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF2575CC),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF2575CC),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           'Goals Managing',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//             fontFamily: 'Inter',
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Main Content
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(25),
//                     topRight: Radius.circular(25),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     // Tab Switcher
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16.0, vertical: 16.0),
//                       child: LayoutBuilder(
//                         builder: (context, constraints) {
//                           return Container(
//                             width: constraints.maxWidth,
//                             height: 35,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(
//                                 color: const Color(0xFF2575CC),
//                                 width: 1,
//                               ),
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         isInProgress = true;
//                                       });
//                                     },
//                                     child: Container(
//                                       height: 33,
//                                       decoration: BoxDecoration(
//                                         color: isInProgress
//                                             ? const Color(0xFF2575CC)
//                                             : Colors.white,
//                                         borderRadius:
//                                             const BorderRadius.horizontal(
//                                           left: Radius.circular(10),
//                                         ),
//                                       ),
//                                       alignment: Alignment.center,
//                                       child: Text(
//                                         'In Progress',
//                                         style: TextStyle(
//                                           color: isInProgress
//                                               ? Colors.white
//                                               : const Color(0xFF9A9A9A),
//                                           fontSize: 16,
//                                           fontFamily: 'Inter',
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   width: 1,
//                                   height: 34,
//                                   color: const Color(0xFF2575CC),
//                                 ),
//                                 Expanded(
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         isInProgress = false;
//                                       });
//                                     },
//                                     child: Container(
//                                       height: 33,
//                                       decoration: BoxDecoration(
//                                         color: !isInProgress
//                                             ? const Color(0xFF2575CC)
//                                             : Colors.white,
//                                         borderRadius:
//                                             const BorderRadius.horizontal(
//                                           right: Radius.circular(10),
//                                         ),
//                                       ),
//                                       alignment: Alignment.center,
//                                       child: Text(
//                                         'Achieved',
//                                         style: TextStyle(
//                                           color: !isInProgress
//                                               ? Colors.white
//                                               : const Color(0xFF9A9A9A),
//                                           fontSize: 16,
//                                           fontFamily: 'Inter',
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 24.0),
//                               child: SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Row(
//                                   children: [
//                                     SizedBox(
//                                       width: 100,
//                                       child: const Text(
//                                         'Goal Name',
//                                         style: TextStyle(
//                                           color: Color(0xFF2575CC),
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 100,
//                                       child: const Text(
//                                         'Amount',
//                                         style: TextStyle(
//                                           color: Color(0xFF2575CC),
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 100,
//                                       child: const Text(
//                                         'End Date',
//                                         style: TextStyle(
//                                           color: Color(0xFF2575CC),
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: ListView.builder(
//                                 itemCount: goals.length,
//                                 itemBuilder: (context, index) {
//                                   final goal = goals[index];
//                                   return SingleChildScrollView(
//                                     scrollDirection: Axis.horizontal,
//                                     child: GoalItem(
//                                       goalId: goal['id'] as String?,
//                                       goalName: goal['title'],
//                                       amount: goal['amount'],
//                                       endDate: goal['endDate'],
//                                       onAmountChanged: (newAmount) {
//                                         setState(() {
//                                           goal['amount'] = newAmount;
//                                         });
//                                       },
//                                       onDelete: () =>
//                                           deleteGoal(goal['id'] as String?),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                             AddGoalButton(onPressed: addGoal),
//                             const SizedBox(height: 16),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
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
//   final String? goalId;
//   final String goalName;
//   final int amount;
//   final String endDate;
//   final ValueChanged<int> onAmountChanged;
//   final VoidCallback onDelete;

//   const GoalItem({
//     super.key,
//     required this.goalId,
//     required this.goalName,
//     required this.amount,
//     required this.endDate,
//     required this.onAmountChanged,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Container(
//             width: 100,
//             height: 48,
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             decoration: BoxDecoration(
//               border: Border.all(color: const Color(0xFF2575CC)),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             alignment: Alignment.centerLeft,
//             child: Text(
//               goalName,
//               style: TextStyle(
//                 color: const Color(0xFF2575CC).withOpacity(0.5),
//                 fontSize: 14,
//               ),
//             ),
//           ),
//           const SizedBox(width: 8),
//           Container(
//             width: 100,
//             height: 48,
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             decoration: BoxDecoration(
//               border: Border.all(color: const Color(0xFF2575CC)),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: TextField(
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: '$amount KD',
//                 hintStyle: TextStyle(
//                   color: Colors.grey.withOpacity(0.5),
//                   fontSize: 14,
//                 ),
//               ),
//               onChanged: (value) {
//                 int newAmount = int.tryParse(value) ?? amount;
//                 onAmountChanged(newAmount);
//               },
//             ),
//           ),
//           const SizedBox(width: 8),
//           Container(
//             width: 100,
//             height: 48,
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             decoration: BoxDecoration(
//               border: Border.all(color: const Color(0xFF2575CC)),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             alignment: Alignment.centerLeft,
//             child: Text(
//               endDate,
//               style: TextStyle(
//                 color: const Color(0xFF2575CC).withOpacity(0.5),
//                 fontSize: 14,
//               ),
//             ),
//           ),
//           const SizedBox(width: 8),
//           IconButton(
//             icon: const Icon(Icons.delete, color: Colors.red),
//             onPressed: onDelete,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AddGoalButton extends StatelessWidget {
//   final VoidCallback onPressed;

//   const AddGoalButton({
//     super.key,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: GestureDetector(
//         onTap: onPressed,
//         child: Container(
//           height: 48,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(
//                 color: const Color(0xFF2575CC),
//                 width: 1,
//                 style: BorderStyle.solid),
//           ),
//           child: const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.add, color: Color(0xFF2575CC)),
//               SizedBox(width: 8),
//               Text(
//                 'Add Goal',
//                 style: TextStyle(
//                   color: Color(0xFF2575CC),
//                   fontSize: 12,
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class GoalsManagingScreen extends StatefulWidget {
  final String kidName;

  const GoalsManagingScreen({super.key, required this.kidName});

  @override
  _GoalsManagingScreenState createState() => _GoalsManagingScreenState();
}

class _GoalsManagingScreenState extends State<GoalsManagingScreen> {
  bool isInProgress = true;
  List<Map<String, dynamic>> goals = [];

  List<Map<String, dynamic>> dummyGoals = [
    {
      'id': '1',
      'title': 'New Bike',
      'amount': 150,
      'endDate': '2024-06-01',
      'isAchieved': false,
    },
    {
      'id': '2',
      'title': 'PlayStation 5',
      'amount': 300,
      'endDate': '2024-07-15',
      'isAchieved': false,
    },
    {
      'id': '3',
      'title': 'iPad',
      'amount': 250,
      'endDate': '2024-08-30',
      'isAchieved': true,
    },
    {
      'id': '4',
      'title': 'Nintendo Switch',
      'amount': 200,
      'endDate': '2024-05-20',
      'isAchieved': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    fetchGoals();
  }

  void fetchGoals() {
    setState(() {
      goals = dummyGoals
          .where(
              (goal) => isInProgress ? !goal['isAchieved'] : goal['isAchieved'])
          .toList();
    });
  }

  void addGoal() async {
    // Simulating adding a new goal
    final newGoal = {
      'id': (dummyGoals.length + 1).toString(),
      'title': 'New Goal',
      'amount': 100,
      'endDate': '2024-12-31',
      'isAchieved': false,
    };

    setState(() {
      dummyGoals.add(newGoal);
      fetchGoals();
    });
  }

  void deleteGoal(String? goalId) {
    if (goalId == null) return;
    setState(() {
      dummyGoals.removeWhere((goal) => goal['id'] == goalId);
      fetchGoals();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Goal deleted'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2575CC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2575CC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Goals Managing',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
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
                                        fetchGoals();
                                      });
                                    },
                                    child: Container(
                                      height: 33,
                                      decoration: BoxDecoration(
                                        color: isInProgress
                                            ? const Color(0xFF2575CC)
                                            : Colors.white,
                                        borderRadius:
                                            const BorderRadius.horizontal(
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
                                        fetchGoals();
                                      });
                                    },
                                    child: Container(
                                      height: 33,
                                      decoration: BoxDecoration(
                                        color: !isInProgress
                                            ? const Color(0xFF2575CC)
                                            : Colors.white,
                                        borderRadius:
                                            const BorderRadius.horizontal(
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
                        child: ListView.builder(
                          itemCount: goals.length,
                          itemBuilder: (context, index) {
                            final goal = goals[index];
                            return Dismissible(
                              key: Key(goal['id']),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                setState(() {
                                  final goalToUpdate = dummyGoals.firstWhere(
                                      (g) => g['id'] == goals[index]['id']);
                                  goalToUpdate['isAchieved'] = true;
                                  goals.removeAt(index);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Goal marked as achieved'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              },
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20.0),
                                color: Colors.green,
                                child: const Icon(Icons.check,
                                    color: Colors.white),
                              ),
                              child: GoalCard(
                                goalName: goal['title'],
                                amount: goal['amount'],
                                endDate: goal['endDate'],
                                onDelete: () => deleteGoal(goal['id']),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    AddGoalButton(onPressed: addGoal),
                    const SizedBox(height: 16),
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

class GoalCard extends StatelessWidget {
  final String goalName;
  final int amount;
  final String endDate;
  final VoidCallback onDelete;

  const GoalCard({
    super.key,
    required this.goalName,
    required this.amount,
    required this.endDate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF7CACE0),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                goalName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$amount KD',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                endDate,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}

class AddGoalButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddGoalButton({
    super.key,
    required this.onPressed,
  });

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
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: const Color(0xFF2575CC),
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Color(0xFF2575CC)),
              SizedBox(width: 8),
              Text(
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
