


import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListView(
        children: [
          _buildNotification(
            'اشعار جديد من محمد',
            'Hey, can we meet up later?',
            true,
          ),
          _buildNotification(
            'اشعار جديد من محمد',
            'I just sent you an email.',
            false,
          ),
          _buildNotification(
            'اشعار جديد من محمد',
            'Don\'t forget to bring your notes.',
            true,
          ),
          _buildNotification(
            'اشعار جديد من محمد',
            'Have you seen the latest episode?',
            false,
          ),
          _buildNotification(
            'اشعار جديد من محمد',
            'John Doe just followed you on Twitter.',
            true,
          ),
          _buildNotification(
            'اشعار جديد من محمد',
            'How was your weekend?',
            false,
          ),
        ],

    );
  }

  Widget _buildNotification(String title, String message, bool isUnread) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.notifications,color: Colors.white,),
        backgroundColor: isUnread ? Colors.green :Colors.green,
      ),
      title: Text(title),
      subtitle: Text(message),
      trailing: Text(
        '1m ago',
        style: TextStyle(color: Colors.grey),
      ),
      onTap: () {
        // TODO: Navigate to notification details screen.
      },
    );
  }
}
