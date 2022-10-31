import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_project_final/view/screens/home_screen.dart';
import 'package:grad_project_final/view_model/provider/auth_provider.dart';
import 'package:grad_project_final/view_model/provider/control_provider.dart';
import 'package:grad_project_final/view_model/provider/photo_provider.dart';
import 'package:grad_project_final/view_model/provider/profile_provider.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/themes.dart';
import '../../view_model/provider/theme_provider.dart';

class ProfileScreen extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  String? username;
  String? email;
  String? ImageUrl;

  getNameAndEmailAndImage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("name");
      email = preferences.getString("email");
      ImageUrl = preferences.getString("image");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getNameAndEmailAndImage();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context,listen: false).GetUser();
    var userProvider = Provider.of<ProfileProvider>(context);
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
              child: CircleAvatar(
            backgroundImage: NetworkImage(userProvider.userData.photoURL == ""
                ? "https://pasrc.princeton.edu/sites/g/files/toruqf431/files/styles/freeform_750w/public/2021-03/blank-profile-picture-973460_1280.jpg?itok=QzRqRVu8"
                : userProvider.userData.photoURL),
            radius: 90,
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height * .015,
          ),
          Text(
            userProvider.userData.displayName ,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
           userProvider.userData.email,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .005,
          ),
          Row(

            children: [
              Container(
                width: MediaQuery.of(context).size.width * .48,
                height: MediaQuery.of(context).size.height * .1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Themes.isDarkMode(context)
                              ? Color(0xff151f2c)
                              : Colors.blueGrey,
                        ),
                        onPressed: () {
                          Provider.of<PhotoProvider>(context, listen: false)
                              .getImage(ImageSource.gallery);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("From Gallery",style: TextStyle(fontSize: 11),),
                            Icon(Icons.image_outlined)
                          ],
                        )),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .45,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 7.5),
                  child: Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Themes.isDarkMode(context)
                              ? Color(0xff151f2c)
                              : Colors.blueGrey,
                        ),
                        onPressed: () {
                          Provider.of<PhotoProvider>(context, listen: false)
                              .getImage(ImageSource.camera);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text("Add Photo",style: TextStyle(fontSize: 11),), Icon(Icons.camera_alt)],
                        )),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .05,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Themes.isDarkMode(context)
                        ? Color(0xff151f2c)
                        : Colors.blueGrey,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: Colors.grey,
                              title: Text(
                                "Change Theme",
                                style: TextStyle(color: Colors.white),
                              ),
                              actions: [
                                Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.white),
                                          onPressed: () {
                                            Provider.of<ThemeProvider>(context,
                                                    listen: false)
                                                .saveThemeModeToSharedPref(
                                                    ThemeMode.system);
                                            Get.back();
                                          },
                                          child: Text(
                                            'System',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.white),
                                          onPressed: () {
                                            Provider.of<ThemeProvider>(context,
                                                    listen: false)
                                                .saveThemeModeToSharedPref(
                                                    ThemeMode.light);
                                            Get.back();
                                          },
                                          child: Text(
                                            'Light',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.black),
                                          onPressed: () {
                                            Provider.of<ThemeProvider>(context,
                                                    listen: false)
                                                .saveThemeModeToSharedPref(
                                                    ThemeMode.dark);
                                            Get.back();
                                          },
                                          child: Text(
                                            'Dark',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Change Theme',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .05,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Themes.isDarkMode(context)
                        ? Color(0xff151f2c)
                        : Colors.blueGrey,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                                backgroundColor: Colors.grey,
                                title: Text(
                                  "Change Language",
                                  style: TextStyle(color: Colors.white),
                                ),
                                actions: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.language,
                                              color: Colors.blue,
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'English',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.language,
                                              color: Colors.blue,
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Arabic',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ]));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Change Language',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .05,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Themes.isDarkMode(context)
                        ? Color(0xff151f2c)
                        : Colors.blueGrey,
                  ),
                  onPressed: () {
                    provider.signOut();
                    Provider.of<ControlProvider>(context, listen: false)
                        .currentScreen = HomeScreen();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      Icon(Icons.logout)
                    ],
                  )),
            ),
          )
        ],
      ));
    });
  }
}
