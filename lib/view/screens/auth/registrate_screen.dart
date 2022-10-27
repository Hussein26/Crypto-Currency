
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grad_project_final/view_model/provider/auth_provider.dart';

import 'package:provider/provider.dart';

import '../../../view_model/provider/password_provider.dart';
import 'login_screen.dart';




class RegisterScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  var _email = TextEditingController();
  var _password = TextEditingController();
  var _name = TextEditingController();

  @override
  Widget build(BuildContext context) {

      return Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(padding: EdgeInsets.only(left: 25,right:25),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15),


                      ),
                      child: TextFormField(
                        style: TextStyle(

                        ),
                        controller: _name,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value !.isEmpty) {
                            return 'please enter your Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person,color: Colors.grey,),
                          label: Text("Name",style: TextStyle(color: Colors.grey),),

                          border: OutlineInputBorder(),

                        ),
                      ),
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(padding: EdgeInsets.only(left: 25,right:25),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15),


                      ),
                      child: TextFormField(
                        style: TextStyle(

                        ),
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value !.isEmpty) {
                            return 'please enter your Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email,color: Colors.grey,),
                          label: Text("Email",style: TextStyle(color: Colors.grey),),

                          border: OutlineInputBorder(),

                        ),
                      ),
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(padding: EdgeInsets.only(left: 25,right:25),
                    child: Container(

                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15),


                      ),
                      child: TextFormField(
                        style: TextStyle(

                        ),
                        controller: _password,
                        obscureText: Provider.of<PasswordProvider>(context).visible,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value !.isEmpty) {
                            return 'please enter your Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                          label: Text("Password",style: TextStyle(color: Colors.grey),),
                          suffixIcon: IconButton(
                            onPressed: (){
                              Provider.of<PasswordProvider>(context,listen: false).changeVisibilty();
                            },
                            icon: Provider.of<PasswordProvider>(context).visible? Icon(Icons.visibility,color: Colors.grey,): Icon(Icons.visibility_off,color: Colors.grey,),
                          ),
                          border: OutlineInputBorder(),

                        ),
                      ),
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(padding: EdgeInsets.only(left: 60,right: 60),
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 151, 136, 1),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        Provider.of<AuthProvider>(context,listen: false)
                            .register(_name.text, _email.text, _password.text);
                      },
                      child: Text('Sign Up',style: TextStyle(fontSize: 20),),
                    ),
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',style: TextStyle(),),
                    TextButton(
                      onPressed: () {
                        Get.offAll(LoginScreen());
                      },
                      child: Text('Login',style: TextStyle(),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  }
}
