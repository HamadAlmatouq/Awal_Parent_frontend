// // import 'package:flutter/material.dart';
// // import 'package:bkid_frontend/pages/view_kidCard_page.dart';

// // class KidCard extends StatelessWidget {
// //   final String name;
// //   final double balance;
// //   final double savings;
// //   final int steps;
// //   final String image;

// //   const KidCard({
// //     super.key,
// //     required this.name,
// //     required this.balance,
// //     required this.savings,
// //     required this.steps,
// //     required this.image,
// //     required Color backgroundColor,
// //     required Color textColor,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 8.0),
// //       child: ElevatedButton(
// //         style: ElevatedButton.styleFrom(
// //           backgroundColor: const Color.fromARGB(255, 244, 246, 248),
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(10.0),
// //           ),
// //           padding: const EdgeInsets.all(15.0),
// //         ),
// //         onPressed: () {
// //           // Handle kid card tap
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => ViewKidCard(kid: {
// //                 'Kname': name,
// //                 'balance': balance,
// //                 'savings': savings,
// //                 'steps': steps,
// //               }),
// //             ),
// //           );
// //         },
// //         child: Row(
// //           children: <Widget>[
// //             Container(
// //               decoration: BoxDecoration(
// //                 shape: BoxShape.circle,
// //                 border: Border.all(
// //                   color: Colors.white,
// //                   width: 4.0,
// //                 ),
// //               ),
// //               child: CircleAvatar(
// //                 backgroundImage: AssetImage(image),
// //                 radius: 25.0,
// //               ),
// //             ),
// //             const SizedBox(width: 15.0),
// //             Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: <Widget>[
// //                 Text(
// //                   name,
// //                   style: const TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 16.0,
// //                   ),
// //                 ),
// //                 Text(
// //                   '$balance KWD',
// //                   style: const TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 16.0,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:bkid_frontend/pages/view_kidCard_page.dart';

const Color blueBackground = Color(0xFF2675CC); // Blue background
const Color blueCard = Color(0xFF7CACE0); // Blue card
const Color blueText = Color(0xFF2575CC); // Blue text
const Color whiteText = Color(0xFFFFFFFF); // White text
const Color whiteCard = Color(0xFFFFFFFF); // White card

class KidCard extends StatelessWidget {
  final String name;
  final double balance;
  final double savings;
  final int steps;
  final String image;
  final Color backgroundColor;
  final Color textColor;

  const KidCard({
    Key? key,
    required this.name,
    required this.balance,
    required this.savings,
    required this.steps,
    required this.image,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(15.0),
        ),
        onPressed: () {
          // Handle kid card tap
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewKidCard(kid: {
                'Kname': name,
                'balance': balance,
                // 'savings': savings,
                // 'steps': steps,
              }),
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // border: Border.all(
                //   color: whiteCard,
                //   width: 4.0,
                // ),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 30.0,
              ),
            ),
            const SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Balance: $balance KWD',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  'Savings: $savings KWD',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  'Steps: $steps',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
