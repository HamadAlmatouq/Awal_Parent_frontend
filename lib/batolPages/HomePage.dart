// // // import 'package:flutter/material.dart';

// // // void main() {
// // //   runApp(MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         backgroundColor: Color(0xFF2575CC),
// // //         body: SafeArea(
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Header(),
// // //               UserCard(),
// // //               KidsSection(),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class Header extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Padding(
// // //       padding: const EdgeInsets.all(16.0),
// // //       child: Row(
// // //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //         children: [
// // //           Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Text(
// // //                 'Good Morning,',
// // //                 style: TextStyle(
// // //                   fontSize: 20,
// // //                   fontWeight: FontWeight.bold,
// // //                   color: Colors.white,
// // //                 ),
// // //               ),
// // //               Text(
// // //                 'Hamad',
// // //                 style: TextStyle(
// // //                   fontSize: 20,
// // //                   fontWeight: FontWeight.w500,
// // //                   color: Colors.white,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //           Icon(
// // //             Icons.notifications,
// // //             color: Colors.white,
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // class UserCard extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // //       child: Container(
// // //         decoration: BoxDecoration(
// // //           color: Colors.white.withOpacity(0.4),
// // //           borderRadius: BorderRadius.circular(25),
// // //         ),
// // //         padding: EdgeInsets.all(16),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Row(
// // //               children: [
// // //                 CircleAvatar(
// // //                   radius: 30,
// // //                   backgroundColor: Color(0xFF7CACE0),
// // //                   child: Icon(Icons.person, color: Colors.white),
// // //                 ),
// // //                 SizedBox(width: 16),
// // //                 Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Text(
// // //                       '1234 5678 9101 6789',
// // //                       style: TextStyle(
// // //                         fontSize: 18,
// // //                         color: Colors.white,
// // //                       ),
// // //                     ),
// // //                     Text(
// // //                       'Balance',
// // //                       style: TextStyle(
// // //                         fontSize: 16,
// // //                         color: Colors.white,
// // //                       ),
// // //                     ),
// // //                     Text(
// // //                       '152.030 KWD',
// // //                       style: TextStyle(
// // //                         fontSize: 24,
// // //                         fontWeight: FontWeight.w600,
// // //                         color: Colors.white,
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ],
// // //             ),
// // //             SizedBox(height: 16),
// // //             Center(
// // //               child: ElevatedButton(
// // //                 onPressed: () {},
// // //                 style: ElevatedButton.styleFrom(
// // //                   backgroundColor: Colors.white.withOpacity(0.4),
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(15),
// // //                   ),
// // //                 ),
// // //                 child: Text(
// // //                   'Transfer',
// // //                   style: TextStyle(
// // //                     fontSize: 24,
// // //                     fontWeight: FontWeight.w500,
// // //                     color: Colors.white,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class KidsSection extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Expanded(
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Text(
// // //               'My Kids:',
// // //               style: TextStyle(
// // //                 fontSize: 24,
// // //                 fontWeight: FontWeight.w600,
// // //                 color: Colors.white,
// // //               ),
// // //             ),
// // //             SizedBox(height: 16),
// // //             KidCard(name: 'Sagoor', balance: '23.980 KWD'),
// // //             SizedBox(height: 16),
// // //             KidCard(name: 'Maymoona', balance: '23.980 KWD'),
// // //             SizedBox(height: 16),
// // //             AddNewKidButton(),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class KidCard extends StatelessWidget {
// // //   final String name;
// // //   final String balance;

// // //   KidCard({required this.name, required this.balance});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.circular(20),
// // //         border: Border.all(color: Color(0xFFE2EBF4), width: 2),
// // //       ),
// // //       padding: EdgeInsets.all(16),
// // //       child: Row(
// // //         children: [
// // //           CircleAvatar(
// // //             radius: 30,
// // //             backgroundImage: NetworkImage(
// // //                 'https://dashboard.codeparrot.ai/api/assets/Z40ULHTr0Kgj1uUO'),
// // //           ),
// // //           SizedBox(width: 16),
// // //           Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Text(
// // //                 name,
// // //                 style: TextStyle(
// // //                   fontSize: 24,
// // //                   fontWeight: FontWeight.w700,
// // //                   color: Color(0xFF2575CC),
// // //                 ),
// // //               ),
// // //               Text(
// // //                 balance,
// // //                 style: TextStyle(
// // //                   fontSize: 20,
// // //                   fontWeight: FontWeight.w700,
// // //                   color: Color(0xFF2575CC),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //           Spacer(),
// // //           Icon(Icons.arrow_forward_ios, color: Color(0xFF2575CC)),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // class AddNewKidButton extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       decoration: BoxDecoration(
// // //         color: Colors.transparent,
// // //         borderRadius: BorderRadius.circular(20),
// // //         border:
// // //             Border.all(color: Colors.white, width: 2, style: BorderStyle.solid),
// // //       ),
// // //       padding: EdgeInsets.all(16),
// // //       child: Center(
// // //         child: Row(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Icon(Icons.add_circle_outline, color: Colors.white),
// // //             SizedBox(width: 8),
// // //             Text(
// // //               'Add new kid',
// // //               style: TextStyle(
// // //                 fontSize: 20,
// // //                 color: Colors.white,
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: HomePage(), // Changed to HomePage
// //     );
// //   }
// // }

// // class HomePage extends StatelessWidget {
// //   // Changed class name to HomePage
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color(0xFF2575CC),
// //       body: SafeArea(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Header(),
// //             UserCard(),
// //             KidsSection(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class Header extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 'Good Morning,',
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //               Text(
// //                 'Hamad',
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.w500,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //             ],
// //           ),
// //           Icon(
// //             Icons.notifications,
// //             color: Colors.white,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class UserCard extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //       child: Container(
// //         decoration: BoxDecoration(
// //           color: Colors.white.withOpacity(0.4),
// //           borderRadius: BorderRadius.circular(25),
// //         ),
// //         padding: EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 CircleAvatar(
// //                   radius: 30,
// //                   backgroundColor: Color(0xFF7CACE0),
// //                   child: Icon(Icons.person, color: Colors.white),
// //                 ),
// //                 SizedBox(width: 16),
// //                 Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       '1234 5678 9101 6789',
// //                       style: TextStyle(
// //                         fontSize: 18,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                     Text(
// //                       'Balance',
// //                       style: TextStyle(
// //                         fontSize: 16,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                     Text(
// //                       '152.030 KWD',
// //                       style: TextStyle(
// //                         fontSize: 24,
// //                         fontWeight: FontWeight.w600,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 16),
// //             Center(
// //               child: ElevatedButton(
// //                 onPressed: () {},
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.white.withOpacity(0.4),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(15),
// //                   ),
// //                 ),
// //                 child: Text(
// //                   'Transfer',
// //                   style: TextStyle(
// //                     fontSize: 24,
// //                     fontWeight: FontWeight.w500,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class KidsSection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Expanded(
// //       child: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'My Kids:',
// //               style: TextStyle(
// //                 fontSize: 24,
// //                 fontWeight: FontWeight.w600,
// //                 color: Colors.white,
// //               ),
// //             ),
// //             SizedBox(height: 16),
// //             KidCard(name: 'Sagoor', balance: '23.980 KWD'),
// //             SizedBox(height: 16),
// //             KidCard(name: 'Maymoona', balance: '23.980 KWD'),
// //             SizedBox(height: 16),
// //             AddNewKidButton(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class KidCard extends StatelessWidget {
// //   final String name;
// //   final String balance;

// //   KidCard({required this.name, required this.balance});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(20),
// //         border: Border.all(color: Color(0xFFE2EBF4), width: 2),
// //       ),
// //       padding: EdgeInsets.all(16),
// //       child: Row(
// //         children: [
// //           CircleAvatar(
// //             radius: 30,
// //             backgroundImage: NetworkImage(
// //                 'https://dashboard.codeparrot.ai/api/assets/Z40ULHTr0Kgj1uUO'),
// //           ),
// //           SizedBox(width: 16),
// //           Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 name,
// //                 style: TextStyle(
// //                   fontSize: 24,
// //                   fontWeight: FontWeight.w700,
// //                   color: Color(0xFF2575CC),
// //                 ),
// //               ),
// //               Text(
// //                 balance,
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.w700,
// //                   color: Color(0xFF2575CC),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           Spacer(),
// //           Icon(Icons.arrow_forward_ios, color: Color(0xFF2575CC)),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class AddNewKidButton extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: Colors.transparent,
// //         borderRadius: BorderRadius.circular(20),
// //         border:
// //             Border.all(color: Colors.white, width: 2, style: BorderStyle.solid),
// //       ),
// //       padding: EdgeInsets.all(16),
// //       child: Center(
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(Icons.add_circle_outline, color: Colors.white),
// //             SizedBox(width: 8),
// //             Text(
// //               'Add new kid',
// //               style: TextStyle(
// //                 fontSize: 20,
// //                 color: Colors.white,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(), // Keeping the homepage name as BankingApp
//     );
//   }
// }

// // Define colors as constants
// const Color backgroundColor = Color(0xFF2575CC);
// const Color cardBackgroundColor = Color(0xFFFFFFFF);
// const Color blueCardColor = Color(0xFF2575CC);
// const Color dottedCardColor = Color(0xFFACCBEB);
// const Color whiteTextColor = Color(0xFFFFFFFF);
// const Color blueTextColor = Color(0xFF2575CC);

// class HomePage extends StatelessWidget {
//   // Keeping the class name as BankingApp
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Good Morning,',
//                         style: TextStyle(
//                           color: whiteTextColor,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                       Text(
//                         'Hamad',
//                         style: TextStyle(
//                           color: whiteTextColor,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.notifications,
//                         color: whiteTextColor, size: 24.0),
//                     onPressed: () {
//                       print('Notification icon tapped!');
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20.0),
//               // First card for the main balance information
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(15.0),
//                 decoration: BoxDecoration(
//                   color: cardBackgroundColor.withOpacity(0.3),
//                   borderRadius: BorderRadius.circular(25.0),
//                 ),
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         SizedBox(height: 30.0),
//                         Center(
//                           child: Text(
//                             '1234 5678 9101 6789',
//                             style: TextStyle(
//                               color: whiteTextColor,
//                               fontSize: 18.0,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10.0),
//                         Align(
//                           alignment: Alignment(-0.5, 0.23),
//                           child: Text(
//                             'Balance',
//                             style: TextStyle(
//                               color: whiteTextColor,
//                               fontSize: 16.0,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Text(
//                                 '152.030',
//                                 style: TextStyle(
//                                   color: whiteTextColor,
//                                   fontSize: 24.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 ' KWD',
//                                 style: TextStyle(
//                                   color: whiteTextColor,
//                                   fontSize: 17.0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Positioned(
//                       top: -20,
//                       left: -20,
//                       child: Align(
//                         alignment: Alignment(-1.0, -1.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               color: cardBackgroundColor.withOpacity(0.3),
//                               width: 4.0,
//                             ),
//                           ),
//                           child: CircleAvatar(
//                             backgroundImage: AssetImage(
//                                 'assets/your_image.png'), // Replace with your image path
//                             radius: 40.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               // Transaction card
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(15.0),
//                 decoration: BoxDecoration(
//                   color: cardBackgroundColor.withOpacity(0.3),
//                   borderRadius: BorderRadius.circular(25.0),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Recent Transactions',
//                       style: TextStyle(
//                         color: whiteTextColor,
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Transaction details go here...',
//                       style: TextStyle(
//                         color: whiteTextColor,
//                         fontSize: 16.0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               // Kids section overlaid on transaction card
//               Stack(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.all(15.0),
//                     decoration: BoxDecoration(
//                       color: cardBackgroundColor.withOpacity(0.3),
//                       borderRadius: BorderRadius.circular(25.0),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           'My Kids',
//                           style: TextStyle(
//                             color: whiteTextColor,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10.0),
//                         KidCard(
//                           name: 'Sagoor',
//                           amount: '23.980 KWD',
//                           image: 'assets/sagoor.png',
//                         ),
//                         SizedBox(height: 15.0),
//                         KidCard(
//                           name: 'Maymoona',
//                           amount: '23.980 KWD',
//                           image: 'assets/maymoona.png',
//                         ),
//                         SizedBox(height: 20.0),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: dottedCardColor,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             padding: EdgeInsets.symmetric(vertical: 15.0),
//                           ),
//                           onPressed: () {
//                             print('Add kid button tapped!');
//                           },
//                           child: Center(
//                             child: Text(
//                               '+ Add new kid',
//                               style: TextStyle(
//                                 color: whiteTextColor,
//                                 fontSize: 16.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class KidCard extends StatelessWidget {
//   final String name;
//   final String amount;
//   final String image;

//   KidCard({required this.name, required this.amount, required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: blueCardColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         padding: EdgeInsets.all(15.0),
//       ),
//       onPressed: () {
//         print('$name card tapped!');
//       },
//       child: Row(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: cardBackgroundColor.withOpacity(0.3),
//                 width: 4.0,
//               ),
//             ),
//             child: CircleAvatar(
//               backgroundImage: AssetImage(image),
//               radius: 25.0,
//             ),
//           ),
//           SizedBox(width: 15.0),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 name,
//                 style: TextStyle(
//                   color: whiteTextColor,
//                   fontSize: 16.0,
//                 ),
//               ),
//               Text(
//                 amount,
//                 style: TextStyle(
//                   color: whiteTextColor,
//                   fontSize: 16.0,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // Keeping the homepage name as HomePage
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          // Make the whole page scrollable
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
                        // Navigate to the Notification page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationPage()),
                        );
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
                    color: cardBackgroundColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 30.0),
                          Center(
                            child: Text(
                              '1234 5678 9101 6789',
                              style: TextStyle(
                                color: whiteTextColor,
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
                                color: whiteTextColor,
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
                                    color: whiteTextColor,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' KWD',
                                  style: TextStyle(
                                    color: whiteTextColor,
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
                                color: cardBackgroundColor.withOpacity(0.3),
                                width: 4.0,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/your_image.png'), // Replace with your image path
                              radius: 40.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                // Transaction card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: cardBackgroundColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Transactions',
                        style: TextStyle(
                          color: whiteTextColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Transaction details go here...',
                        style: TextStyle(
                          color: whiteTextColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                // Kids section overlaid on transaction card
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: cardBackgroundColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'My Kids',
                            style: TextStyle(
                              color: whiteTextColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          KidCard(
                            name: 'Sagoor',
                            amount: '23.980 KWD',
                            image: 'assets/sagoor.png',
                          ),
                          SizedBox(height: 15.0),
                          KidCard(
                            name: 'Maymoona',
                            amount: '23.980 KWD',
                            image: 'assets/maymoona.png',
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: dottedCardColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                            ),
                            onPressed: () {
                              // Navigate to the Add Kid page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddKidPage()),
                              );
                            },
                            child: Center(
                              child: Text(
                                '+ Add new kid',
                                style: TextStyle(
                                  color: whiteTextColor,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
        backgroundColor: cardBackgroundColor, // Set kids card to white
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(15.0),
      ),
      onPressed: () {
        print('$name card tapped!');
      },
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: cardBackgroundColor.withOpacity(0.3),
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
                  color: blueTextColor,
                  fontSize: 16.0,
                ),
              ),
              Text(
                amount,
                style: TextStyle(
                  color: blueTextColor,
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

class AddKidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Kid'),
      ),
      body: Center(
        child: Text('Add Kid Page'),
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('Notification Page'),
      ),
    );
  }
}
