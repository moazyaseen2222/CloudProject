import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  late String id;
  late String title;
  late String body;
  late String category;
  late String userId;
  late String image;
  late Timestamp createdAt ;

  PostModel(
     this.id,
     this.title,
     this.body,
     this.userId,
     this.image,
     this.category,
     this.createdAt,
  );

  factory PostModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PostModel(
      doc.id,
      data['title'],
      data['body'],
      data['userId'],
      data['image'],
      data['category'],
      data['createdAt']
    );
  }

   Map<String, dynamic> toMap() {
     final Map<String, dynamic> data = <String, dynamic>{};
     data['id'] = id;
     data['title'] = title;
     data['body'] = body;
     data['userId'] = userId;
     data['image'] = image;
     data['category'] = category;
      data['createdAt'] = createdAt;
     return data;

  }

}


