import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palliative_care/ui/categories/alternatvie_medicine.dart';
import 'package:palliative_care/ui/categories/cancer.dart';
import 'package:palliative_care/ui/categories/heart.dart';
import 'package:palliative_care/ui/categories/mentalHealth.dart';
import 'package:palliative_care/ui/categories/pysical_health.dart';
import 'package:palliative_care/ui/categories/sokari.dart';

import '../../widgets/category_box.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
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
                  children:  [

                    /// TO DO => use InkWell for make it clickable
/*'      /heartScreen':(context) => const HeartScreen(),
        '/sokariScreen':(context) => const SokariScreen(),
        '/pycsicalScreen':(context) => const PysicalHealth(),
        '/alternativScreen':(context) => const AlternativeScreen(),
        '/mentalScreen':(context) => const MentalHealth(),
        '/cancerScreen':(context) => const CancerScreen(*/
                    InkWell(
                      onTap: (){
                        Get.to(const HeartScreen());
                      },
                      child: const CategotyBox(
                        imageName: 'images/heart.jpeg',
                        categoryName: 'القلب',
                      ),

                    ),
                    InkWell(
                      onTap: (){
                        Get.to(const SokariScreen());
                      },
                      child: const CategotyBox(
                        imageName: 'images/sokari.jpg',
                        categoryName: 'السكري',
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(const PysicalHealth());
                      },
                      child: const CategotyBox(
                        imageName: 'images/fitness.jpg',
                        categoryName: 'الصحة البدنية',
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(const AlternativeScreen());
                      },
                      child: const CategotyBox(
                        imageName: 'images/green.jpg',
                        categoryName: 'الطب البديل',
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(const CancerScreen());
                      },
                      child: const CategotyBox(
                        imageName: 'images/cancer.jpg',
                        categoryName: 'السرطان',
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(const MentalHealth());
                      },
                      child: const CategotyBox(
                        imageName: 'images/mind.jpeg',
                        categoryName: 'الصحة النفسية',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

    );
  }
}
