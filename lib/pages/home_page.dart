import 'package:bkid_frontend/widgets/balance_Card.dart';
import 'package:bkid_frontend/widgets/kid_Card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2575CC),
        elevation: 0,
        toolbarHeight: 0, // Hide the app bar 
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color(0xFF2575CC),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning,\nHamad',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                BalanceCard(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'My Kids',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: getDummyKidsData()
                  .map((kid) => KidCard(
                        name: kid['name'],
                        balance: kid['balance'],
                      ))
                  .toList(),
            ),
          ),
              Center(
                child: ElevatedButton.icon(
                  
                      onPressed: () {
                        context.push("/add-kid");
                        // Handle add new kid button press
                      },

                      icon: Icon(Icons.add),
                      label: Text('Add new kid'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2575CC), // Updated color
                        foregroundColor: Colors.white, // Updated color
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
              )
    // Container(
    //   margin: EdgeInsets.all(16),
    //   padding: EdgeInsets.symmetric(vertical: 16),
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Color(0xFF2575CC)),
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Icon(
    //         Icons.add,
    //         color: Color(0xFF2575CC),
    //       ),
    //       SizedBox(width: 8),
    //       Text(
    //         'Add new kid',
    //         style: TextStyle(
    //           color: Color(0xFF2575CC),
    //           fontSize: 16,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //     ],
    //   ),
    // )
        ],
      ),
    );
  }
}

// Dummy data for kid cards
List<Map<String, dynamic>> getDummyKidsData() {
  return [
    {'name': 'Sagoor', 'balance': 23.980},
    {'name': 'Maymoona', 'balance': 25.500},
  ];
}

class AddNewKidButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF2575CC)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: Color(0xFF2575CC),
          ),
          SizedBox(width: 8),
          Text(
            'Add new kid',
            style: TextStyle(
              color: Color(0xFF2575CC),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}