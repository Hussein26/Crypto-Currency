import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grad_project_final/model/user_model.dart';
import 'package:grad_project_final/view/screens/auth/login_screen.dart';
import 'package:grad_project_final/view/widget/bottom_nav_bar_screen.dart';
import 'package:grad_project_final/view/widget/control_view.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser("", user);
      Get.offAll(BottomNavScreen());
    });
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(BottomNavScreen());
    } catch (e) {
      Get.snackbar(
          "Login Error",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    await _auth.signOut();
    Get.offAll(LoginScreen());
  }

  void register(String name, String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
          saveUser(name, user);
    });
    Get.offAll(BottomNavScreen());
  }

  saveUser(String name, UserCredential user) async {
    UserModel userModel = UserModel(
        name: name,
        email: user.user!.email!,
        image: "",
        userId: user.user!.uid);
    await _firestore
        .collection("users")
        .doc(user.user!.uid)
        .set(userModel.toJson());
    print("//////////");
  }
}
