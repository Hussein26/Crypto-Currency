import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


import '../../view/screens/home_screen.dart';
import '../../view/screens/profile_screen.dart';
import '../../view/screens/search_screen.dart';

class ControlProvider extends ChangeNotifier{
  int currentIndex = 0;
  Widget currentScreen = HomeScreen();
  void changeScreen(int index){
    switch (index){
      case 0:
        currentScreen= HomeScreen();
        break;
      case 1:
        currentScreen = SearchScreen();
        break;
      case 2:
        currentScreen = ProfileScreen();
        break;
    }
    notifyListeners();
  }
  FirebaseAuth _auth =FirebaseAuth.instance;
  String? uId;
  ControlProvider(){
    getAuth;
  }
  void getAuth(){
    uId = _auth.currentUser?.uid?? null;
    notifyListeners();
  }
}