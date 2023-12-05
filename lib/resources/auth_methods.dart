import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instragram_flutter/resources/strorage_material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Storage Methods is a class to storage data or store files
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        print(cred.user!.uid);

        // add user to the database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        });
        // another way
        // await _firestore.collection('users').add({
        //   'username':username,
        //   'uid' : cred.user!.uid,
        //   'email' : email,
        //   'bio' : bio,
        //   'followers' : [],
        //   'following' : [],}
        // );
        res = 'Success';
      }

      //  on FirebaseAuthException catch (err) {
      //   if (err.code == 'invalid-email') {
      //     res = 'The email is badly formatted';
      //   } else if (err.code == 'weak-password') {
      //     res = "Password should be at least 6 characters";
      //
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // ---> Login Function

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
