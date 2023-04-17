import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/userModel.dart';
import 'check_auth_and_active_email.dart';
import 'firestore.dart';

class FbAuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late UserCredential userCredential ;
  late UserModel userModel ;




  Future<bool> createAccount(BuildContext context,  {required String email, required String password}) async {
    try {
      userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      CheckAuth().checkActiveEmail( context,userCredential: userCredential);


      print('userCredential.user!.uid: ${userCredential.user!.uid}');

      return true;
    } on FirebaseAuthException catch (e) {
      CheckAuth().controllerErrorCode(context,e);
    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<bool> signIn(BuildContext context,{required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return await CheckAuth().checkActiveEmail(context,userCredential: userCredential);
    } on FirebaseAuthException catch (e) {
      CheckAuth().controllerErrorCode(context,e);
    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<void> singOut() async {
    await _firebaseAuth.signOut();
  }

  Future<bool> forgetPassword(BuildContext context,{required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      CheckAuth().controllerErrorCode(context,e);
    } catch (e) {
      print(e);
    }
    return false;
  }

  bool get isLogin => _firebaseAuth.currentUser != null;

  bool get isCheckUser => _firebaseAuth.currentUser!.displayName != null && _firebaseAuth.currentUser!.photoURL != null && _firebaseAuth.currentUser!.emailVerified == true;

  String get getUid => _firebaseAuth.currentUser!.uid;

 User? get getUser => _firebaseAuth.currentUser;

  Future saveUser(users) async {
    await FirestoreController().addToFirestore( userModel: users);
  }

  Future<bool> updateName(BuildContext context, {required String name}) async {
    try {
      await _firebaseAuth.currentUser!.updateDisplayName (name);
      print( _firebaseAuth.currentUser!.displayName);

      return true;
    } on FirebaseAuthException catch (e) {
      CheckAuth().controllerErrorCode(context,e);
    } catch (e) {
      print(e);
    }
    return false;
  }

}


