//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../Model/postModel.dart';
//
// class Test extends StatelessWidget {
//   Test({Key? key}) : super(key: key);
//
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Test firestore'),
//       ),
//       body: Center(child: ElevatedButton(onPressed: (){
//         FirebaseFirestore.instance.collection('posts').where('category', isEqualTo: 'الصحة البدنية').get().then((QuerySnapshot querySnapshot) {
//           querySnapshot.docs.forEach((doc) {
//             print('title: ${doc.data.toString()}');
//             print('body: ${doc.data.toString()}');
// // Use the data as needed
//           });
//         });
//       }, child: Text('Test'),),)
//       // SingleChildScrollView(
//       //   child: Container(
//       //     child: StreamBuilder<QuerySnapshot>(
//       //       stream: _firestore.collection('posts').snapshots(),
//       //       builder: (context, snapshot) {
//       //
//       //         List<Widget> postsList = [];
//       //         // List<Widget> postWidgetList =
//       //         // postList.map((post) => PostWidget(post: post)).toList();
//       //         if (snapshot.connectionState == ConnectionState.waiting) {
//       //           return Center(
//       //             child: SpinKitCircle(
//       //               color: Colors.green.shade400,
//       //             ),
//       //           );
//       //         }
//       //
//       //         final posts = snapshot.data!.docs;
//       //         for (var post in posts) {
//       //           final title = post.get('title');
//       //           final subject = post.get('body');
//       //           final category = post.get('category');
//       //
//       //           // final NewPost = PostModel(
//       //           //     0.toString(), title, subject, 1.toString(), '', category
//       //              final postsss = Text('title : $title,   body: $subject,  category: $category');
//       //              // );
//       //           postsList.add(postsss);
//       //         }
//       //         return Padding(
//       //           padding: const EdgeInsets.all(10.0),
//       //           child: Column(
//       //             mainAxisAlignment: MainAxisAlignment.start,
//       //             crossAxisAlignment: CrossAxisAlignment.start,
//       //             children: [
//       //               SizedBox(height: 30),
//       //               Center(
//       //                 child: Text(
//       //                   '********** Posts Data **********',
//       //                   style: GoogleFonts.aBeeZee(
//       //                       fontWeight: FontWeight.bold, fontSize: 20),
//       //                 ),
//       //               ),
//       //               SizedBox(height: 20),
//       //               Column(
//       //                 children: postsList,
//       //               )
//       //             ],
//       //           ),
//       //         );
//       //       },
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance
      //       .collection('posts')
      //       .where('category', isEqualTo: 'الصحة البدنية')
      //       .snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     print(' posts count : ${snapshot.data?.docs.length}');
      //     if (!snapshot.hasData) return CircularProgressIndicator();
      //     return ListView.builder(
      //       itemCount: snapshot.data?.docs.length,
      //       itemBuilder: (context, index) {
      //         return ListTile(
      //           //title: Text('${snapshot.data!.docs[index].data.title}'),
      //           subtitle: Text('Test Subtitle'),
      //         );
      //       },
      //
      //          // _buildPostListItem(context, snapshot.data!.docs[index]),
      //     );
      //
      //   },
      // ),
    );
  }

// Widget _buildPostListItem(BuildContext context, DocumentSnapshot document ) {
//   return ListTile(
//     title: Text(document.data()!['title']),
//     subtitle: Text(document.data()!['body']),
//   );
// }
}
