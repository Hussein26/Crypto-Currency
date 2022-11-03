import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../view/screens/auth/login_screen.dart';
import '../../view/screens/home_screen.dart';
import '../../view/screens/profile_screen.dart';
import '../../view/screens/search_screen.dart';
import '../../view/widget/bottom_nav_bar_screen.dart';

class ControlProvider extends ChangeNotifier{
  int currentIndex = 0;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Widget currentScreen = HomeScreen();
  // void changeScreen(int index){
  //   switch (index){
  //     case 0:
  //       currentScreen= HomeScreen();
  //       break;
  //     case 1:
  //       currentScreen = SearchScreen();
  //       break;
  //     case 2:
  //       currentScreen = ProfileScreen();
  //       break;
  //   }
  //   notifyListeners();
  // }

ChangeScreen(int index){
  HomeScreen();
  SearchScreen();
  ProfileScreen();
}
}