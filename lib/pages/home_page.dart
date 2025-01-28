import 'package:bkid_frontend/main.dart';
import 'package:bkid_frontend/pages/transfer_dialogue.dart';
import 'package:bkid_frontend/providers/auth_provider.dart';
import 'package:bkid_frontend/providers/kid_provider.dart';
import 'package:bkid_frontend/services/client.dart';
import 'package:bkid_frontend/widgets/balance_card.dart';
import 'package:bkid_frontend/widgets/kid_card.dart';
import 'package:dio/dio.dart';
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

const Color blueBackground = Color(0xFF2675CC); // Blue background
const Color blueCard = Color(0xFF7CACE0); // Blue card
const Color blueText = Color(0xFF2575CC); // Blue text
const Color whiteText = Color(0xFFFFFFFF); // White text
const Color whiteCard = Color(0xFFFFFFFF); // White card

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isLoading = true;
  double _parentBalance = 0.0;

  Future<void> _fetchParentInfo() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final token = authProvider.token;

    try {
      final response = await Client.dio.get(
        '/parent/info',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          _parentBalance = (response.data['balance'] as num).toDouble();
        });
      }
    } on DioException catch (e) {
      print('Error fetching parent info: ${e.message}');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
    _fetchParentInfo();
  }

  Future<void> _fetchInitialData() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await Provider.of<KidProvider>(context, listen: false)
        .fetchKidsByParent(authProvider.token);
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _refreshData() async {
    await Future.wait([
      _fetchInitialData(),
      _fetchParentInfo(),
    ]);
  }

  Future<void> _handleLogout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          width: 383,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context, false),
                    child: Icon(Icons.close, size: 24),
                  ),
                  const SizedBox(width: 80),
                  const Text(
                    'Sign Out',
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
                'Are you sure you want to sign out?',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(color: Color(0xFFECECEC)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2575CC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    if (shouldLogout == true) {
      // Close drawer first
      Navigator.pop(context);
      // Perform logout
      await Provider.of<AuthProvider>(context, listen: false).logout();
      // Navigate to sign in
      if (mounted) {
        context.go('/signin');
      }
    }
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: whiteCard,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: blueBackground,
              ),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/your_image.png'),
                      radius: 40,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${Provider.of<AuthProvider>(context).user?.username ?? 'User'}',
                      style: TextStyle(
                        color: whiteText,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: blueText),
              title: Text(
                'Sign Out',
                style: TextStyle(
                  color: blueText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: _handleLogout,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final kidProvider = Provider.of<KidProvider>(context);
    final user = authProvider.user;

    return Scaffold(
      backgroundColor: blueBackground,
      drawer: _buildDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: whiteText),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.all(20.0), // Changed from fromLTRB back to all
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Good Morning,\n',
                                style: TextStyle(
                                  color: whiteText,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '${user?.username ?? 'User'}',
                                style: TextStyle(
                                  color: whiteText,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                // First card for the main balance information
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: blueCard,
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
                              '4152 5401 XXXX XXXX',
                              style: TextStyle(
                                color: whiteText,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Align(
                            alignment: Alignment(-0.0, 0.23),
                            child: Text(
                              'Balance',
                              style: TextStyle(
                                color: whiteText,
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
                                  '$_parentBalance',
                                  style: TextStyle(
                                    color: whiteText,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' KWD',
                                  style: TextStyle(
                                    color: whiteText,
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
                                color: blueCard,
                                width: 4.0,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/your_image.png'),
                              radius: 40.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),

                // Transfer card
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return TransferDialog();
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: blueCard,
                      borderRadius:
                          BorderRadius.circular(15.0), // Set radius to 15
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
                          color: whiteText,
                          fontSize: 18.0, // Slightly larger font size
                          fontWeight: FontWeight.bold, // Bold text
                        ),
                      ),
                    ),
                  ),
                ),

                // Third card for the kids' cards and the add kid button
                SizedBox(height: 20.0), // Add padding above "My Kids" text
                Text(
                  'My Kids',
                  style: TextStyle(
                    color: whiteText,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: blueCard,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ...kidProvider.kids.map((kid) {
                              print(
                                  'Mapping kid data for UI: ${kid}'); // Debug print
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewKidCard(
                                        kid: {
                                          'Kname': kid['Kname'],
                                          'balance': (kid['balance'] as num)
                                              .toDouble(),
                                          'savings': (kid['savings'] as num)
                                              .toDouble(),
                                          'steps': kid['steps'] as int,
                                          'points': kid['points']
                                              as int, // Make sure points is passed correctly
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: KidCard(
                                  name: kid['Kname'],
                                  balance: (kid['balance'] as num).toDouble(),
                                  savings: (kid['savings'] as num).toDouble(),
                                  steps: kid['steps'] as int,
                                  points: kid['points']
                                      as int, // Pass points directly
                                  image: 'assets/images.png',
                                ),
                              );
                            }),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: whiteCard,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                              ),
                              onPressed: () {
                                context.push("/add-kid");
                              },
                              child: Center(
                                child: Text(
                                  '+ Add new kid',
                                  style: TextStyle(
                                    color: blueText,
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
          ),
        ),
      ),
    );
  }
}
