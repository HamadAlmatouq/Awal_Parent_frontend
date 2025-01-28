import 'package:bkid_frontend/pages/allowance_dialogue.dart';
import 'package:bkid_frontend/pages/goals_page.dart';
import 'package:bkid_frontend/pages/notification_page.dart';
import 'package:bkid_frontend/pages/restrictions_page.dart';
import 'package:bkid_frontend/pages/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const Color blueBackground = Color(0xFF2675CC);
const Color blueCard = Color(0xFF7CACE0);
const Color blueText = Color(0xFF2575CC);
const Color whiteText = Color(0xFFFFFFFF);
const Color whiteCard = Color(0xFFFFFFFF);
const Color greenText = Color(0xFF25CC25);
const Color redText = Color(0xFFFF0000);

class ViewKidCard extends StatelessWidget {
  final Map<String, dynamic> kid;

  const ViewKidCard({super.key, required this.kid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueBackground,
      appBar: AppBar(
        backgroundColor: blueBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: whiteText),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: whiteText),
            onPressed: () {
              context.push('/notifications', extra: kid['Kname']);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: whiteText.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        '1234 5678 XXXX XXXX',
                        style: TextStyle(
                          fontSize: 18,
                          color: whiteText,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Balance ',
                            style: TextStyle(
                              fontSize: 16,
                              color: whiteText,
                            ),
                          ),
                          Text(
                            '${kid['balance'] ?? 23.980}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: whiteText,
                            ),
                          ),
                          const Text(
                            ' KWD',
                            style: TextStyle(
                              fontSize: 16,
                              color: whiteText,
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: whiteText),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildInfoColumn(
                              '3213', 'Points', whiteText, Icons.star),
                          _buildInfoColumn('${kid['savings'] ?? 33.870} KWD',
                              'Savings', whiteText, null),
                          _buildInfoColumn('${kid['steps'] ?? 2902}', 'Steps',
                              whiteText, Icons.directions_walk),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -10,
                  left: -10,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: blueCard,
                            width: 4.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage:
                              const AssetImage('assets/images.png'),
                          radius: 40.0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        kid['Kname'] ?? 'Unknown',
                        style: const TextStyle(
                          color: whiteText,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      _showQRCodeDialog(context);
                    },
                    child: Icon(
                      Icons.qr_code,
                      color: whiteText,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleButton(context, Icons.checklist, 'Tasks', '/tasks',
                    extra: kid['Kname']),
                _buildCircleButton(context, Icons.money, 'Allowance', null,
                    isDialog: true),
                _buildCircleButton(
                    context, Icons.shield, 'Restriction', '/restriction'),
                _buildCircleButton(context, Icons.flag, 'Goals', '/goals',
                    extra: kid),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Redeem points:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: whiteText,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: blueCard,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: _buildRewardCards(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(
      String value, String label, Color color, IconData? icon) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 4),
              Icon(icon, color: color, size: 16),
            ],
          ],
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildCircleButton(
      BuildContext context, IconData icon, String label, String? route,
      {bool isDialog = false, dynamic extra}) {
    return GestureDetector(
      onTap: () {
        if (isDialog) {
          showDialog(
            context: context,
            builder: (BuildContext context) =>
                AllowanceDialog(kidName: kid['Kname']),
          );
        } else if (route != null) {
          context.push(route, extra: extra);
        }
      },
      child: Column(
        children: [
          Container(
            width: 69,
            height: 69,
            decoration: BoxDecoration(
              color: blueCard,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: whiteText, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: whiteText,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRewardCards(BuildContext context) {
    final List<Map<String, dynamic>> rewards = [
      {
        'title': 'dabdoob',
        'points': 3213,
        'required': 1500,
        'color': whiteCard,
        // 'requested': true
      },
      {
        'title': 'Kidzania',
        'points': 3213,
        'required': 3000,
        'color': whiteCard,
        'requested': false
      },
      {
        'title': 'SEPHORA',
        'points': 3213,
        'required': 4000,
        'color': whiteCard,
        'requested': false
      },
    ];

    return rewards.map((Map<String, dynamic> reward) {
      return _buildRewardCard(context, reward);
    }).toList();
  }

  Widget _buildRewardCard(BuildContext context, Map<String, dynamic> reward) {
    final bool hasEnoughPoints = reward['points'] >= reward['required'];
    final Color pointsColor = hasEnoughPoints ? greenText : redText;

    return GestureDetector(
      onTap: () {
        _showRewardInfo(context, reward);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: reward['color'],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/dabdob.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reward['title'],
                      style: const TextStyle(
                        color: blueText,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      '30% OFF',
                      style: TextStyle(
                        color: blueText,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (reward['requested'] == true)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'requested',
                        style: TextStyle(
                          color: whiteText,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '${reward['points']}',
                        style: TextStyle(
                          color: pointsColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '/${reward['required']}',
                        style: const TextStyle(
                          color: blueText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.info, color: blueText),
                        onPressed: () {
                          _showRewardInfo(context, reward);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRewardInfo(BuildContext context, Map<String, dynamic> reward) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: whiteCard,
              borderRadius: BorderRadius.circular(25),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/dabdob.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        reward['title'],
                        style: const TextStyle(
                          color: blueText,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    kid['Kname'] ?? 'Unknown',
                    style: const TextStyle(
                      color: blueText,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Enjoy a 30% OFF',
                    style: TextStyle(
                      color: blueText,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Points needed:',
                        style: TextStyle(
                          color: blueText,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${reward['points']}',
                            style: TextStyle(
                              color: reward['points'] >= reward['required']
                                  ? greenText
                                  : redText,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '/${reward['required']}',
                            style: TextStyle(
                              color: blueText,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'Close',
                            style: TextStyle(
                              color: whiteText,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle redeem action
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greenText,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'Redeem',
                            style: TextStyle(
                              color: whiteText,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
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
      },
    );
  }

  void _showQRCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: whiteCard,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'QR Code',
                  style: TextStyle(
                    color: blueText,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/qr.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      color: whiteText,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ViewKidCard(
      kid: {
        'balance': 23.980,
        'savings': 33.870,
        'steps': 2902,
        'Kname': 'John Doe',
      },
    ),
    theme: ThemeData(
      primaryColor: blueBackground,
      scaffoldBackgroundColor: blueBackground,
    ),
  ));
}
