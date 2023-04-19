import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/postModel.dart';

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test firestore'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('posts').snapshots(),
            builder: (context, snapshot) {

              List<Widget> postsList = [];
              // List<Widget> postWidgetList =
              // postList.map((post) => PostWidget(post: post)).toList();
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SpinKitCircle(
                    color: Colors.green.shade400,
                  ),
                );
              }

              final posts = snapshot.data!.docs;
              for (var post in posts) {
                final title = post.get('title');
                final subject = post.get('body');
                final category = post.get('category');

                // final NewPost = PostModel(
                //     0.toString(), title, subject, 1.toString(), '', category
                   final postsss = Text('title : $title,   body: $subject,  category: $category');
                   // );
                postsList.add(postsss);
              }
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        '********** Posts Data **********',
                        style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: postsList,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
