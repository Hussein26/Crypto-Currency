import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:grad_project_final/view/widget/control_view.dart';
import 'package:grad_project_final/view_model/provider/auth_provider.dart';
import 'package:grad_project_final/view_model/provider/control_provider.dart';
import 'package:grad_project_final/view_model/provider/details_provider.dart';
import 'package:grad_project_final/view_model/provider/home_provider.dart';
import 'package:grad_project_final/view_model/provider/password_provider.dart';
import 'package:grad_project_final/view_model/provider/search_provider.dart';

import 'package:grad_project_final/view_model/provider/theme_provider.dart';
import 'package:provider/provider.dart';



import 'core/themes.dart';

void main() async {
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
    ] ,child: MyApp(),)
  );
}


class MyApp extends StatelessWidget {

  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context,listen: false).getThemeModeFromSharedPref();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme:  Themes.darkTheme,

      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      home: ControlView(),
    );
  }
}

