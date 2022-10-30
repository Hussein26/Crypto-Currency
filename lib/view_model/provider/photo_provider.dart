import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';

class PhotoProvider extends ChangeNotifier{

  final ImagePicker _picker =ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  void getImage(ImageSource src) async{
    final XFile? pickedImageFile = await _picker.pickImage(source: src,
    imageQuality: 50, maxHeight: 300,maxWidth: 300
    );
    if(pickedImageFile != null){
      File pickImage = File(pickedImageFile.path);
      await storage.ref().child(auth.currentUser!.uid + ".jpg").putFile(pickImage);
      final url = await storage.ref()
      .child(auth.currentUser!.uid + '.jpg')
      .getDownloadURL();
      await firestore.collection("users").doc(auth.currentUser!.uid).update({
        "photoURL" : url
      });
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("image", url);
      notifyListeners();
    }
    else{
      print("image not found");
    }
  }
}