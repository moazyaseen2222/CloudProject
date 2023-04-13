import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/category_box.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        title: Text(
          'قائمة المواضيع',
          style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 599,
                child: GridView(
                  scrollDirection: Axis.vertical,
                  // itemCount: 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 15),
                  children: const [

                    /// TO DO => use InkWell for make it clickable

                    CategotyBox(
                      imageName: 'images/heart.jpeg',
                      categoryName: 'القلب',
                    ),
                    CategotyBox(
                      imageName: 'images/sokari.jpg',
                      categoryName: 'السكري',
                    ),
                    CategotyBox(
                      imageName: 'images/fitness.jpg',
                      categoryName: 'الصحة البدنية',
                    ),
                    CategotyBox(
                      imageName: 'images/green.jpg',
                      categoryName: 'الطب البديل',
                    ),
                    CategotyBox(
                      imageName: 'images/cancer.jpg',
                      categoryName: 'السرطان',
                    ),
                    CategotyBox(
                      imageName: 'images/mind.jpeg',
                      categoryName: 'الصحة النفسية',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
