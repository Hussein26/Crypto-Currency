import 'package:flutter/material.dart';
import 'package:grad_project_final/view/screens/home_screen.dart';
import 'package:grad_project_final/view/screens/profile_screen.dart';
import 'package:grad_project_final/view/screens/search_screen.dart';
import 'package:grad_project_final/view_model/provider/control_provider.dart';
import 'package:provider/provider.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import '../../core/themes.dart';



class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomNavScreen> {
  late PageController _pageController;
 int Sindex = 0;
  @override

  void onButtonPressed(int index) {
    setState(() {
        Sindex = index;
    });
    _pageController.animateToPage(Sindex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: Sindex);
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar: SlidingClippedNavBar(
          backgroundColor: Themes.isDarkMode(context) ? Colors.black : Colors.white,
          onButtonPressed:onButtonPressed,
          iconSize: 30,
          activeColor:  Colors.green,
          selectedIndex:  Sindex,
          barItems: <BarItem>[
            BarItem(
              icon: Icons.home,
              title: 'Home',
            ),
            BarItem(
              icon: Icons.search_rounded,
              title: 'Search',
            ),
            BarItem(
              icon: Icons.person,
              title: 'Profile',
            ),
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            HomeScreen(),
            SearchScreen(),
            ProfileScreen(),
          ],
        ),

    );
  }
}