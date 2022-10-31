

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/provider/password_provider.dart';

EmailOrNameText(dynamic control ,
    dynamic EmteyValue,
    String WrongValue,
    dynamic WrongMessage,
    dynamic KeyBoardType,
    dynamic PreIcon,
    String Label){
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextFormField(
      style: TextStyle(
      ),
      controller: control,
      validator: (value){
        if(value!.isEmpty){
          return EmteyValue;
        }
        else{ if( !RegExp(WrongValue).hasMatch(value))
        {
          return WrongMessage;
        }
        else {return null;}}
      },
      autocorrect: false,
      keyboardType:KeyBoardType,
      decoration: InputDecoration(

        prefixIcon: Icon(PreIcon,color: Colors.grey,),
        label: Text(Label,style: TextStyle(color: Colors.grey),),
        border: OutlineInputBorder(),
      ),
    ),
  );
}
PasswordText(dynamic Control){
  return Consumer<PasswordProvider>(builder: (context,provider,child){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        style: TextStyle(

        ),
        controller: Control,
        validator: (value){
          if(value!.isEmpty ){
            return 'Please enter your password';
          }
          else{
            if (value.length < 6){
              return 'Password has to be at least 6 characters';
            }
            else {
              return null;
            }
          }
        },

        autocorrect: false,
        keyboardType: TextInputType.visiblePassword,
        obscureText: Provider.of<PasswordProvider>(context).visible,

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
    );
  });
}