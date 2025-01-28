import 'package:bkid_frontend/pages/add_task_dialogue.dart';
import 'package:bkid_frontend/services/task_services.dart';
import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xFF2575CC);
const Color cardBackgroundColor = Color(0xFFFFFFFF);
const Color blueCardColor = Color(0xFF2575CC);
const Color newCardColor = Color(0xFF7CACE0);
const Color whiteTextColor = Color(0xFFFFFFFF);
const Color blueTextColor = Color(0xFF2575CC);
const Color whiteCard = Color(0xFFFFFFFF);

class CreateTaskScreen extends StatefulWidget {
  final String kidName;

  CreateTaskScreen({required this.kidName});

  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  bool isInProgress = true;
  List<Map<String, dynamic>> inProgressTasks = [];
  List<Map<String, dynamic>> doneTasks = [];

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  void fetchTasks() async {
    try {
      List<Map<String, dynamic>> tasks =
          await TaskServices().getTasksByKidName(widget.kidName);
      setState(() {
        inProgressTasks = tasks
            .where((task) =>
                task['status'] == 'in_progress' || task['status'] == null)
            .toList();
        doneTasks = tasks.where((task) => task['status'] == 'done').toList();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching tasks: $e')),
      );
    }
  }

  void addTask() async {
    final newTask = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog(kidName: widget.kidName);
      },
    );

    if (newTask != null) {
      fetchTasks(); // Refresh the tasks list
    }
  }

  Future<void> deleteTask(String title) async {
    bool? confirmDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Delete Task',
            style: TextStyle(
              color: Color(0xFF2575CC),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to delete this task?',
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
      try {
        await TaskServices().deleteTask(title, widget.kidName);
        setState(() {
          inProgressTasks.removeWhere((task) =>
              task['title'] == title && task['Kname'] == widget.kidName);
          doneTasks.removeWhere((task) =>
              task['title'] == title && task['Kname'] == widget.kidName);
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete task: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void completeTask(int index) {
    setState(() {
      doneTasks.add(inProgressTasks[index]);
      inProgressTasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Create Task',
          style: const TextStyle(
            color: whiteTextColor,
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
                color: cardBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 32.0,
                        top: 24.0,
                        bottom: 8.0), // Updated padding to match goals page
                    child: Align(
                      alignment: Alignment.centerLeft, // Changed alignment
                      child: Text(
                        'Tasks',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: blueTextColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          width: constraints.maxWidth,
                          height: 8,
                          decoration: BoxDecoration(
                            color: cardBackgroundColor,
                          ),
                          child: Row(
                            children: [],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: inProgressTasks.isEmpty
                            ? _buildEmptyState()
                            : Column(
                                children: inProgressTasks
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int index = entry.key;
                                  Map<String, dynamic> task = entry.value;
                                  return NewTaskCard(
                                    taskName: task['title'] ?? '',
                                    fees: task['amount'] ?? 0,
                                    duration: task['duration'].toString(),
                                    onDelete: () async {
                                      await deleteTask(task['title'] ?? '');
                                      setState(() {
                                        if (isInProgress) {
                                          inProgressTasks.removeAt(index);
                                        } else {
                                          doneTasks.removeAt(index);
                                        }
                                      });
                                    },
                                    onComplete: isInProgress
                                        ? () => completeTask(index)
                                        : null,
                                  );
                                }).toList(),
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24.0),
                    child: AddTaskButton(onPressed: addTask),
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
            Icons.assignment_outlined,
            size: 70,
            color: blueTextColor.withOpacity(0.5),
          ),
          SizedBox(height: 16),
          Text(
            'No Tasks Yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: blueTextColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Create a task by clicking the button below',
            style: TextStyle(
              fontSize: 14,
              color: blueTextColor.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class NewTaskCard extends StatelessWidget {
  final String taskName;
  final int fees;
  final String duration;
  final VoidCallback onDelete;
  final VoidCallback? onComplete;

  const NewTaskCard({
    Key? key,
    required this.taskName,
    required this.fees,
    required this.duration,
    required this.onDelete,
    this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: newCardColor,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task Name:',
                  style: TextStyle(
                    fontSize: 14,
                    color: whiteTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: whiteTextColor,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Duration:',
                            style: TextStyle(
                              fontSize: 14,
                              color: whiteTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '$duration h',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: whiteTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amount:',
                            style: TextStyle(
                              fontSize: 14,
                              color: whiteTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '$fees KD',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: whiteTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 16,
          top: 0,
          bottom: 0,
          child: Center(
            child: IconButton(
              icon: Icon(Icons.remove_circle_outline,
                  color: Colors.white, size: 24),
              onPressed: onDelete,
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
          ),
        ),
      ],
    );
  }
}

class AddTaskButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddTaskButton({
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
            color: whiteCard,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: blueTextColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: blueTextColor),
              const SizedBox(width: 8),
              const Text(
                'Add Task',
                style: TextStyle(
                  color: blueTextColor,
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
