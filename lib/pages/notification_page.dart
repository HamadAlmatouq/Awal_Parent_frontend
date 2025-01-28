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
  List<Map<String, dynamic>> requestNotifications = [];
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

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Icon(
            Icons.notifications_outlined,
            size: 70,
            color: Color(0xFF2575CC).withOpacity(0.5),
          ),
          SizedBox(height: 16),
          Text(
            'No Requests Yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2575CC),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'No pending task requests at the moment',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF2575CC).withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 32.0, top: 24.0, bottom: 8.0),
                    child: Text(
                      'Requests',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2575CC),
                      ),
                    ),
                  ),
                  Expanded(
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: requestNotifications.isEmpty
                                  ? _buildEmptyState()
                                  : Column(
                                      children: requestNotifications
                                          .map((notification) {
                                        return NotificationCard(
                                          title: notification['title']
                                                  ?.toString() ??
                                              'Task Request',
                                          time: notification['createdAt']
                                                  ?.toString() ??
                                              'Unknown time',
                                          amount:
                                              (notification['amount'] as num?)
                                                      ?.toDouble() ??
                                                  0.0,
                                          isRequest: true,
                                          onApprove: () => _handleTaskAction(
                                              notification['title'], true),
                                          onReject: () => _handleTaskAction(
                                              notification['title'], false),
                                        );
                                      }).toList(),
                                    ),
                            ),
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
