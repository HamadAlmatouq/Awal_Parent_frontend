import 'package:flutter/material.dart';

const Color blueBackground = Color(0xFF2675CC); // Blue background
const Color blueCard = Color(0xFF7CACE0); // Blue card
const Color blueText = Color(0xFF2575CC); // Blue text
const Color whiteText = Color(0xFFFFFFFF); // White text
const Color whitecard = Color(0xFFFFFFFF); // White text

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  String? errorMessage;

  void handleSubmit() {
    final taskName = taskNameController.text.trim();
    final description = descriptionController.text.trim();
    final dueDate = dueDateController.text.trim();

    if (taskName.isEmpty || description.isEmpty || dueDate.isEmpty) {
      setState(() {
        errorMessage = 'Please fill in all fields.';
      });
    } else {
      Navigator.pop(context, {
        'title': taskName,
        'description': description,
        'dueDate': dueDate,
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
            color: whitecard,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.network(
                      'https://dashboard.codeparrot.ai/api/assets/Z4yjR3Tr0Kgj1uQR',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 80),
                  const Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Inter',
                      color: blueText,
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
                  color: blueText,
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
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: blueText,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Enter task description...',
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
                'Due Date',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: blueText,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: dueDateController,
                decoration: InputDecoration(
                  hintText: 'YYYY-MM-DD',
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
                keyboardType: TextInputType.datetime,
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
                    backgroundColor: blueBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: whiteText,
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
