import 'package:bkid_frontend/services/transfer_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bkid_frontend/providers/kid_provider.dart';

class TransferDialog extends StatefulWidget {
  const TransferDialog({Key? key}) : super(key: key);

  @override
  _TransferDialogState createState() => _TransferDialogState();
}

class _TransferDialogState extends State<TransferDialog> {
  final TextEditingController amountController = TextEditingController();
  String? selectedKid;
  String? errorMessage;

  void handleSubmit() async {
    final amountText = amountController.text.trim();

    if (amountText.isEmpty || selectedKid == null) {
      setState(() {
        errorMessage = 'Please fill in all fields.';
      });
      return;
    }

    // Add validation for numeric input
    if (!RegExp(r'^\d+$').hasMatch(amountText)) {
      setState(() {
        errorMessage = 'Amount must be a valid number';
      });
      return;
    }

    final amount = int.tryParse(amountText) ?? 0;
    if (amount <= 0) {
      setState(() {
        errorMessage = 'Amount must be greater than 0';
      });
      return;
    }

    final transferData = {
      'amount': amount,
      'Kname': selectedKid,
    };

    try {
      await TransferServices().createTransfer(transferData);
      Navigator.pop(context, transferData);
    } catch (e) {
      setState(() {
        // Extract error message from DioException or use toString()
        if (e is DioException && e.response?.data != null) {
          errorMessage = e.response?.data['message'] ?? e.message;
        } else {
          errorMessage = e.toString();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final kidProvider = Provider.of<KidProvider>(context);
    final kids = kidProvider.kids.map((kid) => kid['Kname'] as String).toList();

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
                    'Transfer',
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
                'Amount',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: amountController,
                decoration: InputDecoration(
                  hintText: 'Enter amount...',
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
                'Select Kid',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedKid,
                items: kids
                    .map((kid) => DropdownMenuItem<String>(
                          value: kid,
                          child: Text(kid),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedKid = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Select kid...',
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
                dropdownColor: Colors.white,
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
                    'Transfer',
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
