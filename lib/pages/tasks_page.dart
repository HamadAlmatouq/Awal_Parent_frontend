// // // // // import 'package:flutter/material.dart';

// // // // // class TasksPage extends StatelessWidget {
// // // // //   const TasksPage({super.key});

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: const Text('Tasks'),
// // // // //       ),
// // // // //       body: const Center(
// // // // //         child: Text('Tasks Page'),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:flutter/material.dart';

// // // // const Color blueBackground = Color(0xFF2675CC); // Blue background
// // // // const Color blueCard = Color(0xFF7CACE0); // Blue card
// // // // const Color blueText = Color(0xFF2575CC); // Blue text
// // // // const Color whiteText = Color(0xFFFFFFFF); // White text
// // // // const Color whiteCard = Color(0xFFFFFFFF); // White card

// // // // class TasksManagingScreen extends StatefulWidget {
// // // //   final String kidName;

// // // //   const TasksManagingScreen({super.key, required this.kidName});

// // // //   @override
// // // //   _TasksManagingScreenState createState() => _TasksManagingScreenState();
// // // // }

// // // // class _TasksManagingScreenState extends State<TasksManagingScreen> {
// // // //   bool isInProgress = true;
// // // //   List<Map<String, dynamic>> tasks = [];

// // // //   List<Map<String, dynamic>> dummyTasks = [
// // // //     {
// // // //       'id': '1',
// // // //       'title': 'Complete Homework',
// // // //       'amount': 0,
// // // //       'endDate': '2024-06-01',
// // // //       'isAchieved': false,
// // // //     },
// // // //     {
// // // //       'id': '2',
// // // //       'title': 'Clean Room',
// // // //       'amount': 0,
// // // //       'endDate': '2024-07-15',
// // // //       'isAchieved': false,
// // // //     },
// // // //     {
// // // //       'id': '3',
// // // //       'title': 'Buy Groceries',
// // // //       'amount': 0,
// // // //       'endDate': '2024-08-30',
// // // //       'isAchieved': true,
// // // //     },
// // // //     {
// // // //       'id': '4',
// // // //       'title': 'Exercise',
// // // //       'amount': 0,
// // // //       'endDate': '2024-05-20',
// // // //       'isAchieved': false,
// // // //     },
// // // //   ];

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     fetchTasks();
// // // //   }

// // // //   void fetchTasks() {
// // // //     setState(() {
// // // //       tasks = dummyTasks
// // // //           .where(
// // // //               (task) => isInProgress ? !task['isAchieved'] : task['isAchieved'])
// // // //           .toList();
// // // //     });
// // // //   }

// // // //   void addTask() async {
// // // //     final newTask = {
// // // //       'id': (dummyTasks.length + 1).toString(),
// // // //       'title': 'New Task',
// // // //       'amount': 0,
// // // //       'endDate': '2024-12-31',
// // // //       'isAchieved': false,
// // // //     };

// // // //     setState(() {
// // // //       dummyTasks.add(newTask);
// // // //       fetchTasks();
// // // //     });
// // // //   }

// // // //   void deleteTask(String? taskId) {
// // // //     if (taskId == null) return;
// // // //     setState(() {
// // // //       dummyTasks.removeWhere((task) => task['id'] == taskId);
// // // //       fetchTasks();
// // // //     });
// // // //     ScaffoldMessenger.of(context).showSnackBar(
// // // //       const SnackBar(
// // // //         content: Text('Task deleted'),
// // // //         backgroundColor: Colors.red,
// // // //       ),
// // // //     );
// // // //   }

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
// // // //         title: const Text(
// // // //           'Tasks',
// // // //           style: TextStyle(
// // // //             color: whiteText,
// // // //             fontSize: 24,
// // // //             fontFamily: 'Inter',
// // // //             fontWeight: FontWeight.w600,
// // // //           ),
// // // //         ),
// // // //         centerTitle: true,
// // // //       ),
// // // //       body: Column(
// // // //         children: [
// // // //           Expanded(
// // // //             child: Container(
// // // //               width: double.infinity,
// // // //               decoration: const BoxDecoration(
// // // //                 color: whiteCard,
// // // //                 borderRadius: BorderRadius.only(
// // // //                   topLeft: Radius.circular(25),
// // // //                   topRight: Radius.circular(25),
// // // //                 ),
// // // //               ),
// // // //               child: Column(
// // // //                 children: [
// // // //                   Padding(
// // // //                     padding: const EdgeInsets.symmetric(
// // // //                         horizontal: 16.0, vertical: 16.0),
// // // //                     child: LayoutBuilder(
// // // //                       builder: (context, constraints) {
// // // //                         return Container(
// // // //                           width: constraints.maxWidth,
// // // //                           height: 35,
// // // //                           decoration: BoxDecoration(
// // // //                             color: whiteCard,
// // // //                             borderRadius: BorderRadius.circular(10),
// // // //                             border: Border.all(
// // // //                               color: blueText,
// // // //                               width: 1,
// // // //                             ),
// // // //                           ),
// // // //                           child: Row(
// // // //                             children: [
// // // //                               Expanded(
// // // //                                 child: GestureDetector(
// // // //                                   onTap: () {
// // // //                                     setState(() {
// // // //                                       isInProgress = true;
// // // //                                       fetchTasks();
// // // //                                     });
// // // //                                   },
// // // //                                   child: Container(
// // // //                                     height: 33,
// // // //                                     decoration: BoxDecoration(
// // // //                                       color:
// // // //                                           isInProgress ? blueText : whiteCard,
// // // //                                       borderRadius:
// // // //                                           const BorderRadius.horizontal(
// // // //                                         left: Radius.circular(10),
// // // //                                       ),
// // // //                                     ),
// // // //                                     alignment: Alignment.center,
// // // //                                     child: Text(
// // // //                                       'In Progress',
// // // //                                       style: TextStyle(
// // // //                                         color: isInProgress
// // // //                                             ? whiteText
// // // //                                             : const Color(0xFF9A9A9A),
// // // //                                         fontSize: 16,
// // // //                                         fontFamily: 'Inter',
// // // //                                         fontWeight: FontWeight.w600,
// // // //                                       ),
// // // //                                     ),
// // // //                                   ),
// // // //                                 ),
// // // //                               ),
// // // //                               Container(
// // // //                                 width: 1,
// // // //                                 height: 34,
// // // //                                 color: blueText,
// // // //                               ),
// // // //                               Expanded(
// // // //                                 child: GestureDetector(
// // // //                                   onTap: () {
// // // //                                     setState(() {
// // // //                                       isInProgress = false;
// // // //                                       fetchTasks();
// // // //                                     });
// // // //                                   },
// // // //                                   child: Container(
// // // //                                     height: 33,
// // // //                                     decoration: BoxDecoration(
// // // //                                       color:
// // // //                                           !isInProgress ? blueText : whiteCard,
// // // //                                       borderRadius:
// // // //                                           const BorderRadius.horizontal(
// // // //                                         right: Radius.circular(10),
// // // //                                       ),
// // // //                                     ),
// // // //                                     alignment: Alignment.center,
// // // //                                     child: Text(
// // // //                                       'Completed',
// // // //                                       style: TextStyle(
// // // //                                         color: !isInProgress
// // // //                                             ? whiteText
// // // //                                             : const Color(0xFF9A9A9A),
// // // //                                         fontSize: 16,
// // // //                                         fontFamily: 'Inter',
// // // //                                         fontWeight: FontWeight.w600,
// // // //                                       ),
// // // //                                     ),
// // // //                                   ),
// // // //                                 ),
// // // //                               ),
// // // //                             ],
// // // //                           ),
// // // //                         );
// // // //                       },
// // // //                     ),
// // // //                   ),
// // // //                   Expanded(
// // // //                     child: Padding(
// // // //                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // //                       child: ListView.builder(
// // // //                         itemCount: tasks.length,
// // // //                         itemBuilder: (context, index) {
// // // //                           final task = tasks[index];
// // // //                           return Dismissible(
// // // //                             key: Key(task['id']),
// // // //                             direction: DismissDirection.endToStart,
// // // //                             onDismissed: (direction) {
// // // //                               setState(() {
// // // //                                 final taskToUpdate = dummyTasks.firstWhere(
// // // //                                     (t) => t['id'] == tasks[index]['id']);
// // // //                                 taskToUpdate['isAchieved'] = true;
// // // //                                 tasks.removeAt(index);
// // // //                               });
// // // //                               ScaffoldMessenger.of(context).showSnackBar(
// // // //                                 const SnackBar(
// // // //                                   content: Text('Task marked as completed'),
// // // //                                   backgroundColor: Colors.green,
// // // //                                 ),
// // // //                               );
// // // //                             },
// // // //                             background: Container(
// // // //                               alignment: Alignment.centerRight,
// // // //                               padding: const EdgeInsets.only(right: 20.0),
// // // //                               color: Colors.green,
// // // //                               child: const Icon(Icons.check, color: whiteText),
// // // //                             ),
// // // //                             child: TaskCard(
// // // //                               taskName: task['title'],
// // // //                               amount: task['amount'],
// // // //                               endDate: task['endDate'],
// // // //                               onDelete: () => deleteTask(task['id']),
// // // //                             ),
// // // //                           );
// // // //                         },
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                   AddTaskButton(onPressed: addTask),
// // // //                   const SizedBox(height: 16),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // class TaskCard extends StatelessWidget {
// // // //   final String taskName;
// // // //   final int amount;
// // // //   final String endDate;
// // // //   final VoidCallback onDelete;

// // // //   const TaskCard({
// // // //     super.key,
// // // //     required this.taskName,
// // // //     required this.amount,
// // // //     required this.endDate,
// // // //     required this.onDelete,
// // // //   });

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Container(
// // // //       margin: const EdgeInsets.symmetric(vertical: 8.0),
// // // //       padding: const EdgeInsets.all(16.0),
// // // //       decoration: BoxDecoration(
// // // //         color: blueCard,
// // // //         borderRadius: BorderRadius.circular(25),
// // // //       ),
// // // //       child: Row(
// // // //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //         children: [
// // // //           Column(
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             children: [
// // // //               Text(
// // // //                 taskName,
// // // //                 style: const TextStyle(
// // // //                   color: whiteText,
// // // //                   fontSize: 18,
// // // //                   fontWeight: FontWeight.bold,
// // // //                 ),
// // // //               ),
// // // //               Text(
// // // //                 '$amount KD',
// // // //                 style: const TextStyle(
// // // //                   color: whiteText,
// // // //                   fontSize: 16,
// // // //                 ),
// // // //               ),
// // // //               Text(
// // // //                 endDate,
// // // //                 style: const TextStyle(
// // // //                   color: whiteText,
// // // //                   fontSize: 14,
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           IconButton(
// // // //             icon: const Icon(Icons.delete, color: whiteText),
// // // //             onPressed: onDelete,
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // class AddTaskButton extends StatelessWidget {
// // // //   final VoidCallback onPressed;

// // // //   const AddTaskButton({
// // // //     super.key,
// // // //     required this.onPressed,
// // // //   });

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // //       child: GestureDetector(
// // // //         onTap: onPressed,
// // // //         child: Container(
// // // //           height: 48,
// // // //           width: double.infinity,
// // // //           decoration: BoxDecoration(
// // // //             color: whiteCard,
// // // //             borderRadius: BorderRadius.circular(25),
// // // //             border: Border.all(
// // // //               color: blueText,
// // // //               width: 1,
// // // //               style: BorderStyle.solid,
// // // //             ),
// // // //           ),
// // // //           child: Row(
// // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // //             children: [
// // // //               Icon(Icons.add, color: blueText),
// // // //               const SizedBox(width: 8),
// // // //               Text(
// // // //                 'Add Task',
// // // //                 style: TextStyle(
// // // //                   color: blueText,
// // // //                   fontSize: 12,
// // // //                   fontFamily: 'Inter',
// // // //                   fontWeight: FontWeight.w600,
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // class AddTaskDialog extends StatelessWidget {
// // // //   const AddTaskDialog({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return AlertDialog(
// // // //       title: const Text('Add Task'),
// // // //       content: Column(
// // // //         mainAxisSize: MainAxisSize.min,
// // // //         children: [
// // // //           TextField(
// // // //             decoration: const InputDecoration(
// // // //               labelText: 'Task Title',
// // // //             ),
// // // //             onChanged: (value) {
// // // //               // Handle task title input
// // // //             },
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       actions: [
// // // //         TextButton(
// // // //           onPressed: () {
// // // //             Navigator.of(context).pop();
// // // //           },
// // // //           child: const Text('Cancel'),
// // // //         ),
// // // //         TextButton(
// // // //           onPressed: () {
// // // //             // Handle adding task
// // // //             Navigator.of(context).pop({
// // // //               'id': DateTime.now().toString(),
// // // //               'title': 'New Task',
// // // //             });
// // // //           },
// // // //           child: const Text('Add'),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';

// // // const Color blueBackground = Color(0xFF2675CC); // Blue background
// // // const Color blueCard = Color(0xFF7CACE0); // Blue card
// // // const Color blueText = Color(0xFF2575CC); // Blue text
// // // const Color whiteText = Color(0xFFFFFFFF); // White text
// // // const Color whiteCard = Color(0xFFFFFFFF); // White card

// // // class TasksPage extends StatefulWidget {
// // //   final String kidName;

// // //   const TasksPage({super.key, required this.kidName});

// // //   @override
// // //   _TasksPageState createState() => _TasksPageState();
// // // }

// // // class _TasksPageState extends State<TasksPage> {
// // //   bool isInProgress = true;
// // //   List<Map<String, dynamic>> tasks = [];

// // //   List<Map<String, dynamic>> dummyTasks = [
// // //     {
// // //       'id': '1',
// // //       'title': 'Complete Homework',
// // //       'amount': 0,
// // //       'endDate': '2024-06-01',
// // //       'isAchieved': false,
// // //     },
// // //     {
// // //       'id': '2',
// // //       'title': 'Clean Room',
// // //       'amount': 0,
// // //       'endDate': '2024-07-15',
// // //       'isAchieved': false,
// // //     },
// // //     {
// // //       'id': '3',
// // //       'title': 'Buy Groceries',
// // //       'amount': 0,
// // //       'endDate': '2024-08-30',
// // //       'isAchieved': true,
// // //     },
// // //     {
// // //       'id': '4',
// // //       'title': 'Exercise',
// // //       'amount': 0,
// // //       'endDate': '2024-05-20',
// // //       'isAchieved': false,
// // //     },
// // //   ];

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     fetchTasks();
// // //   }

// // //   void fetchTasks() {
// // //     setState(() {
// // //       tasks = dummyTasks
// // //           .where(
// // //               (task) => isInProgress ? !task['isAchieved'] : task['isAchieved'])
// // //           .toList();
// // //     });
// // //   }

// // //   void addTask() async {
// // //     final newTask = {
// // //       'id': (dummyTasks.length + 1).toString(),
// // //       'title': 'New Task',
// // //       'amount': 0,
// // //       'endDate': '2024-12-31',
// // //       'isAchieved': false,
// // //     };

// // //     setState(() {
// // //       dummyTasks.add(newTask);
// // //       fetchTasks();
// // //     });
// // //   }

// // //   void deleteTask(String? taskId) {
// // //     if (taskId == null) return;
// // //     setState(() {
// // //       dummyTasks.removeWhere((task) => task['id'] == taskId);
// // //       fetchTasks();
// // //     });
// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       const SnackBar(
// // //         content: Text('Task deleted'),
// // //         backgroundColor: Colors.red,
// // //       ),
// // //     );
// // //   }

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
// // //         title: const Text(
// // //           'Tasks',
// // //           style: TextStyle(
// // //             color: whiteText,
// // //             fontSize: 24,
// // //             fontFamily: 'Inter',
// // //             fontWeight: FontWeight.w600,
// // //           ),
// // //         ),
// // //         centerTitle: true,
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           Expanded(
// // //             child: Container(
// // //               width: double.infinity,
// // //               decoration: const BoxDecoration(
// // //                 color: whiteCard,
// // //                 borderRadius: BorderRadius.only(
// // //                   topLeft: Radius.circular(25),
// // //                   topRight: Radius.circular(25),
// // //                 ),
// // //               ),
// // //               child: Column(
// // //                 children: [
// // //                   Padding(
// // //                     padding: const EdgeInsets.symmetric(
// // //                         horizontal: 16.0, vertical: 16.0),
// // //                     child: LayoutBuilder(
// // //                       builder: (context, constraints) {
// // //                         return Container(
// // //                           width: constraints.maxWidth,
// // //                           height: 35,
// // //                           decoration: BoxDecoration(
// // //                             color: whiteCard,
// // //                             borderRadius: BorderRadius.circular(10),
// // //                             border: Border.all(
// // //                               color: blueText,
// // //                               width: 1,
// // //                             ),
// // //                           ),
// // //                           child: Row(
// // //                             children: [
// // //                               Expanded(
// // //                                 child: GestureDetector(
// // //                                   onTap: () {
// // //                                     setState(() {
// // //                                       isInProgress = true;
// // //                                       fetchTasks();
// // //                                     });
// // //                                   },
// // //                                   child: Container(
// // //                                     height: 33,
// // //                                     decoration: BoxDecoration(
// // //                                       color:
// // //                                           isInProgress ? blueText : whiteCard,
// // //                                       borderRadius:
// // //                                           const BorderRadius.horizontal(
// // //                                         left: Radius.circular(10),
// // //                                       ),
// // //                                     ),
// // //                                     alignment: Alignment.center,
// // //                                     child: Text(
// // //                                       'In Progress',
// // //                                       style: TextStyle(
// // //                                         color: isInProgress
// // //                                             ? whiteText
// // //                                             : const Color(0xFF9A9A9A),
// // //                                         fontSize: 16,
// // //                                         fontFamily: 'Inter',
// // //                                         fontWeight: FontWeight.w600,
// // //                                       ),
// // //                                     ),
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                               Container(
// // //                                 width: 1,
// // //                                 height: 34,
// // //                                 color: blueText,
// // //                               ),
// // //                               Expanded(
// // //                                 child: GestureDetector(
// // //                                   onTap: () {
// // //                                     setState(() {
// // //                                       isInProgress = false;
// // //                                       fetchTasks();
// // //                                     });
// // //                                   },
// // //                                   child: Container(
// // //                                     height: 33,
// // //                                     decoration: BoxDecoration(
// // //                                       color:
// // //                                           !isInProgress ? blueText : whiteCard,
// // //                                       borderRadius:
// // //                                           const BorderRadius.horizontal(
// // //                                         right: Radius.circular(10),
// // //                                       ),
// // //                                     ),
// // //                                     alignment: Alignment.center,
// // //                                     child: Text(
// // //                                       'Completed',
// // //                                       style: TextStyle(
// // //                                         color: !isInProgress
// // //                                             ? whiteText
// // //                                             : const Color(0xFF9A9A9A),
// // //                                         fontSize: 16,
// // //                                         fontFamily: 'Inter',
// // //                                         fontWeight: FontWeight.w600,
// // //                                       ),
// // //                                     ),
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         );
// // //                       },
// // //                     ),
// // //                   ),
// // //                   Expanded(
// // //                     child: Padding(
// // //                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // //                       child: ListView.builder(
// // //                         itemCount: tasks.length,
// // //                         itemBuilder: (context, index) {
// // //                           final task = tasks[index];
// // //                           return Dismissible(
// // //                             key: Key(task['id']),
// // //                             direction: DismissDirection.endToStart,
// // //                             onDismissed: (direction) {
// // //                               setState(() {
// // //                                 final taskToUpdate = dummyTasks.firstWhere(
// // //                                     (t) => t['id'] == tasks[index]['id']);
// // //                                 taskToUpdate['isAchieved'] = true;
// // //                                 tasks.removeAt(index);
// // //                               });
// // //                               ScaffoldMessenger.of(context).showSnackBar(
// // //                                 const SnackBar(
// // //                                   content: Text('Task marked as completed'),
// // //                                   backgroundColor: Colors.green,
// // //                                 ),
// // //                               );
// // //                             },
// // //                             background: Container(
// // //                               alignment: Alignment.centerRight,
// // //                               padding: const EdgeInsets.only(right: 20.0),
// // //                               color: Colors.green,
// // //                               child: const Icon(Icons.check, color: whiteText),
// // //                             ),
// // //                             child: TaskCard(
// // //                               taskName: task['title'],
// // //                               amount: task['amount'],
// // //                               endDate: task['endDate'],
// // //                               onDelete: () => deleteTask(task['id']),
// // //                             ),
// // //                           );
// // //                         },
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   AddTaskButton(onPressed: addTask),
// // //                   const SizedBox(height: 16),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // class TaskCard extends StatelessWidget {
// // //   final String taskName;
// // //   final int amount;
// // //   final String endDate;
// // //   final VoidCallback onDelete;

// // //   const TaskCard({
// // //     super.key,
// // //     required this.taskName,
// // //     required this.amount,
// // //     required this.endDate,
// // //     required this.onDelete,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       margin: const EdgeInsets.symmetric(vertical: 8.0),
// // //       padding: const EdgeInsets.all(16.0),
// // //       decoration: BoxDecoration(
// // //         color: blueCard,
// // //         borderRadius: BorderRadius.circular(25),
// // //       ),
// // //       child: Row(
// // //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //         children: [
// // //           Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Text(
// // //                 taskName,
// // //                 style: const TextStyle(
// // //                   color: whiteText,
// // //                   fontSize: 18,
// // //                   fontWeight: FontWeight.bold,
// // //                 ),
// // //               ),
// // //               Text(
// // //                 '$amount KD',
// // //                 style: const TextStyle(
// // //                   color: whiteText,
// // //                   fontSize: 16,
// // //                 ),
// // //               ),
// // //               Text(
// // //                 endDate,
// // //                 style: const TextStyle(
// // //                   color: whiteText,
// // //                   fontSize: 14,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //           IconButton(
// // //             icon: const Icon(Icons.delete, color: whiteText),
// // //             onPressed: onDelete,
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // class AddTaskButton extends StatelessWidget {
// // //   final VoidCallback onPressed;

// // //   const AddTaskButton({
// // //     super.key,
// // //     required this.onPressed,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // //       child: GestureDetector(
// // //         onTap: onPressed,
// // //         child: Container(
// // //           height: 48,
// // //           width: double.infinity,
// // //           decoration: BoxDecoration(
// // //             color: whiteCard,
// // //             borderRadius: BorderRadius.circular(25),
// // //             border: Border.all(
// // //               color: blueText,
// // //               width: 1,
// // //               style: BorderStyle.solid,
// // //             ),
// // //           ),
// // //           child: Row(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               Icon(Icons.add, color: blueText),
// // //               const SizedBox(width: 8),
// // //               Text(
// // //                 'Add Task',
// // //                 style: TextStyle(
// // //                   color: blueText,
// // //                   fontSize: 12,
// // //                   fontFamily: 'Inter',
// // //                   fontWeight: FontWeight.w600,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class AddTaskDialog extends StatelessWidget {
// // //   const AddTaskDialog({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return AlertDialog(
// // //       title: const Text('Add Task'),
// // //       content: Column(
// // //         mainAxisSize: MainAxisSize.min,
// // //         children: [
// // //           TextField(
// // //             decoration: const InputDecoration(
// // //               labelText: 'Task Title',
// // //             ),
// // //             onChanged: (value) {
// // //               // Handle task title input
// // //             },
// // //           ),
// // //         ],
// // //       ),
// // //       actions: [
// // //         TextButton(
// // //           onPressed: () {
// // //             Navigator.of(context).pop();
// // //           },
// // //           child: const Text('Cancel'),
// // //         ),
// // //         TextButton(
// // //           onPressed: () {
// // //             // Handle adding task
// // //             Navigator.of(context).pop({
// // //               'id': DateTime.now().toString(),
// // //               'title': 'New Task',
// // //             });
// // //           },
// // //           child: const Text('Add'),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';

// // const Color blueBackground = Color(0xFF2675CC); // Blue background
// // const Color blueCard = Color(0xFF7CACE0); // Blue card
// // const Color blueText = Color(0xFF2575CC); // Blue text
// // const Color whiteText = Color(0xFFFFFFFF); // White text
// // const Color whiteCard = Color(0xFFFFFFFF); // White card

// // class TasksPage extends StatefulWidget {
// //   final String kidName;

// //   const TasksPage({super.key, required this.kidName});

// //   @override
// //   _TasksPageState createState() => _TasksPageState();
// // }

// // class _TasksPageState extends State<TasksPage> {
// //   bool isInProgress = true;
// //   List<Map<String, dynamic>> tasks = [];

// //   List<Map<String, dynamic>> dummyTasks = [
// //     {
// //       'id': '1',
// //       'title': 'Complete Homework',
// //       'amount': 0,
// //       'endDate': '2024-06-01',
// //       'isAchieved': false,
// //     },
// //     {
// //       'id': '2',
// //       'title': 'Clean Room',
// //       'amount': 0,
// //       'endDate': '2024-07-15',
// //       'isAchieved': false,
// //     },
// //     {
// //       'id': '3',
// //       'title': 'Buy Groceries',
// //       'amount': 0,
// //       'endDate': '2024-08-30',
// //       'isAchieved': true,
// //     },
// //     {
// //       'id': '4',
// //       'title': 'Exercise',
// //       'amount': 0,
// //       'endDate': '2024-05-20',
// //       'isAchieved': false,
// //     },
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchTasks();
// //   }

// //   void fetchTasks() {
// //     setState(() {
// //       tasks = dummyTasks
// //           .where(
// //               (task) => isInProgress ? !task['isAchieved'] : task['isAchieved'])
// //           .toList();
// //     });
// //   }

// //   void addTask() async {
// //     final newTask = await showDialog<Map<String, dynamic>>(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return const AddTaskDialog();
// //       },
// //     );

// //     if (newTask != null) {
// //       setState(() {
// //         dummyTasks.add(newTask);
// //         fetchTasks();
// //       });
// //     }
// //   }

// //   void deleteTask(String? taskId) {
// //     if (taskId == null) return;
// //     setState(() {
// //       dummyTasks.removeWhere((task) => task['id'] == taskId);
// //       fetchTasks();
// //     });
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(
// //         content: Text('Task deleted'),
// //         backgroundColor: Colors.red,
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: blueBackground,
// //       appBar: AppBar(
// //         backgroundColor: blueBackground,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: whiteText),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //         ),
// //         title: const Text(
// //           'Tasks',
// //           style: TextStyle(
// //             color: whiteText,
// //             fontSize: 24,
// //             fontFamily: 'Inter',
// //             fontWeight: FontWeight.w600,
// //           ),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: Container(
// //               width: double.infinity,
// //               decoration: const BoxDecoration(
// //                 color: whiteCard,
// //                 borderRadius: BorderRadius.only(
// //                   topLeft: Radius.circular(25),
// //                   topRight: Radius.circular(25),
// //                 ),
// //               ),
// //               child: Column(
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 16.0, vertical: 16.0),
// //                     child: LayoutBuilder(
// //                       builder: (context, constraints) {
// //                         return Container(
// //                           width: constraints.maxWidth,
// //                           height: 35,
// //                           decoration: BoxDecoration(
// //                             color: whiteCard,
// //                             borderRadius: BorderRadius.circular(10),
// //                             border: Border.all(
// //                               color: blueText,
// //                               width: 1,
// //                             ),
// //                           ),
// //                           child: Row(
// //                             children: [
// //                               Expanded(
// //                                 child: GestureDetector(
// //                                   onTap: () {
// //                                     setState(() {
// //                                       isInProgress = true;
// //                                       fetchTasks();
// //                                     });
// //                                   },
// //                                   child: Container(
// //                                     height: 33,
// //                                     decoration: BoxDecoration(
// //                                       color:
// //                                           isInProgress ? blueText : whiteCard,
// //                                       borderRadius:
// //                                           const BorderRadius.horizontal(
// //                                         left: Radius.circular(10),
// //                                       ),
// //                                     ),
// //                                     alignment: Alignment.center,
// //                                     child: Text(
// //                                       'In Progress',
// //                                       style: TextStyle(
// //                                         color: isInProgress
// //                                             ? whiteText
// //                                             : const Color(0xFF9A9A9A),
// //                                         fontSize: 16,
// //                                         fontFamily: 'Inter',
// //                                         fontWeight: FontWeight.w600,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ),
// //                               Container(
// //                                 width: 1,
// //                                 height: 34,
// //                                 color: blueText,
// //                               ),
// //                               Expanded(
// //                                 child: GestureDetector(
// //                                   onTap: () {
// //                                     setState(() {
// //                                       isInProgress = false;
// //                                       fetchTasks();
// //                                     });
// //                                   },
// //                                   child: Container(
// //                                     height: 33,
// //                                     decoration: BoxDecoration(
// //                                       color:
// //                                           !isInProgress ? blueText : whiteCard,
// //                                       borderRadius:
// //                                           const BorderRadius.horizontal(
// //                                         right: Radius.circular(10),
// //                                       ),
// //                                     ),
// //                                     alignment: Alignment.center,
// //                                     child: Text(
// //                                       'Completed',
// //                                       style: TextStyle(
// //                                         color: !isInProgress
// //                                             ? whiteText
// //                                             : const Color(0xFF9A9A9A),
// //                                         fontSize: 16,
// //                                         fontFamily: 'Inter',
// //                                         fontWeight: FontWeight.w600,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                   Expanded(
// //                     child: Padding(
// //                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //                       child: ListView.builder(
// //                         itemCount: tasks.length,
// //                         itemBuilder: (context, index) {
// //                           final task = tasks[index];
// //                           return Dismissible(
// //                             key: Key(task['id']),
// //                             direction: DismissDirection.endToStart,
// //                             onDismissed: (direction) {
// //                               setState(() {
// //                                 final taskToUpdate = dummyTasks.firstWhere(
// //                                     (t) => t['id'] == tasks[index]['id']);
// //                                 taskToUpdate['isAchieved'] = true;
// //                                 tasks.removeAt(index);
// //                               });
// //                               ScaffoldMessenger.of(context).showSnackBar(
// //                                 const SnackBar(
// //                                   content: Text('Task marked as completed'),
// //                                   backgroundColor: Colors.green,
// //                                 ),
// //                               );
// //                             },
// //                             background: Container(
// //                               alignment: Alignment.centerRight,
// //                               padding: const EdgeInsets.only(right: 20.0),
// //                               color: Colors.green,
// //                               child: const Icon(Icons.check, color: whiteText),
// //                             ),
// //                             child: TaskCard(
// //                               taskName: task['title'],
// //                               amount: task['amount'],
// //                               endDate: task['endDate'],
// //                               onDelete: () => deleteTask(task['id']),
// //                             ),
// //                           );
// //                         },
// //                       ),
// //                     ),
// //                   ),
// //                   AddTaskButton(onPressed: addTask),
// //                   const SizedBox(height: 16),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class TaskCard extends StatelessWidget {
// //   final String taskName;
// //   final int amount;
// //   final String endDate;
// //   final VoidCallback onDelete;

// //   const TaskCard({
// //     super.key,
// //     required this.taskName,
// //     required this.amount,
// //     required this.endDate,
// //     required this.onDelete,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 8.0),
// //       padding: const EdgeInsets.all(16.0),
// //       decoration: BoxDecoration(
// //         color: blueCard,
// //         borderRadius: BorderRadius.circular(25),
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 taskName,
// //                 style: const TextStyle(
// //                   color: whiteText,
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               Text(
// //                 '$amount KD',
// //                 style: const TextStyle(
// //                   color: whiteText,
// //                   fontSize: 16,
// //                 ),
// //               ),
// //               Text(
// //                 endDate,
// //                 style: const TextStyle(
// //                   color: whiteText,
// //                   fontSize: 14,
// //                 ),
// //               ),
// //             ],
// //           ),
// //           IconButton(
// //             icon: const Icon(Icons.delete, color: whiteText),
// //             onPressed: onDelete,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class AddTaskButton extends StatelessWidget {
// //   final VoidCallback onPressed;

// //   const AddTaskButton({
// //     super.key,
// //     required this.onPressed,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //       child: GestureDetector(
// //         onTap: onPressed,
// //         child: Container(
// //           height: 48,
// //           width: double.infinity,
// //           decoration: BoxDecoration(
// //             color: whiteCard,
// //             borderRadius: BorderRadius.circular(25),
// //             border: Border.all(
// //               color: blueText,
// //               width: 1,
// //               style: BorderStyle.solid,
// //             ),
// //           ),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Icon(Icons.add, color: blueText),
// //               const SizedBox(width: 8),
// //               Text(
// //                 'Add Task',
// //                 style: TextStyle(
// //                   color: blueText,
// //                   fontSize: 12,
// //                   fontFamily: 'Inter',
// //                   fontWeight: FontWeight.w600,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class AddTaskDialog extends StatelessWidget {
// //   const AddTaskDialog({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return AlertDialog(
// //       title: const Text('Add Task'),
// //       content: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           TextField(
// //             decoration: const InputDecoration(
// //               labelText: 'Task Title',
// //             ),
// //             onChanged: (value) {
// //               // Handle task title input
// //             },
// //           ),
// //         ],
// //       ),
// //       actions: [
// //         TextButton(
// //           onPressed: () {
// //             Navigator.of(context).pop();
// //           },
// //           child: const Text('Cancel'),
// //         ),
// //         TextButton(
// //           onPressed: () {
// //             // Handle adding task
// //             Navigator.of(context).pop({
// //               'id': DateTime.now().toString(),
// //               'title': 'New Task',
// //               'amount': 0,
// //               'endDate': '2024-12-31',
// //               'isAchieved': false,
// //             });
// //           },
// //           child: const Text('Add'),
// //         ),
// //       ],
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'add_task_dialogue.dart';

// const Color blueBackground = Color(0xFF2675CC); // Blue background
// const Color blueCard = Color(0xFF7CACE0); // Blue card
// const Color blueText = Color(0xFF2575CC); // Blue text
// const Color whiteText = Color(0xFFFFFFFF); // White text
// const Color whiteCard = Color(0xFFFFFFFF); // White card

// class TasksPage extends StatefulWidget {
//   final String kidName;

//   const TasksPage({super.key, required this.kidName});

//   @override
//   _TasksPageState createState() => _TasksPageState();
// }

// class _TasksPageState extends State<TasksPage> {
//   bool isInProgress = true;
//   List<Map<String, dynamic>> tasks = [];

//   List<Map<String, dynamic>> dummyTasks = [
//     {
//       'id': '1',
//       'title': 'Complete Homework',
//       'amount': 0,
//       'endDate': '2024-06-01',
//       'isAchieved': false,
//     },
//     {
//       'id': '2',
//       'title': 'Clean Room',
//       'amount': 0,
//       'endDate': '2024-07-15',
//       'isAchieved': false,
//     },
//     {
//       'id': '3',
//       'title': 'Buy Groceries',
//       'amount': 0,
//       'endDate': '2024-08-30',
//       'isAchieved': true,
//     },
//     {
//       'id': '4',
//       'title': 'Exercise',
//       'amount': 0,
//       'endDate': '2024-05-20',
//       'isAchieved': false,
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     fetchTasks();
//   }

//   void fetchTasks() {
//     setState(() {
//       tasks = dummyTasks
//           .where(
//               (task) => isInProgress ? !task['isAchieved'] : task['isAchieved'])
//           .toList();
//     });
//   }

//   void addTask() async {
//     final newTask = await showDialog<Map<String, dynamic>>(
//       context: context,
//       builder: (BuildContext context) {
//         return const AddTaskDialog();
//       },
//     );

//     if (newTask != null) {
//       setState(() {
//         dummyTasks.add(newTask);
//         fetchTasks();
//       });
//     }
//   }

//   void deleteTask(String? taskId) {
//     if (taskId == null) return;
//     setState(() {
//       dummyTasks.removeWhere((task) => task['id'] == taskId);
//       fetchTasks();
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Task deleted'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: blueBackground,
//       appBar: AppBar(
//         backgroundColor: blueBackground,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: whiteText),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           'Tasks',
//           style: TextStyle(
//             color: whiteText,
//             fontSize: 24,
//             fontFamily: 'Inter',
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: whiteCard,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25),
//                   topRight: Radius.circular(25),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16.0, vertical: 16.0),
//                     child: LayoutBuilder(
//                       builder: (context, constraints) {
//                         return Container(
//                           width: constraints.maxWidth,
//                           height: 35,
//                           decoration: BoxDecoration(
//                             color: whiteCard,
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(
//                               color: blueText,
//                               width: 1,
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       isInProgress = true;
//                                       fetchTasks();
//                                     });
//                                   },
//                                   child: Container(
//                                     height: 33,
//                                     decoration: BoxDecoration(
//                                       color:
//                                           isInProgress ? blueText : whiteCard,
//                                       borderRadius:
//                                           const BorderRadius.horizontal(
//                                         left: Radius.circular(10),
//                                       ),
//                                     ),
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       'In Progress',
//                                       style: TextStyle(
//                                         color: isInProgress
//                                             ? whiteText
//                                             : const Color(0xFF9A9A9A),
//                                         fontSize: 16,
//                                         fontFamily: 'Inter',
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 1,
//                                 height: 34,
//                                 color: blueText,
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       isInProgress = false;
//                                       fetchTasks();
//                                     });
//                                   },
//                                   child: Container(
//                                     height: 33,
//                                     decoration: BoxDecoration(
//                                       color:
//                                           !isInProgress ? blueText : whiteCard,
//                                       borderRadius:
//                                           const BorderRadius.horizontal(
//                                         right: Radius.circular(10),
//                                       ),
//                                     ),
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       'Completed',
//                                       style: TextStyle(
//                                         color: !isInProgress
//                                             ? whiteText
//                                             : const Color(0xFF9A9A9A),
//                                         fontSize: 16,
//                                         fontFamily: 'Inter',
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: ListView.builder(
//                         itemCount: tasks.length,
//                         itemBuilder: (context, index) {
//                           final task = tasks[index];
//                           return Dismissible(
//                             key: Key(task['id']),
//                             direction: DismissDirection.endToStart,
//                             onDismissed: (direction) {
//                               setState(() {
//                                 final taskToUpdate = dummyTasks.firstWhere(
//                                     (t) => t['id'] == tasks[index]['id']);
//                                 taskToUpdate['isAchieved'] = true;
//                                 tasks.removeAt(index);
//                               });
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Task marked as completed'),
//                                   backgroundColor: Colors.green,
//                                 ),
//                               );
//                             },
//                             background: Container(
//                               alignment: Alignment.centerRight,
//                               padding: const EdgeInsets.only(right: 20.0),
//                               color: Colors.green,
//                               child: const Icon(Icons.check, color: whiteText),
//                             ),
//                             child: TaskCard(
//                               taskName: task['title'],
//                               amount: task['amount'],
//                               endDate: task['endDate'],
//                               onDelete: () => deleteTask(task['id']),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   AddTaskButton(onPressed: addTask),
//                   const SizedBox(height: 16),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TaskCard extends StatelessWidget {
//   final String taskName;
//   final int amount;
//   final String endDate;
//   final VoidCallback onDelete;

//   const TaskCard({
//     super.key,
//     required this.taskName,
//     required this.amount,
//     required this.endDate,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: blueCard,
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 taskName,
//                 style: const TextStyle(
//                   color: whiteText,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 '$amount KD',
//                 style: const TextStyle(
//                   color: whiteText,
//                   fontSize: 16,
//                 ),
//               ),
//               Text(
//                 endDate,
//                 style: const TextStyle(
//                   color: whiteText,
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//           IconButton(
//             icon: const Icon(Icons.delete, color: whiteText),
//             onPressed: onDelete,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AddTaskButton extends StatelessWidget {
//   final VoidCallback onPressed;

//   const AddTaskButton({
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
//             color: blueCard,
//             borderRadius: BorderRadius.circular(25),
//             border: Border.all(
//               color: blueText,
//               width: 1,
//               style: BorderStyle.solid,
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.add, color: whiteText),
//               const SizedBox(width: 8),
//               Text(
//                 'Add Task',
//                 style: TextStyle(
//                   color: whiteText,
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
import 'add_task_dialogue.dart';

const Color blueBackground = Color(0xFF2675CC); // Blue background
const Color blueCard = Color(0xFF7CACE0); // Blue card
const Color blueText = Color(0xFF2575CC); // Blue text
const Color whiteText = Color(0xFFFFFFFF); // White text
const Color whiteCard = Color(0xFFFFFFFF); // White card

class TasksPage extends StatefulWidget {
  final String kidName;

  const TasksPage({super.key, required this.kidName});

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  bool isInProgress = true;
  List<Map<String, dynamic>> tasks = [];

  List<Map<String, dynamic>> dummyTasks = [
    {
      'id': '1',
      'title': 'Complete Homework',
      'amount': 0,
      'endDate': '2024-06-01',
      'isAchieved': false,
    },
    {
      'id': '2',
      'title': 'Clean Room',
      'amount': 0,
      'endDate': '2024-07-15',
      'isAchieved': false,
    },
    {
      'id': '3',
      'title': 'Buy Groceries',
      'amount': 0,
      'endDate': '2024-08-30',
      'isAchieved': true,
    },
    {
      'id': '4',
      'title': 'Exercise',
      'amount': 0,
      'endDate': '2024-05-20',
      'isAchieved': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  void fetchTasks() {
    setState(() {
      tasks = dummyTasks
          .where(
              (task) => isInProgress ? !task['isAchieved'] : task['isAchieved'])
          .toList();
    });
  }

  void addTask() async {
    final newTask = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return const AddTaskDialog();
      },
    );

    if (newTask != null) {
      setState(() {
        dummyTasks.add(newTask);
        fetchTasks();
      });
    }
  }

  void deleteTask(String? taskId) {
    if (taskId == null) return;
    setState(() {
      dummyTasks.removeWhere((task) => task['id'] == taskId);
      fetchTasks();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Task deleted'),
        backgroundColor: Colors.red,
      ),
    );
  }

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
        title: const Text(
          'Tasks',
          style: TextStyle(
            color: whiteText,
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
              decoration: const BoxDecoration(
                color: whiteCard,
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
                            color: whiteCard,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: blueText,
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
                                      fetchTasks();
                                    });
                                  },
                                  child: Container(
                                    height: 33,
                                    decoration: BoxDecoration(
                                      color:
                                          isInProgress ? blueText : whiteCard,
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
                                            ? whiteText
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
                                color: blueText,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isInProgress = false;
                                      fetchTasks();
                                    });
                                  },
                                  child: Container(
                                    height: 33,
                                    decoration: BoxDecoration(
                                      color:
                                          !isInProgress ? blueText : whiteCard,
                                      borderRadius:
                                          const BorderRadius.horizontal(
                                        right: Radius.circular(10),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Completed',
                                      style: TextStyle(
                                        color: !isInProgress
                                            ? whiteText
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
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          return Dismissible(
                            key: Key(task['id']),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              setState(() {
                                final taskToUpdate = dummyTasks.firstWhere(
                                    (t) => t['id'] == tasks[index]['id']);
                                taskToUpdate['isAchieved'] = true;
                                tasks.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Task marked as completed'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20.0),
                              color: Colors.green,
                              child: const Icon(Icons.check, color: whiteText),
                            ),
                            child: TaskCard(
                              taskName: task['title'],
                              amount: task['amount'],
                              endDate: task['endDate'],
                              onDelete: () => deleteTask(task['id']),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  AddTaskButton(onPressed: addTask),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String taskName;
  final int amount;
  final String endDate;
  final VoidCallback onDelete;

  const TaskCard({
    super.key,
    required this.taskName,
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
        color: blueCard,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskName,
                style: const TextStyle(
                  color: whiteText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$amount KD',
                style: const TextStyle(
                  color: whiteText,
                  fontSize: 16,
                ),
              ),
              Text(
                endDate,
                style: const TextStyle(
                  color: whiteText,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: whiteText),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}

class AddTaskButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddTaskButton({
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
            color: blueCard,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: blueText,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: whiteText),
              const SizedBox(width: 8),
              Text(
                'Add Task',
                style: TextStyle(
                  color: whiteText,
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
