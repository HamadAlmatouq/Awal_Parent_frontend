import 'package:bkid_frontend/pages/add_goal_dialogue.dart';
import 'package:bkid_frontend/services/goal_services.dart';
import 'package:flutter/material.dart';

class GoalsManagingScreen extends StatefulWidget {
  final String kidName;

  GoalsManagingScreen({required this.kidName});

  @override
  _GoalsManagingScreenState createState() => _GoalsManagingScreenState();
}

class _GoalsManagingScreenState extends State<GoalsManagingScreen> {
  bool isInProgress = true;
  List<Map<String, dynamic>> goals = [];

  @override
  void initState() {
    super.initState();
    fetchGoals();
  }

  void fetchGoals() async {
    try {
      goals = await GoalServices().getGoalsByKidName(widget.kidName);
      setState(() {});
    } catch (e) {
      print("Error fetching goals: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching goals: $e')),
      );
    }
  }

  void addGoal() async {
    final newGoal = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return AddGoalsDialog();
      },
    );

    if (newGoal != null) {
      newGoal['Kname'] = widget.kidName;
      if (newGoal.containsKey('name')) {
        newGoal['title'] = newGoal.remove('name'); // Rename 'name' to 'title'
      }
      try {
        await GoalServices().createGoal(newGoal);
        fetchGoals(); // Refresh the goals list
      } catch (e) {
        print("Error creating goal: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating goal: $e')),
        );
      }
    }
  }

  void deleteGoal(String? goalId) async {
    if (goalId == null) {
      print("Error: goalId is null");
      return;
    }
    try {
      await GoalServices().deleteGoal(goalId);
      fetchGoals(); // Refresh the goals list
    } catch (e) {
      print("Error deleting goal: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting goal: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2575CC),
      appBar: AppBar(
        backgroundColor: Color(0xFF2575CC),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Goals Managing',
          style: const TextStyle(
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
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'Goal Name',
                                        style: TextStyle(
                                          color: Color(0xFF2575CC),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'Amount',
                                        style: TextStyle(
                                          color: Color(0xFF2575CC),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'End Date',
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
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: goals.length,
                                itemBuilder: (context, index) {
                                  final goal = goals[index];
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: GoalItem(
                                      goalId: goal['id'] as String?,
                                      goalName: goal['title'],
                                      amount: goal['amount'],
                                      endDate: goal['endDate'],
                                      onAmountChanged: (newAmount) {
                                        setState(() {
                                          goal['amount'] = newAmount;
                                        });
                                      },
                                      onDelete: () =>
                                          deleteGoal(goal['id'] as String?),
                                    ),
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
  final String? goalId;
  final String goalName;
  final int amount;
  final String endDate;
  final ValueChanged<int> onAmountChanged;
  final VoidCallback onDelete;

  const GoalItem({
    Key? key,
    required this.goalId,
    required this.goalName,
    required this.amount,
    required this.endDate,
    required this.onAmountChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 100,
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
          SizedBox(width: 8),
          Container(
            width: 100,
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
          SizedBox(width: 8),
          Container(
            width: 100,
            height: 48,
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF2575CC)),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              endDate,
              style: TextStyle(
                color: Color(0xFF2575CC).withOpacity(0.5),
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
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
              Icon(Icons.add, color: Color(0xFF2575CC)),
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
