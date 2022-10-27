
import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier{
  bool visible = true;


  changeVisibilty(){
    visible ? visible = false : visible = true;
    notifyListeners();
  }


}