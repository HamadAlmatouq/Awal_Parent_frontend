import 'dart:convert';
import 'package:bkid_frontend/pages/add_goal_dialogue.dart';
import 'package:bkid_frontend/services/goal_services.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../services/client.dart';

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

  Future<void> deleteGoal(String title) async {
    if (title.isEmpty || widget.kidName.isEmpty) {
      print('Error: title or Kname is empty');
      return;
    }

    try {
      print('Deleting goal with title: $title and Kname: ${widget.kidName}');
      await GoalServices().deleteGoal(title, widget.kidName);
      setState(() {
        goals.removeWhere((goal) =>
            goal['title'] == title && goal['Kname'] == widget.kidName);
      });
    } catch (e) {
      print('Error deleting goal: $e');
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
                    /*
                    /
                    /
                    /
                    /
                    /
                    /
                    // Tab Switcher
                    /
                    /
                    /
                    /
                    /
                    */
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
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: GoalItem(
                                      goalId: goal['id'] as String?,
                                      goalName: goal['title'] ?? '',
                                      amount: goal['amount'] ?? 0,
                                      endDate: goal['endDate'] ?? '',
                                      image: goal['image'] as String?,
                                      onAmountChanged: (newAmount) {
                                        setState(() {
                                          goal['amount'] = newAmount;
                                        });
                                      },
                                      onDelete: () =>
                                          deleteGoal(goal['title'] ?? ''),
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
  final String? image;
  final ValueChanged<int> onAmountChanged;
  final VoidCallback onDelete;

  const GoalItem({
    Key? key,
    required this.goalId,
    required this.goalName,
    required this.amount,
    required this.endDate,
    this.image,
    required this.onAmountChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      elevation: 2,
      color: Color(0xFF7CACE0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Square image on the left
            if (image != null && image!.isNotEmpty)
              Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.memory(
                    base64Decode(image!),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      print('Error loading image: $error');
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:
                            Icon(Icons.image_not_supported, color: Colors.grey),
                      );
                    },
                  ),
                ),
              )
            else
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.image_not_supported, color: Colors.grey),
              ),
            SizedBox(width: 12),
            // Goal details
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title column
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Goal Name',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          goalName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Amount column
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '$amount ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              TextSpan(
                                text: 'KWD',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            // Delete button
            IconButton(
              icon: Icon(Icons.delete, color: Colors.white, size: 20),
              onPressed: onDelete,
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
          ],
        ),
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
              style: BorderStyle.solid,
            ),
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
