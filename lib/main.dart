import 'package:flutter/material.dart';
import 'package:palliative_care/ui/add_post.dart';
import 'package:palliative_care/ui/categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddPost(),
    );
  }
}
