import 'package:flutter/material.dart';
import 'package:palliative_care/ui/LoginScreen.dart';
import 'package:palliative_care/ui/SignUp.dart';
import 'package:palliative_care/ui/Who.dart';
import 'package:palliative_care/ui/add_post.dart';
import 'package:palliative_care/ui/categories.dart';
import 'package:palliative_care/ui/chat.dart';
import 'package:palliative_care/ui/home.dart';
import 'package:palliative_care/ui/notification.dart';
import 'package:palliative_care/ui/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        '/who':(context) => Who(),
        '/login':(context) => LoginScreen(),
        '/signup':(context) => SignUp(),
        '/home':(context) => HomeScreen(),
       // '/profile':(context) => DoctorProfilePage(),
        '/chat':(context) => ChatScreen(),
        '/notifications':(context) => NotificationScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: HomeScreen()/*(name: 'Moaz',address: 'Gaza',email: 'MOAZ1111@gmail.com',phoneNumber: '05999999',specialty: 'IT')*/,
    );
  }
}
