// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../views/sign_in/sign_in_page_widget.dart';
import '../../widgets/show_snackbar.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Signed Up");
      return result.user;
    } catch (e) {
      print("Error signing up: $e");
      return null;
    }
  }

  Future<User?> signIn(
      String email, String password, BuildContext context) async {
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Signed IN');
      fireStore.collection('users').doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": userCredential.user!.email,
      });

      user = userCredential.user;

      showCustomSnackBar(context, "Welcome $email");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showCustomSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showCustomSnackBar(context, 'Wrong password provided.');
      }
    }

    Future<void> signOut() async {
      await auth.signOut();
    }
  }
}
