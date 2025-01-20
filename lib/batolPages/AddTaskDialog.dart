// import 'package:flutter/material.dart';

// class AddTaskDialog extends StatefulWidget {
//   @override
//   _AddTaskDialogState createState() => _AddTaskDialogState();
// }

// class _AddTaskDialogState extends State<AddTaskDialog> {
//   final TextEditingController taskNameController = TextEditingController();
//   final TextEditingController feesController = TextEditingController();
//   final TextEditingController durationController = TextEditingController();
//   String? errorMessage;

//   void handleSubmit() {
//     final taskName = taskNameController.text.trim();
//     final feesText = feesController.text.trim();
//     final durationText = durationController.text.trim();

//     if (taskName.isEmpty || feesText.isEmpty || durationText.isEmpty) {
//       setState(() {
//         errorMessage = 'Please fill in all fields.';
//       });
//     } else {
//       Navigator.pop(context, {
//         'name': taskName,
//         'fees': int.tryParse(feesText) ?? 0,
//         'duration': durationText,
//         'image': 'default_image.png', // Default image for now
//       });
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
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: taskNameController,
//                 decoration: InputDecoration(labelText: 'Task Name'),
//               ),
//               TextField(
//                 controller: feesController,
//                 decoration: InputDecoration(labelText: 'Fees'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: durationController,
//                 decoration: InputDecoration(labelText: 'Duration'),
//               ),
//               if (errorMessage != null)
//                 Text(
//                   errorMessage!,
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ElevatedButton(
//                 onPressed: handleSubmit,
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({Key? key}) : super(key: key);

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController feesController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  String? errorMessage;

  void handleSubmit() {
    final taskName = taskNameController.text.trim();
    final feesText = feesController.text.trim();
    final durationText = durationController.text.trim();

    if (taskName.isEmpty || feesText.isEmpty || durationText.isEmpty) {
      setState(() {
        errorMessage = 'Please fill in all fields.';
      });
    } else {
      Navigator.pop(context, {
        'name': taskName,
        'fees': int.tryParse(feesText) ?? 0,
        'duration': durationText,
        'image': 'default_image.png', // Default image for now
      });
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
              // Add Image here
              Center(
                child: Image.network(
                  'https://dashboard.codeparrot.ai/api/assets/Z4oyQBgaGNOSvOa1', // Replace with your image URL
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
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
                    borderSide: const BorderSide(color: Color(0xFFD3CDCD)),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Fees',
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
                    borderSide: const BorderSide(color: Color(0xFFD3CDCD)),
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
                    borderSide: const BorderSide(color: Color(0xFFD3CDCD)),
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
