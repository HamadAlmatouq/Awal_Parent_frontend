import 'package:flutter/material.dart';
import 'package:bkid_frontend/pages/view_kidCard_page.dart';

class KidCard extends StatelessWidget {
  final String name;
  final double balance;
  final double savings;
  final int steps;
  final String image;

  KidCard({
    required this.name,
    required this.balance,
    required this.savings,
    required this.steps,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF2575CC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.all(15.0),
        ),
        onPressed: () {
          // Handle kid card tap
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewKidCard(kid: {
                'Kname': name,
                'balance': balance,
                'savings': savings,
                'steps': steps,
              }),
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 4.0,
                ),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 25.0,
              ),
            ),
            SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '$balance KWD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
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
