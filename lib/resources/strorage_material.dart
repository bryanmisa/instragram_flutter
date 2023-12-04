import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // adding image to Firebase Storage
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    Reference ref =
        // childName will be the name of the folder it will be uploaded to
        // __auth.currentUser!.uid is under the instance of the currentUser
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

    // when Uint8List is used, you have to use .putData()
    // UploadTask can be used a Future by adding .whenComplete(() => null)
    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }
}
