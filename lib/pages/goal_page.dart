// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import '../services/client.dart';

// class GoalPage extends StatefulWidget {
//   @override
//   _GoalPageState createState() => _GoalPageState();
// }

// class _GoalPageState extends State<GoalPage> {
//   List<Goal> goals = [
//     Goal(title: 'Goal 1', kname: 'Kname 1'),
//     Goal(title: 'Goal 2', kname: 'Kname 2'),
//   ]; // Example goals list

//   Future<void> _deleteGoal(String title, String kname) async {
//     try {
//       final response = await Client.dio.delete('/parent/deleteGoal', data: {
//         'title': title,
//         'kname': kname,
//       });

//       if (response.statusCode == 200) {
//         setState(() {
//           goals.removeWhere(
//               (goal) => goal.title == title && goal.kname == kname);
//         });
//       } else {
//         setState(() {
//           print('Failed to delete goal: ${response.statusMessage}');
//         });
//       }
//     } catch (e) {
//       setState(() {
//         print('Error deleting goal: $e');
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Goals'),
//       ),
//       body: ListView.builder(
//         itemCount: goals.length,
//         itemBuilder: (context, index) {
//           final goal = goals[index];
//           return ListTile(
//             title: Text(goal.title),
//             trailing: IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: () => _deleteGoal(goal.title, goal.kname),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class Goal {
//   final String title;
//   final String kname;

//   Goal({required this.title, required this.kname});
// }
