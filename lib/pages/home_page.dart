import 'package:bkid_frontend/main.dart';
import 'package:bkid_frontend/providers/auth_provider.dart';
import 'package:bkid_frontend/providers/kid_provider.dart';
import 'package:bkid_frontend/widgets/balance_card.dart';
import 'package:bkid_frontend/widgets/kid_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'view_kidCard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => KidProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DashboardPage(),
      ),
    );
  }
}

const Color backgroundColor = Color(0xFF2575CC);
const Color cardBackgroundColor = Color(0xFFFFFFFF);
const Color blueCardColor = Color(0xFF2575CC);
const Color dottedCardColor = Color(0xFFACCBEB);
const Color whiteTextColor = Color(0xFFFFFFFF);
const Color blueTextColor = Color(0xFF2575CC);

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchKids();
  }

  Future<void> _fetchKids() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await Provider.of<KidProvider>(context, listen: false)
        .fetchKidsByParent(authProvider.token);
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _refreshKids() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await Provider.of<KidProvider>(context, listen: false)
        .fetchKidsByParent(authProvider.token);
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final kidProvider = Provider.of<KidProvider>(context);
    final user = authProvider.user;

    return Scaffold(
      backgroundColor: backgroundColor,
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
                        'Good Morning,\n${user?.username ?? 'User'}',
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
              BalanceCard(balance: user?.balance ?? 0.0),
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
                    color: cardBackgroundColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25.0),
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
                        color: whiteTextColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // Third card for the kids' cards and the add kid button
              Text(
                'My Kids',
                style: TextStyle(
                  color: whiteTextColor,
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
                    color: cardBackgroundColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : RefreshIndicator(
                          onRefresh: _refreshKids,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ...kidProvider.kids.map((kid) =>
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ViewKidCard(
                                              kid: {
                                                'savings':
                                                    (kid['savings'] as num)
                                                        .toDouble(),
                                                'steps': kid['steps'] as int,
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      child: KidCard(
                                        name: kid['Kname'],
                                        balance:
                                            (kid['balance'] as num).toDouble(),
                                        savings:
                                            (kid['savings'] as num).toDouble(),
                                        steps: kid['steps'] as int,
                                        image: 'assets/kid_image.png',
                                      ),
                                    )),
                                SizedBox(height: 15.0),
                                ...getDummyKidsData()
                                    .map((kid) => GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewKidCard(
                                                  kid: {
                                                    'Kname': kid['name'],
                                                    'balance': kid['balance'],
                                                    'savings': 0.0,
                                                    'steps': 0,
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                          child: KidCard(
                                            name: kid['name'],
                                            balance: kid['balance'],
                                            savings: 0.0,
                                            steps: 0,
                                            image: 'assets/kid_image.png',
                                          ),
                                        )),
                                SizedBox(height: 20.0),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: dottedCardColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.0),
                                  ),
                                  onPressed: () {
                                    context.push("/add-kid");
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

List<Map<String, dynamic>> getDummyKidsData() {
  return [
    {'name': 'Sagoor', 'balance': 23.980},
    {'name': 'Maymoona', 'balance': 25.500},
  ];
}
