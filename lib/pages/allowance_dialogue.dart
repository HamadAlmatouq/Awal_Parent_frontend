import 'package:bkid_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AllowanceDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Allowance'),
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
          SizedBox(height: 16),
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
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            //for now
            context.pop();
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}