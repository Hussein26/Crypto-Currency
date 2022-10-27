import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:grad_project_final/view/screens/auth/login_screen.dart';
import 'package:grad_project_final/view/widget/bottom_nav_bar_screen.dart';
import 'package:provider/provider.dart';


import '../../view_model/provider/control_provider.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ControlProvider>(builder: (context, provider, child) {
      return provider.uId == null ? LoginScreen() : BottomNavScreen();

    });
  }
}
