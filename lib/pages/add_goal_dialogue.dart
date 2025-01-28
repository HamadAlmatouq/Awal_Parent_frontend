import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

const Color backgroundColor = Color(0xFF2575CC); // Blue background

class AddGoalsDialog extends StatefulWidget {
  const AddGoalsDialog({Key? key}) : super(key: key);

  @override
  _AddGoalsDialogState createState() => _AddGoalsDialogState();
}

class _AddGoalsDialogState extends State<AddGoalsDialog> {
  final TextEditingController goalNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  String? errorMessage;
  File? _image;

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 300, // Reduce max width
        maxHeight: 300, // Reduce max height
        imageQuality: 30, // Reduce quality significantly
      );

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        setState(() {
          errorMessage = 'No image selected.';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error picking image: $e';
      });
    }
  }

  void handleSubmit() async {
    final goalName = goalNameController.text.trim();
    final priceText = priceController.text.trim();
    final endDate = endDateController.text.trim();

    if (goalName.isEmpty || priceText.isEmpty || endDate.isEmpty) {
      setState(() {
        errorMessage = 'Please fill in all fields.';
      });
      return;
    }

    // Add validation for numeric input for price
    if (!RegExp(r'^\d+$').hasMatch(priceText)) {
      setState(() {
        errorMessage = 'Price must be a valid number';
      });
      return;
    }

    final price = int.tryParse(priceText) ?? 0;
    if (price <= 0) {
      setState(() {
        errorMessage = 'Price must be greater than 0';
      });
      return;
    }

    // Add validation for date format
    if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(endDate)) {
      setState(() {
        errorMessage = 'Date must be in YYYY-MM-DD format';
      });
      return;
    }

    try {
      String? base64Image;
      if (_image != null) {
        final bytes = await _image!.readAsBytes();
        if (bytes.length > 500000) {
          // Check if image is larger than ~500KB
          setState(() {
            errorMessage = 'Image is too large. Please choose a smaller image.';
          });
          return;
        }
        base64Image = base64Encode(bytes);
      }

      Navigator.pop(context, {
        'title': goalName,
        'amount': int.tryParse(priceText) ?? 0,
        'endDate': endDate,
        'image': base64Image,
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error processing image: $e';
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
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: _image == null
                      ? Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.grey[800],
                          ),
                        )
                      : Image.file(
                          _image!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
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
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: backgroundColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFD3CDCD)),
                    borderRadius: BorderRadius.circular(8),
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
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: backgroundColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFD3CDCD)),
                    borderRadius: BorderRadius.circular(8),
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
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: backgroundColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFD3CDCD)),
                    borderRadius: BorderRadius.circular(8),
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
                    'Add Goal',
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
