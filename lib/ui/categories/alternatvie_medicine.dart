import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palliative_care/controller/get_posts_controller.dart';
import 'package:palliative_care/ui/categories/specific_post.dart';
import '../../Model/postModel.dart';
import '../../controller/APController.dart';
import '../../widgets/readMore.dart';

class AlternativeScreen extends StatefulWidget {
  const AlternativeScreen({Key? key}) : super(key: key);

  @override
  State<AlternativeScreen> createState() => _AlternativeScreenState();
}

class _AlternativeScreenState extends State<AlternativeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'الطب البديل',
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.green.shade400,
        ),
        body: StreamBuilder<QuerySnapshot<PostModel>>(
          stream: GetPostsController().getAlternativePosts(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: SpinKitCircle(color: Colors.green.shade400));
                } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        onTap: () {
                          Get.to(SpecificPost());
                        },
                        title: Text(
                          snapshot.data!.docs[index].data().title,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 20, color: Colors.white),
                        ),
                        subtitle: Text(
                          snapshot.data!.docs[index].data().body,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(child: Text('NO Alternativeposts'));
                }
              },
            );
          },
        ));
  }
}
