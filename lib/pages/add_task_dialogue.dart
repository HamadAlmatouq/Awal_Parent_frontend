// import 'package:bkid_frontend/services/task_services.dart';
// import 'package:flutter/material.dart';

// class AddTaskDialog extends StatefulWidget {
//   final String kidName;

//   const AddTaskDialog({Key? key, required this.kidName}) : super(key: key);

//   @override
//   _AddTaskDialogState createState() => _AddTaskDialogState();
// }

// class _AddTaskDialogState extends State<AddTaskDialog> {
//   final TextEditingController taskNameController = TextEditingController();
//   final TextEditingController feesController = TextEditingController();
//   final TextEditingController durationController = TextEditingController();
//   String? errorMessage;

//   void handleSubmit() async {
//     final taskName = taskNameController.text.trim();
//     final feesText = feesController.text.trim();
//     final durationText = durationController.text.trim();

//     if (taskName.isEmpty || feesText.isEmpty || durationText.isEmpty) {
//       setState(() {
//         errorMessage = 'Please fill in all fields.';
//       });
//     } else {
//       final taskData = {
//         'title': taskName,
//         'amount': int.tryParse(feesText) ?? 0,
//         'duration': durationText.toString(), // Ensure duration is a string
//         'Kname': widget.kidName,
//       };

//       try {
//         await TaskServices().createTask(taskData);
//         Navigator.pop(context, taskData);
//       } catch (e) {
//         setState(() {
//           errorMessage = e.toString();
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: SingleChildScrollView(
//         child: Container(
//           width: 383,
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(25),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Icon(Icons.close, size: 24),
//                   ),
//                   const SizedBox(width: 80),
//                   const Text(
//                     'Add Task',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontFamily: 'Inter',
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const Divider(color: Color(0xFFECECEC)),
//               const SizedBox(height: 16),
//               const Text(
//                 'Task Name',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontFamily: 'Inter',
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextField(
//                 controller: taskNameController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter task name...',
//                   hintStyle: const TextStyle(
//                     color: Color(0xFFC3C3C3),
//                     fontSize: 14,
//                     fontFamily: 'Inter',
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Color(0xFFD3CDCD)),
//                   ),
//                   contentPadding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Fees',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontFamily: 'Inter',
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextField(
//                 controller: feesController,
//                 decoration: InputDecoration(
//                   hintText: 'Amount...',
//                   suffixText: 'KWD',
//                   suffixStyle: const TextStyle(
//                     color: Color(0xFF787878),
//                     fontSize: 12,
//                     fontFamily: 'Inter',
//                   ),
//                   hintStyle: const TextStyle(
//                     color: Color(0xFFC3C3C3),
//                     fontSize: 14,
//                     fontFamily: 'Inter',
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Color(0xFFD3CDCD)),
//                   ),
//                   contentPadding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Duration',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontFamily: 'Inter',
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextField(
//                 controller: durationController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter duration...',
//                   hintStyle: const TextStyle(
//                     color: Color(0xFFC3C3C3),
//                     fontSize: 14,
//                     fontFamily: 'Inter',
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Color(0xFFD3CDCD)),
//                   ),
//                   contentPadding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
//                 ),
//               ),
//               if (errorMessage != null) ...[
//                 const SizedBox(height: 8),
//                 Text(
//                   errorMessage!,
//                   style: const TextStyle(
//                     color: Colors.red,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//               const SizedBox(height: 16),
//               const Divider(color: Color(0xFFECECEC)),
//               const SizedBox(height: 8),
//               SizedBox(
//                 width: double.infinity,
//                 height: 54,
//                 child: ElevatedButton(
//                   onPressed: handleSubmit,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF2575CC),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   ),
//                   child: const Text(
//                     'Save',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontFamily: 'Inter',
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:bkid_frontend/services/task_services.dart';
import 'package:flutter/material.dart';

const Color blueBackground = Color(0xFF2675CC); // Blue background

class AddTaskDialog extends StatefulWidget {
  final String kidName;

  const AddTaskDialog({Key? key, required this.kidName}) : super(key: key);

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController feesController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  String? errorMessage;

  void handleSubmit() async {
    final taskName = taskNameController.text.trim();
    final feesText = feesController.text.trim();
    final durationText = durationController.text.trim();

    if (taskName.isEmpty || feesText.isEmpty || durationText.isEmpty) {
      setState(() {
        errorMessage = 'Please fill in all fields.';
      });
    } else {
      final taskData = {
        'title': taskName,
        'amount': int.tryParse(feesText) ?? 0,
        'duration': durationText.toString(),
        'Kname': widget.kidName,
      };

      try {
        await TaskServices().createTask(taskData);
        Navigator.pop(context, taskData);
      } catch (e) {
        setState(() {
          errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        child: Container(
          width: 383,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, size: 24),
                  ),
                  const SizedBox(width: 80),
                  const Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Inter',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Divider(color: Color(0xFFECECEC)),
              const SizedBox(height: 16),
              const Text(
                'Task Name',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: taskNameController,
                decoration: InputDecoration(
                  hintText: 'Enter task name...',
                  hintStyle: const TextStyle(
                    color: Color(0xFFC3C3C3),
                    fontSize: 14,
                    fontFamily: 'Inter',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: blueBackground),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: blueBackground),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Amount',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: feesController,
                decoration: InputDecoration(
                  hintText: 'Amount...',
                  suffixText: 'KWD',
                  suffixStyle: const TextStyle(
                    color: Color(0xFF787878),
                    fontSize: 12,
                    fontFamily: 'Inter',
                  ),
                  hintStyle: const TextStyle(
                    color: Color(0xFFC3C3C3),
                    fontSize: 14,
                    fontFamily: 'Inter',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: blueBackground),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: blueBackground),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              const Text(
                'Duration',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: durationController,
                decoration: InputDecoration(
                  hintText: 'Enter duration...',
                  hintStyle: const TextStyle(
                    color: Color(0xFFC3C3C3),
                    fontSize: 14,
                    fontFamily: 'Inter',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: blueBackground),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: blueBackground),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                ),
              ),
              if (errorMessage != null) ...[
                const SizedBox(height: 8),
                Text(
                  errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
              ],
              const SizedBox(height: 16),
              const Divider(color: Color(0xFFECECEC)),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2575CC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
