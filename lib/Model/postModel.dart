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
<<<<<<< HEAD
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

=======
    this.id,
    this.title,
    this.body,
    this.userId,
    this.image,
    this.category,
  );

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
    image = json['image'];
    category = json['category'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['userId'] = this.userId;
    data['image'] = this.image;
    data['category'] = this.category;
    return data;
    // return {
    //   'id': id,
    //   'title': title,
    //   'body': body,
    //   'userId': userId,
    //   'image': image,
    // };
>>>>>>> e6289d499ba0d18669e16fe4aaba0ee706ea5b4d
  }
}
