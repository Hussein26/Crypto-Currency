

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_project_final/view/screens/auth/registrate_screen.dart';
import 'package:grad_project_final/view_model/provider/auth_provider.dart';

import 'package:provider/provider.dart';

import '../../../view_model/provider/password_provider.dart';


class LoginScreen extends StatelessWidget {
  var _email = TextEditingController();
  var _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sign in',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
        Padding(padding: EdgeInsets.only(left: 50,right: 50,top: 20),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey)

              ),
              child: TextFormField(
                style: TextStyle(
                    color: Colors.white
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
                  label: Text("email",style: TextStyle(color: Colors.grey),),
                  border: OutlineInputBorder(),

                ),
              ),
            )
        ),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.only(left: 50,right: 50),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey)

                ),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  controller: _password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: Provider.of<PasswordProvider>(context).visible,
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
         SizedBox(height: MediaQuery.of(context).size.height*.01,),

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
                  Provider.of<AuthProvider>(context,listen: false).login(_email.text, _password.text);
                },
                child: Text('Sign in',style: TextStyle(fontSize: 20),),
              ),
            ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have account?",style: TextStyle(color: Colors.white),),
              TextButton(onPressed: (){
                Get.offAll(RegisterScreen());
              }, child: Text('Sign up',style: TextStyle(color: Colors.white)))
            ],
          ),
          Text('Or',style: TextStyle(color: Colors.white,fontSize: 20),),
          SizedBox(height: 10,),
          GestureDetector(
              onTap: (){
                Provider.of<AuthProvider>(context,listen: false).googleSignInMethod();
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/google.png',height: 20,),
                    SizedBox(width: 10,),
                    Text('Sign in with Google'),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
