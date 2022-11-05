
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grad_project_final/view_model/provider/auth_provider.dart';

import 'package:provider/provider.dart';


import '../../../view_model/provider/password_provider.dart';
import '../../shared/constant.dart';
import '../home_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  var _email = TextEditingController();
  var _password = TextEditingController();
  var _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .24,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: EmailOrNameText(_name,
                        'Please enter your Name',
                        r'^[a-z A-Z]+$' ,
                        'Please Enter a valid Name',
                        TextInputType.text,
                        Icons.person,
                        "Name")
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: EmailOrNameText(_email,
                      'Please Enter your email',
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}',
                      'Please enter a valid Email',
                      TextInputType.emailAddress,
                      Icons.email,
                      "Email")
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: PasswordText(_password)
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 60, right: 60),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .06,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 151, 136, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Provider.of<AuthProvider>(context, listen: false)
                              .register(
                                  _name.text, _email.text, _password.text);

                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.green
                      ),
                      onPressed: () {
                        Get.offAll(LoginScreen());
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
