import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:grad_project_final/view_model/provider/control_provider.dart';
import 'package:provider/provider.dart';

import '../../view_model/provider/profile_provider.dart';
class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context,listen: false).GetUser();
    return Consumer<ControlProvider>(builder: (context,provider,child){
      return Scaffold(
          body: provider.currentScreen,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(

              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
                child: GNav(

                  gap: 8,

                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                  duration: Duration(microseconds: 400),
                  tabBackgroundColor: Color.fromRGBO(28, 94, 32,1),

                  tabs: [
                    GButton(
                      icon: Icons.home,

                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.search,

                      text: 'Search',
                    ),
                    GButton(
                      icon: Icons.person,

                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: provider.currentIndex,
                  onTabChange: (index){
                    provider.changeScreen(index);
                  },
                ),
              ),
            ),
          ));
    });
  }
}
