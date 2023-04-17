import 'package:flutter/material.dart';

class listPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('الملف الشخصي'),
              onTap: () {
                // navigate to profile page
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('الإعدادات'),
              onTap: () {
                // navigate to settings page
                Navigator.pushNamed(context, '/settings');

              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('تسجيل الخروج'),
              onTap: () {
                // navigate to login page
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),

    );
  }
}
