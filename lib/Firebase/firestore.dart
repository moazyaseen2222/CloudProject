import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/userModel.dart';

class FirestoreController {
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('users');

  Future<bool> addToFirestore({required UserModel userModel}) async {
    return await  _collectionReference
        .doc(userModel.id)
        .set(userModel.toJson())
        .then((value) {
      return true;
    }).catchError((onError) {
      print('Error adding document');
      print(onError);
      return false;
    });
  }

  Future<bool> update({required UserModel userModel}) async {
    await _collectionReference
        .doc(userModel.id)
        .update(userModel.toJson())
        .then((value) => true)
        .catchError((onError) => false);
    return false;
  }

  Future<bool> delete({required String path}) async {
    await _collectionReference
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((onError) => false);
    return false;
  }

  Stream<QuerySnapshot> getData() async* {
    yield* _collectionReference.snapshots();
  }
}



