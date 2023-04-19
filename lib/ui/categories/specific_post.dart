import 'package:flutter/material.dart';
class SpecificPost extends StatefulWidget {
  const SpecificPost({Key? key}) : super(key: key);

  @override
  State<SpecificPost> createState() => _SpecificPostState();
}

class _SpecificPostState extends State<SpecificPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('...'),
      ),
      body: Center(child:
        Text('المقالة المختارة'),),
    );
  }
}
