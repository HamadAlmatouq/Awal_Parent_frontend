import 'package:bkid_frontend/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:bkid_frontend/services/client.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  final String kidName;

  const NotificationScreen({
    Key? key,
    required this.kidName,
  }) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isRequests = true;
  List<Map<String, dynamic>> requestNotifications = [];
  List<Map<String, dynamic>> doneNotifications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPendingTasks();
  }

  Future<void> _fetchPendingTasks() async {
    try {
      final response = await Client.dio.get(
        '/parent/getPendingTasks',
        queryParameters: {'Kname': widget.kidName},
      );

      if (response.statusCode == 200) {
        setState(() {
          requestNotifications = List<Map<String, dynamic>>.from(response.data);
          isLoading = false;
        });
      }
    } on DioException catch (e) {
      print('Error fetching pending tasks: ${e.message}');
      setState(() => isLoading = false);
    }
  }

  Future<void> _handleTaskAction(String title, bool isApproved) async {
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final token = authProvider.token;

      final response = await Client.dio.post(
        '/parent/updateTaskCompletionRequestStatus',
        data: {
          'title': title,
          'status': isApproved ? 'approved' : 'rejected',
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },                          
        ),
      );

      if (response.statusCode == 200) {
        _fetchPendingTasks();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(isApproved ? 'Task approved' : 'Task rejected')),
        );
      }
    } catch (e) {
      print('Error updating task status: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to process request')),
      );
    }
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
                              onTap: () => setState(() => isRequests = true),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isRequests
                                      ? Color(0xFF2575CC)
                                      : Colors.white,
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(8)),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Requests',
                                  style: TextStyle(
                                    color: isRequests
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
                              onTap: () => setState(() => isRequests = false),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: !isRequests
                                      ? Color(0xFF2575CC)
                                      : Colors.white,
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(8)),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                    color: !isRequests
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
                  Expanded(
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            itemCount: isRequests
                                ? requestNotifications.length
                                : doneNotifications.length,
                            itemBuilder: (context, index) {
                              final notification = isRequests
                                  ? requestNotifications[index]
                                  : doneNotifications[index];
                              // Add null checks for all fields
                              return NotificationCard(
                                title: notification['title']?.toString() ??
                                    'Task Request',
                                time: notification['createdAt']?.toString() ??
                                    'Unknown time',
                                amount: (notification['amount'] as num?)
                                        ?.toDouble() ??
                                    0.0,
                                isRequest: isRequests,
                                onApprove: isRequests
                                    ? () => _handleTaskAction(
                                        notification['title'], true)
                                    : null,
                                onReject: isRequests
                                    ? () => _handleTaskAction(
                                        notification['title'], false)
                                    : null,
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
  final String time;
  final double amount;
  final bool isRequest;
  final VoidCallback? onApprove;
  final VoidCallback? onReject;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.time,
    required this.amount,
    required this.isRequest,
    this.onApprove,
    this.onReject,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      amount.toStringAsFixed(3),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 2),
                    Text(
                      'KWD',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              time,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
            if (isRequest && onApprove != null && onReject != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onReject,
                    child: Text(
                      'Reject',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: onApprove,
                    child: Text(
                      'Approve',
                      style: TextStyle(color: Colors.white),
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
