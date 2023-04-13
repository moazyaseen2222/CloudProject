import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategotyBox extends StatelessWidget {
  const CategotyBox({
    super.key, required this.imageName, required this.categoryName,
  });

  final String imageName;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: const BoxDecoration(
      ),
      child: Stack(
        children: [
           Image(
            image: AssetImage(imageName),
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding:  EdgeInsets.only(top: 130),
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.green.shade400,
              child: Center(
                child: Text(
                  categoryName,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}