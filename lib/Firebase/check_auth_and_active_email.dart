import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class CheckAuth{
 // final FirebaseAuth  _firebaseAuth = FirebaseAuth.instance;

  Future<bool> checkActiveEmail(BuildContext context, {required UserCredential userCredential})async{
    if(userCredential.user!.emailVerified == false){
      userCredential.user!.sendEmailVerification();
      showSnackBar(context: context, content:'Please activate the email',error:false);
      return false;
    }

    return true;
  }

  void controllerErrorCode(BuildContext context,  FirebaseAuthException authException) {
    switch (authException.code) {
      case 'email-already-in-use':
        showSnackBar(context: context, content:'Email already in use',error:true);
        break;

      case 'invalid-email':
        showSnackBar(context: context, content:'Invalid Email',error:true);
        break;

      case 'operation-not-allowed':
        showSnackBar(context: context, content:'Operation not allowed',error:true);
        break;

      case 'weak-password':
        showSnackBar(context: context, content:'Weak password',error:true);
        break;

      case 'user-not-found':
        showSnackBar(context: context, content:'User not found',error:true);
        break;
      case 'wrong-password':
        showSnackBar(context: context, content:'Wrong password',error:true);
        break;

      case 'network-request-failed':
         showSnackBar(context: context, content:'Network request failed',error:true);
        break;

    default:
      showSnackBar(context: context, content:'Error',error:true);
    //  break;

    }
  }

  void showSnackBar({required BuildContext context, required String content, required bool error}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: error ? Colors.red : Colors.green,
      ),
    );
  }




}


