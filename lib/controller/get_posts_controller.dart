import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:palliative_care/Model/postModel.dart';

FirebaseFirestore firebase = FirebaseFirestore.instance;

class GetPostsController extends GetxController {
  /// FOR PHYSICAL POSTS SECTION.

  Stream<QuerySnapshot<PostModel>> getPhysicalPosts() async* {
    yield* firebase
        .collection('Posts')
        .where('category', isEqualTo: 'الصحة البدنية')
        .withConverter<PostModel>(
          fromFirestore: (snapshot, options) =>
              PostModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toMap(),
        )
        .snapshots();
  }

  /// FOR HEART POSTS SECTION
  Stream<QuerySnapshot<PostModel>> getHeartPosts() async* {
    yield* firebase
        .collection('Posts')
        .where('category', isEqualTo: 'القلب')
        .withConverter<PostModel>(
          fromFirestore: (snapshot, options) =>
              PostModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toMap(),
        )
        .snapshots();
  }

  /// FOR SOKARI POSTS SECTION
  Stream<QuerySnapshot<PostModel>> getSokariPosts() async* {
    yield* firebase
        .collection('Posts')
        .where('category', isEqualTo: 'السكري')
        .withConverter<PostModel>(
          fromFirestore: (snapshot, options) =>
              PostModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toMap(),
        )
        .snapshots();
  }

  /// FOR ALTERNATIVE POSTS SECTION
  Stream<QuerySnapshot<PostModel>> getAlternativePosts() async* {
    yield* firebase
        .collection('Posts')
        .where('category', isEqualTo: 'الطب البديل')
        .withConverter<PostModel>(
          fromFirestore: (snapshot, options) =>
              PostModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toMap(),
        )
        .snapshots();
  }

  /// FOR MENTAL POSTS SECTION
  Stream<QuerySnapshot<PostModel>> getMentalPosts() async* {
    yield* firebase
        .collection('Posts')
        .where('category', isEqualTo: 'الصحة النفسية')
        .withConverter<PostModel>(
          fromFirestore: (snapshot, options) =>
              PostModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toMap(),
        )
        .snapshots();
  }

  /// FOR CANCER POSTS SECTION
  Stream<QuerySnapshot<PostModel>> getCancerPosts() async* {
    yield* firebase
        .collection('Posts')
        .where('category', isEqualTo: 'السرطان')
        .withConverter<PostModel>(
          fromFirestore: (snapshot, options) =>
              PostModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toMap(),
        )
        .snapshots();
  }
}
