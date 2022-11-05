import 'package:flutter/material.dart';
import 'package:grad_project_final/view/screens/home_screen.dart';
import 'package:grad_project_final/view/screens/profile_screen.dart';
import 'package:grad_project_final/view/screens/search_screen.dart';

import 'package:provider/provider.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import '../../core/themes.dart';



class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomNavScreen> {
 int Sindex = 0;
 PageController _pageController =PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: PageView(
          onPageChanged: (newIndex){
            setState(() {
              Sindex = newIndex;
            });
          },
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          children: [
            HomeScreen(),
            SearchScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: SlidingClippedNavBar(
          selectedIndex:  Sindex,
          backgroundColor: Themes.isDarkMode(context) ? Colors.black : Color.fromRGBO(235,239,242,1),
          onButtonPressed:(newIndex){
            setState(() {
              Sindex = newIndex;
              _pageController.animateToPage(Sindex,
                  duration: Duration(milliseconds: 400), curve: Curves.easeOutQuad);
            });
          },

          iconSize: 30,
          activeColor:  Colors.green,
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


    );
  }
}