import 'package:flutter/material.dart';
import 'package:bkid_frontend/pages/view_kidCard_page.dart';

class KidCard extends StatelessWidget {
  final String name;
  final double balance;
  final double savings;
  final int steps;
  final int points; // Add points parameter
  final String image;

  KidCard({
    required this.name,
    required this.balance,
    required this.savings,
    required this.steps,
    required this.points, // Add points to constructor
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    print('Building KidCard with points: $points'); // Debug print
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
          print('Navigating with points: $points'); // Debug print
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewKidCard(kid: {
                'Kname': name,
                'balance': balance,
                'savings': savings,
                'steps': steps,
                'points': points, // Add points to the kid data map
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
                backgroundColor: Colors.transparent,
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
                // Removed points display from here
              ],
            ),
          ],
        ),
      ),
    );
  }
}
