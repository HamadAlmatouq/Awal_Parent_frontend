import 'package:flutter/material.dart';

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

  void addGoal() {
    setState(() {
      goals.add({'name': 'New Goal', 'amount': 0});
    });
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
            // Tab Switcher
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 24.0, right: 16.0),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: goals.asMap().entries.map((entry) {
                            int index = entry.key;
                            Map<String, dynamic> goal = entry.value;
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
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 16),
                      AddGoalButton(onPressed: addGoal),
                      SizedBox(height: 16),
                    ],
                  ),
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
          width: double.infinity, // Make the button fit the width of the page
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: const Color(0xFF2575CC),
                width: 1,
                style: BorderStyle.solid // Dotted border style
                ),
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

void main() {
  runApp(MaterialApp(
    home: GoalsManagingScreen(),
  ));
}
