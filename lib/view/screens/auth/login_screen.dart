

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_project_final/core/themes.dart';
import 'package:grad_project_final/view/screens/auth/registrate_screen.dart';
import 'package:grad_project_final/view/shared/constant.dart';
import 'package:grad_project_final/view_model/provider/auth_provider.dart';
import 'package:grad_project_final/view_model/provider/theme_provider.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../view_model/provider/control_provider.dart';
import '../../../view_model/provider/password_provider.dart';
import '../home_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _email = TextEditingController();

  var _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return Consumer<AuthProvider>(builder:(context,provider,child){
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.22,),
              Text('Sign in',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 50,right: 50,top: 20),
                        child: EmailOrNameText(_email,
                            'Please enter your email',
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}',
                            'You have to enter a valid Email',
                            TextInputType.emailAddress,
                            Icons.email,
                            "Email")
                    ),
                    SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.only(left: 50,right: 50),
                        child: PasswordText(_password),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.01,),

              Padding(padding: EdgeInsets.only(left: 60,right: 60),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*.06,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 151, 136, 1),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      if(formkey.currentState!.validate()){
                        Provider.of<AuthProvider>(context,listen: false).login(_email.text, _password.text);
                        Provider.of<ControlProvider>(context,listen: false).currentScreen = HomeScreen();
                      }
                      setData();
                    },
                    child: Text('Sign in',style: TextStyle(fontSize: 20),),
                  ),
                ),),
              SizedBox(height: 10,),
              Text('Or',style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              GestureDetector(
                  onTap: (){
                    Provider.of<AuthProvider>(context,listen: false).googleSignInMethod();
                  },
                  child: Container(
                    width:  MediaQuery.of(context).size.width*.72,
                    height: MediaQuery.of(context).size.height*.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: .5,
                        color:Themes.isDarkMode(context) ? Colors.white: Colors.black,
                      ),
                      color: Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ?Colors.black: Colors.blueGrey[50]  ,
                      boxShadow: [
                        BoxShadow(
                          color:Themes.isDarkMode(context) ? Colors.white: Colors.black,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/google.png',height: 20,),
                        SizedBox(width: 10,),
                        Text('Continue with Google',style: TextStyle(color: Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Colors.black,),),
                      ],
                    ),
                  )
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("If you have an account?",style: TextStyle(fontSize: 18),),
                  TextButton(onPressed: (){
                    Get.offAll(RegisterScreen());
                  }, child: Text('Sign up',style: TextStyle(fontSize: 18)))
                ],
              ),
            ],
          ),
        ),
      );
    } );
  }
}
setData()async{
  SharedPreferences prefrence = await SharedPreferences.getInstance();
  prefrence.getString("uid");
}
