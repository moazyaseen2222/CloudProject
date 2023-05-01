import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Model/likeModel.dart';
import '../Model/postModel.dart';
import '../Model/userModel.dart';

class FbGetPostController extends GetxController {
  RxBool isLiked = false.obs;
  bool get liked => isLiked.value;
  set liked(bool value) => isLiked.value = value;

  // final RxList likes = [].obs;
  late List<UserModel> likes = List<UserModel>.empty(growable: true).obs;
  int get likeCounts => likes.length;
 // set likeCounts(int value) => likes.length = value;


  var posts = List<PostModel>.empty(growable: true).obs;
  var Alternativeposts = List<PostModel>.empty(growable: true).obs;
  late List<UserModel> user = List<UserModel>.empty(growable: true).obs;

  @override
  void onInit() async {
    //  getPost();
    super.onInit();
    getPosts();
  }

  void getPosts() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Post').get().then((value) {
      value.docs.map((doc) => getPostAuth(id: PostModel.fromSnapshot(doc).id));
      return value;
    });
    List<PostModel> postList =
        snapshot.docs.map((doc) => PostModel.fromSnapshot(doc)).toList();
    posts.assignAll(postList);

    update();
  }
  /// NEW FUNCTION
  // void getAlternativePosts() async {
  //   QuerySnapshot snapshot =
  //   await FirebaseFirestore.instance.collection('Posts').where('category', isEqualTo: 'الطب البديل').get().then((value) {
  //     value.docs.map((doc) => getPostAuth(id: PostModel.fromSnapshot(doc).id));
  //     return value;
  //   });
  //   List<PostModel> alternativePosts =
  //   snapshot.docs.map((doc) => PostModel.fromSnapshot(doc)).toList();
  //   Alternativeposts.assignAll(alternativePosts);
  //
  //   update();
  // }
  ///

  getPostAuth({required id}) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(id).get();

    user.add(UserModel.fromSnapshot(snapshot));
  //  print(UserModel.fromSnapshot(snapshot).email);
    update();
  }

  Future<void> addComment(String postId, String comment) {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .add({
      'comment': comment,
      'timestamp': Timestamp.now(),
    }).catchError((error) => print('Failed to add comment: $error'));
  }

  Stream<int> commentCount(String postId) {
    return FirebaseFirestore.instance
        .collection('Post')
        .doc(postId)
        .collection('comments')
        .snapshots()
        .map((snapshot) => snapshot.size);
  }


  Future<void> removeLike(String postId) {
    return FirebaseFirestore.instance
        .collection('Posts')
        .doc(postId)
        .update({'likes': FieldValue.increment(-1)}).catchError(
            (error) => print('Failed to remove like: $error'));
  }

     likeCount(String postId)async {
       DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('likes').doc(postId).collection(postId).doc(postId).get();
       if(snapshot.exists) {
      //  likeCounts = snapshot.data()!.length;
       }

  }

  Future<bool> addLikePost(LikeModel likeModel) async {
    final likeRef = FirebaseFirestore.instance
        .collection('likes')
        .doc(likeModel.postId);
try {
    late bool check;
    await likeRef.get().then((doc) {
      doc.exists ? check = true : check = false;
    });



    if (check == false) {
      likeRef.set(likeModel.toFirestore());
    }
    liked = check;
    return check;
  } catch (e) {
    print(e);
    return false;
  }
  }


}
