import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Firebase/fb_response.dart';
import '../Model/postModel.dart';


class FbAuthControllerImp extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? selectedItem;


  late TextEditingController title;
  late TextEditingController subject;
  late TextEditingController selectedCategory;


  @override
  void onInit() {
    getData();
    title = TextEditingController();
    subject = TextEditingController();
    selectedCategory = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    subject.dispose();
    selectedCategory.dispose();

    super.dispose();
  }

  Future<FbResponse> create(PostModel post) async {
    return await _firestore
        .collection('Post')
        .add(post.toMap())
        .then((value) => FbResponse(message: 'Success', success: true))
        .catchError((error) => FbResponse(message: 'Failed', success: false));
  }

  void getData() async {
    final post = await _firestore.collection('Post').get();
    for (var data in post.docs) {
      print(data.data());
    }
  }
}


