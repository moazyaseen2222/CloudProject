import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palliative_care/Model/postModel.dart';
import 'package:palliative_care/ui/categories/specific_post.dart';

import '../../controller/get_posts_controller.dart';


class PysicalHealth extends StatefulWidget {
  const PysicalHealth({Key? key}) : super(key: key);

  @override
  State<PysicalHealth> createState() => _PysicalHealthState();
}

class _PysicalHealthState extends State<PysicalHealth> {
  @override
  Widget build(BuildContext context) {
    //GetPostsController controller = Get.put(GetPostsController());


    return Scaffold(
        appBar: AppBar(
          title: Text(
            'الصحة البدنية',
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.green.shade400,
        ),
        body: StreamBuilder<QuerySnapshot<PostModel>>(
          stream: GetPostsController().getPhysicalPosts(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
               if(snapshot.connectionState == ConnectionState.waiting){
                 return Center(child: SpinKitCircle(color: Colors.green.shade400));
               }else if(snapshot.hasData && snapshot.data!.docs.isNotEmpty){
                 return  Padding(
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

               }else{
                 return Center(child: Text('NO POSTS'));
               }
              },
            );
          },
        ));
  }
}

/////////////////

// Firestore.instance.collection('posts').where('category', isEqualTo: 'الصحة البدنية').getDocuments().then((QuerySnapshot querySnapshot) {
// querySnapshot.documents.forEach((doc) {
// print('title: ${doc.data['title']}');
// print('body: ${doc.data['body']}');
// // Use the data as needed
// });
// });
