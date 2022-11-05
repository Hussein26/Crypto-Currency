import 'package:flutter/material.dart';

import 'package:grad_project_final/view/screens/auth/login_screen.dart';
import 'package:grad_project_final/view/widget/bottom_nav_bar_screen.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ControlView extends StatefulWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  State<ControlView> createState() => _ControlViewState();
}

class _ControlViewState extends State<ControlView> {
  @override
  String? uid;
  getData()async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  uid = preferences.getString("uid");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return uid == null ?LoginScreen() : BottomNavScreen();
  }
}

