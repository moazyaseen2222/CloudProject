import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String id;
  final String postId;
  final String userId;
  final String comment;
  final Timestamp timestamp = Timestamp.now();

  Comment({
    required this.id,
    required this.postId,
    required this.userId,
    required this.comment, required timestamp,
  });

  factory Comment.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Comment(
      id: doc.id,
      postId: data['postId'],
      userId: data['userId'] ,
      comment: data['comment'] ,
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toFirestore() => {
    'postId': postId,
    'userId': userId,
    'comment': comment,
    'timestamp': timestamp,
  };
}

