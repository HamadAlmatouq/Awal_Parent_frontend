import 'package:bkid_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AllowanceDialog extends StatelessWidget {
  const AllowanceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Allowance'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
              hintText: 'Enter amount',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Frequency',
              hintText: 'Enter frequency',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            //for now
            context.pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            //for now
            context.pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}