import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../model/user_model.dart';

class ProfileProvider extends ChangeNotifier{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel userData = UserModel(displayName: "", email: "",photoURL: "", userId: "");
  GetUser() async {
    await _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      userData = UserModel.fromJson(value.data()!);
      notifyListeners();
    });
  }
}