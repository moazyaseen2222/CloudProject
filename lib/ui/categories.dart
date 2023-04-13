import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(child: Text('Categories',style: GoogleFonts.aBeeZee(color: Colors.green.shade400),),),
      ),
    );
  }
}
