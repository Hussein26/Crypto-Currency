import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grad_project_final/view/widget/control_view.dart';
import 'package:grad_project_final/view_model/provider/auth_provider.dart';
import 'package:grad_project_final/view_model/provider/control_provider.dart';
import 'package:grad_project_final/view_model/provider/details_provider.dart';
import 'package:grad_project_final/view_model/provider/home_provider.dart';
import 'package:grad_project_final/view_model/provider/password_provider.dart';
import 'package:grad_project_final/view_model/provider/photo_provider.dart';
import 'package:grad_project_final/view_model/provider/profile_provider.dart';
import 'package:grad_project_final/view_model/provider/search_provider.dart';
import 'package:grad_project_final/view_model/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'core/themes.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> HomeProvider()),
      ChangeNotifierProvider(create: (context)=> DetailsProvider()),
      ChangeNotifierProvider(create: (context)=> ControlProvider()),
      ChangeNotifierProvider(create: (context)=> PasswordProvider()),
      ChangeNotifierProvider(create: (context)=> SearchProvider()),
      ChangeNotifierProvider(create: (context)=> ThemeProvider()),
      ChangeNotifierProvider(create: (context)=> AuthProvider()),
      ChangeNotifierProvider(create: (context)=> PhotoProvider()),
      ChangeNotifierProvider(create: (context)=> ProfileProvider()),

    ] ,child: MyApp(),)
  );

}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context,listen: false).getThemeModeFromSharedPref();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme:  Themes.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      home: ControlView()
    );
  }
}

