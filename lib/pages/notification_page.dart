import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final String kidName; // Add kidName parameter

  const NotificationScreen({
    Key? key,
    required this.kidName,
  }) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isUnread = true;
  List<Map<String, dynamic>> unreadNotifications = [];
  List<Map<String, dynamic>> readNotifications = [];

  @override
  void initState() {
    super.initState();
    // TODO: Fetch notifications
    // Temporary data for testing
    unreadNotifications = [
      {
        'title': 'New Task Added',
        'message': 'A new task has been added to your list',
        'time': '2 hours ago',
      },
    ];
    readNotifications = [
      {
        'title': 'Goal Achieved',
        'message': 'Congratulations! You have achieved your savings goal',
        'time': '1 day ago',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2575CC),
      appBar: AppBar(
        backgroundColor: Color(0xFF2575CC),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  // Tab Switcher
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFF2575CC),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isUnread = true),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isUnread
                                      ? Color(0xFF2575CC)
                                      : Colors.white,
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(8)),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Unread',
                                  style: TextStyle(
                                    color: isUnread
                                        ? Colors.white
                                        : Color(0xFF9A9A9A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          VerticalDivider(width: 1, color: Color(0xFF2575CC)),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isUnread = false),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: !isUnread
                                      ? Color(0xFF2575CC)
                                      : Colors.white,
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(8)),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Read',
                                  style: TextStyle(
                                    color: !isUnread
                                        ? Colors.white
                                        : Color(0xFF9A9A9A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Notifications List
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: isUnread
                          ? unreadNotifications.length
                          : readNotifications.length,
                      itemBuilder: (context, index) {
                        final notification = isUnread
                            ? unreadNotifications[index]
                            : readNotifications[index];
                        return NotificationCard(
                          title: notification['title'],
                          message: notification['message'],
                          time: notification['time'],
                          isUnread: isUnread,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final bool isUnread;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.message,
    required this.time,
    required this.isUnread,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Color(0xFF7CACE0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isUnread)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Text(
              time,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
