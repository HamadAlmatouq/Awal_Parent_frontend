import 'dart:convert';
import 'package:bkid_frontend/pages/add_goal_dialogue.dart';
import 'package:bkid_frontend/pages/tasks_page.dart';
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
    bool? confirmDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Delete Goal',
            style: TextStyle(
              color: Color(0xFF2575CC),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to delete this goal?',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (confirmDelete == true) {
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete goal: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
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
      body: Column(
        children: [
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 32.0, top: 24.0, bottom: 8.0),
                    child: Text(
                      'Goals',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2575CC),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: goals.isEmpty
                            ? _buildEmptyState()
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: goals.length,
                                itemBuilder: (context, index) {
                                  final goal = goals[index];
                                  return GoalItem(
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
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 24.0,
                    ),
                    child: AddGoalButton(onPressed: addGoal),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Icon(
            Icons.flag_outlined,
            size: 70,
            color: Color(0xFF2575CC).withOpacity(0.5),
          ),
          SizedBox(height: 16),
          Text(
            'No Goals Yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2575CC),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Create a goal by clicking the button below',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF2575CC).withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
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
      margin: EdgeInsets.symmetric(vertical: 12.0),
      elevation: 4,
      color: Color(0xFF7CACE0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            if (image != null && image!.isNotEmpty)
              Container(
                width: 80,
                height: 80,
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
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.image_not_supported, color: Colors.grey),
              ),
            SizedBox(width: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Goal Name',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        goalName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Amount',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '$amount KWD',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.remove_circle_outline,
                  color: Colors.white, size: 24),
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
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
                  fontSize: 16,
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
