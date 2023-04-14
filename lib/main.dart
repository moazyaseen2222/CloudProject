import 'package:flutter/material.dart';
import 'package:palliative_care/ui/add_post.dart';
import 'package:palliative_care/ui/categories.dart';
import 'package:palliative_care/ui/chat.dart';
import 'package:palliative_care/ui/notification.dart';
import 'package:palliative_care/ui/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationScreen(),
    );
  }
}
