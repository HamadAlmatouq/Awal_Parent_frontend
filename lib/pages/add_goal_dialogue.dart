import 'package:flutter/material.dart';

class AddGoalsDialog extends StatefulWidget {
  const AddGoalsDialog({super.key});

  @override
  _AddGoalsDialogState createState() => _AddGoalsDialogState();
}

class _AddGoalsDialogState extends State<AddGoalsDialog> {
  final TextEditingController goalNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  String? errorMessage;

  void handleSubmit() {
    final goalName = goalNameController.text.trim();
    final priceText = priceController.text.trim();
    final endDate = endDateController.text.trim();

    if (goalName.isEmpty || priceText.isEmpty || endDate.isEmpty) {
      setState(() {
        errorMessage = 'Please fill in all fields.';
      });
    } else {
      Navigator.pop(context, {
        'title': goalName, // Change 'name' to 'title'
        'amount': int.tryParse(priceText) ?? 0,
        'endDate': endDate,
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
                    child: Image.network(
                      'https://dashboard.codeparrot.ai/api/assets/Z4yjR3Tr0Kgj1uQR',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 80),
                  const Text(
                    'Add Goals',
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
                'Goal Name',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: goalNameController,
                decoration: InputDecoration(
                  hintText: 'Enter goal name...',
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
                'Price',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: priceController,
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
                'End Date',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: endDateController,
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
