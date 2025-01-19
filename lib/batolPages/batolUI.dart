import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BankingApp(),
    );
  }
}

// Define colors as constants
const Color backgroundColor = Color(0xFF2575CC);
const Color cardBackgroundColor = Color(0xFFFFFFFF);
const Color blueCardColor = Color(0xFF2575CC);
const Color dottedCardColor = Color(0xFFACCBEB);
const Color whiteTextColor = Color(0xFFFFFFFF);
const Color blueTextColor = Color(0xFF2575CC);

class BankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor, // Background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning,',
                        style: TextStyle(
                          color: whiteTextColor,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        'Hamad',
                        style: TextStyle(
                          color: whiteTextColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications,
                        color: whiteTextColor, size: 24.0),
                    onPressed: () {
                      // Handle notification icon tap
                      print('Notification icon tapped!');
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              // First card for the main balance information
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: cardBackgroundColor
                      .withOpacity(0.3), // White card background color
                  borderRadius: BorderRadius.circular(25.0), // Set radius
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                            height: 30.0), // Add top padding to avoid overlap
                        Center(
                          child: Text(
                            '1234 5678 9101 6789',
                            style: TextStyle(
                              color: whiteTextColor, // Text color
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment(-0.5, 0.23),
                          child: Text(
                            'Balance',
                            style: TextStyle(
                              color: whiteTextColor, // Text color
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '152.030',
                                style: TextStyle(
                                  color: whiteTextColor, // Text color
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' KWD',
                                style: TextStyle(
                                  color: whiteTextColor, // Text color
                                  fontSize: 17.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: -20,
                      left: -20,
                      child: Align(
                        alignment: Alignment(-1.0, -1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: cardBackgroundColor,
                              width: 4.0, // Increase border thickness
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/your_image.png'), // Replace with your image path
                            radius: 40.0, // Larger size
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

// Clickable card for the transfer action
              InkWell(
                onTap: () {
                  // Handle transfer card tap
                  print('Transfer card tapped!');
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: cardBackgroundColor.withOpacity(
                        0.3), // White card background color with opacity
                    borderRadius: BorderRadius.circular(25.0), // Set radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Transfer',
                      style: TextStyle(
                        color: whiteTextColor, // White text color
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold, // Bold text
                      ),
                    ),
                  ),
                ),
              ),

              // Third card for the kids' cards and the add kid button
              Text(
                'My Kids',
                style: TextStyle(
                  color: whiteTextColor, // Text color
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: cardBackgroundColor
                        .withOpacity(0.3), // White card background color
                    borderRadius: BorderRadius.circular(25.0), // Set radius
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Kid Cards with spacing between them
                        KidCard(
                          name: 'Sagoor',
                          amount: '23.980 KWD',
                          image: 'assets/sagoor.png',
                        ),
                        SizedBox(height: 15.0), // Adding spacing between cards
                        KidCard(
                          name: 'Maymoona',
                          amount: '23.980 KWD',
                          image: 'assets/maymoona.png',
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                dottedCardColor, // Button background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                          ),
                          onPressed: () {
                            // Handle add kid button tap
                            print('Add kid button tapped!');
                          },
                          child: Center(
                            child: Text(
                              '+ Add new kid',
                              style: TextStyle(
                                color: whiteTextColor, // Text color
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
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

class KidCard extends StatelessWidget {
  final String name;
  final String amount;
  final String image;

  KidCard({required this.name, required this.amount, required this.image});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: blueCardColor, // Blue card color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(15.0),
      ),
      onPressed: () {
        // Handle kid card tap
        print('$name card tapped!');
      },
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: cardBackgroundColor,
                width: 4.0, // Increase border thickness
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
                  color: whiteTextColor, // Text color
                  fontSize: 16.0,
                ),
              ),
              Text(
                amount,
                style: TextStyle(
                  color: whiteTextColor, // Text color
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
