// // // import 'package:bkid_frontend/main.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:go_router/go_router.dart';

// // // class AllowanceDialog extends StatelessWidget {
// // //   const AllowanceDialog({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return AlertDialog(
// // //       title: const Text('Allowance'),
// // //       content: Column(
// // //         mainAxisSize: MainAxisSize.min,
// // //         children: [
// // //           TextField(
// // //             decoration: InputDecoration(
// // //               labelText: 'Amount',
// // //               hintText: 'Enter amount',
// // //               border: OutlineInputBorder(
// // //                 borderRadius: BorderRadius.circular(8),
// // //               ),
// // //             ),
// // //           ),
// // //           const SizedBox(height: 16),
// // //           TextField(
// // //             decoration: InputDecoration(
// // //               labelText: 'Frequency',
// // //               hintText: 'Enter frequency',
// // //               border: OutlineInputBorder(
// // //                 borderRadius: BorderRadius.circular(8),
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //       actions: [
// // //         TextButton(
// // //           onPressed: () {
// // //             //for now
// // //             context.pop();
// // //           },
// // //           child: const Text('Cancel'),
// // //         ),
// // //         ElevatedButton(
// // //           onPressed: () {
// // //             //for now
// // //             context.pop();
// // //           },
// // //           child: const Text('Save'),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';

// // class AllowanceDialog extends StatefulWidget {
// //   const AllowanceDialog({super.key});

// //   @override
// //   _AllowanceDialogState createState() => _AllowanceDialogState();
// // }

// // class _AllowanceDialogState extends State<AllowanceDialog> {
// //   final TextEditingController amountController = TextEditingController();
// //   final TextEditingController frequencyController = TextEditingController();
// //   String? errorMessage;

// //   void handleSubmit() {
// //     final amountText = amountController.text.trim();
// //     final frequency = frequencyController.text.trim();

// //     if (amountText.isEmpty || frequency.isEmpty) {
// //       setState(() {
// //         errorMessage = 'Please fill in all fields.';
// //       });
// //     } else {
// //       Navigator.pop(context, {
// //         'amount': int.tryParse(amountText) ?? 0,
// //         'frequency': frequency,
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Dialog(
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(25),
// //       ),
// //       child: SingleChildScrollView(
// //         child: Container(
// //           width: 383,
// //           padding: const EdgeInsets.all(16),
// //           decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius: BorderRadius.circular(25),
// //           ),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Row(
// //                 children: [
// //                   GestureDetector(
// //                     onTap: () => Navigator.pop(context),
// //                     child: Icon(
// //                       Icons.close,
// //                       size: 24,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   const SizedBox(width: 80),
// //                   const Text(
// //                     'Add Allowance',
// //                     style: TextStyle(
// //                       fontSize: 24,
// //                       fontFamily: 'Inter',
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               const Divider(color: Color(0xFFECECEC)),
// //               const SizedBox(height: 16),
// //               const Text(
// //                 'Amount',
// //                 style: TextStyle(
// //                   fontSize: 18,
// //                   fontFamily: 'Inter',
// //                   color: Colors.black,
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //               TextField(
// //                 controller: amountController,
// //                 decoration: InputDecoration(
// //                   hintText: 'Amount...',
// //                   suffixText: 'KWD',
// //                   suffixStyle: const TextStyle(
// //                     color: Color(0xFF787878),
// //                     fontSize: 12,
// //                     fontFamily: 'Inter',
// //                   ),
// //                   hintStyle: const TextStyle(
// //                     color: Color(0xFFC3C3C3),
// //                     fontSize: 14,
// //                     fontFamily: 'Inter',
// //                   ),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                     borderSide: const BorderSide(color: Color(0xFFD3CDCD)),
// //                   ),
// //                   contentPadding:
// //                       const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
// //                 ),
// //                 keyboardType: TextInputType.number,
// //               ),
// //               const SizedBox(height: 16),
// //               const Text(
// //                 'Frequency',
// //                 style: TextStyle(
// //                   fontSize: 18,
// //                   fontFamily: 'Inter',
// //                   color: Colors.black,
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //               TextField(
// //                 controller: frequencyController,
// //                 decoration: InputDecoration(
// //                   hintText: 'e.g., Weekly, Monthly...',
// //                   hintStyle: const TextStyle(
// //                     color: Color(0xFFC3C3C3),
// //                     fontSize: 14,
// //                     fontFamily: 'Inter',
// //                   ),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                     borderSide: const BorderSide(color: Color(0xFFD3CDCD)),
// //                   ),
// //                   contentPadding:
// //                       const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
// //                 ),
// //               ),
// //               if (errorMessage != null) ...[
// //                 const SizedBox(height: 8),
// //                 Text(
// //                   errorMessage!,
// //                   style: const TextStyle(
// //                     color: Colors.red,
// //                     fontSize: 14,
// //                   ),
// //                 ),
// //               ],
// //               const SizedBox(height: 16),
// //               const Divider(color: Color(0xFFECECEC)),
// //               const SizedBox(height: 8),
// //               SizedBox(
// //                 width: double.infinity,
// //                 height: 54,
// //                 child: ElevatedButton(
// //                   onPressed: handleSubmit,
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color(0xFF2575CC),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(16),
// //                     ),
// //                   ),
// //                   child: const Text(
// //                     'Save',
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 18,
// //                       fontFamily: 'Inter',
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class AllowanceDialog extends StatefulWidget {
//   const AllowanceDialog({super.key});

//   @override
//   _AllowanceDialogState createState() => _AllowanceDialogState();
// }

// class _AllowanceDialogState extends State<AllowanceDialog> {
//   final TextEditingController amountController = TextEditingController();
//   String? selectedFrequency;
//   String? errorMessage;

//   void handleSubmit() {
//     final amountText = amountController.text.trim();

//     if (amountText.isEmpty || selectedFrequency == null) {
//       setState(() {
//         errorMessage = 'Please fill in all fields.';
//       });
//     } else {
//       Navigator.pop(context, {
//         'amount': int.tryParse(amountText) ?? 0,
//         'frequency': selectedFrequency,
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
//                     child: Icon(
//                       Icons.close,
//                       size: 24,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(width: 80),
//                   const Text(
//                     'Add Allowance',
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
//                 'Amount',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontFamily: 'Inter',
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextField(
//                 controller: amountController,
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
//                 'Frequency',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontFamily: 'Inter',
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               DropdownButtonFormField<String>(
//                 value: selectedFrequency,
//                 items: ['Daily', 'Weekly', 'Monthly']
//                     .map((frequency) => DropdownMenuItem<String>(
//                           value: frequency,
//                           child: Text(frequency),
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedFrequency = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Select frequency...',
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
import 'package:flutter/material.dart';

class AllowanceDialog extends StatefulWidget {
  const AllowanceDialog({super.key});

  @override
  _AllowanceDialogState createState() => _AllowanceDialogState();
}

class _AllowanceDialogState extends State<AllowanceDialog> {
  final TextEditingController amountController = TextEditingController();
  String? selectedFrequency;
  String? errorMessage;

  void handleSubmit() {
    final amountText = amountController.text.trim();

    if (amountText.isEmpty || selectedFrequency == null) {
      setState(() {
        errorMessage = 'Please fill in all fields.';
      });
    } else {
      Navigator.pop(context, {
        'amount': int.tryParse(amountText) ?? 0,
        'frequency': selectedFrequency,
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
                    child: Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 80),
                  const Text(
                    'Add Allowance',
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
                'Frequency',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedFrequency,
                items: ['Daily', 'Weekly', 'Monthly']
                    .map((frequency) => DropdownMenuItem<String>(
                          value: frequency,
                          child: Text(frequency),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedFrequency = value;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Select frequency...',
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
                style: const TextStyle(color: Colors.black),
                iconEnabledColor: Colors.black,
                selectedItemBuilder: (BuildContext context) {
                  return ['Daily', 'Weekly', 'Monthly'].map((String value) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: selectedFrequency == value
                              ? Colors.blue
                              : Colors.black,
                        ),
                      ),
                    );
                  }).toList();
                },
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
