import 'package:cloud_firestore/cloud_firestore.dart';

class LikeModel {
  final String postId;
  final String userId;

  LikeModel({
    required this.postId,
    required this.userId,
  });

  factory LikeModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return LikeModel(
      postId: data['postId'],
      userId: data['userId'] ,
    );
  }

  Map<String, dynamic> toFirestore() => {
    'postId': postId,
    'userId': userId,
  };
}
