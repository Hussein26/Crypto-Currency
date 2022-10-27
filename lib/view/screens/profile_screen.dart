import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../core/themes.dart';
import '../../view_model/provider/theme_provider.dart';
class ProfileScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
              child:CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"

                ),
                radius: 90,
              )
          ),
          SizedBox(height: 10,),
          Text("Hussein",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text("Hussein@gmail.com",style: TextStyle(fontSize: 15),),
          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*.4,
                height: MediaQuery.of(context).size.height*.1,
                child: Center(
                  child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        primary:   Themes.isDarkMode(context) ? Color(0xff151f2c) : Colors.blueGrey,
                      ),
                      onPressed: (){

                  }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("From Gallery"),
                      Icon(Icons.image_outlined)
                    ],
                  )),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*.4,
                child: Center(
                  child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        primary:   Themes.isDarkMode(context) ? Color(0xff151f2c) : Colors.blueGrey,
                      ),
                      onPressed: (){

                      }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Add Photo"),
                      Icon(Icons.camera_alt)
                    ],
                  )),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*.05,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(5)
              ),
              child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    primary:   Themes.isDarkMode(context) ? Color(0xff151f2c) : Colors.blueGrey,
                  ),
                onPressed: (){
                  showDialog(context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor:Colors.grey,
                        title: Text("Change Theme",style: TextStyle(color: Colors.white),),
                        actions: [
                          Column(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 10,right:10),
                                child: Container(
                                  width: double.infinity,
                                  height: 45,
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(5)

                                  ),
                                  child: ElevatedButton(
                                    style:ElevatedButton.styleFrom(
                                    primary: Colors.white
                                    ),
                                    onPressed: (){
                                      Provider.of<ThemeProvider>(context,listen: false).saveThemeModeToSharedPref(ThemeMode.system);
                                      Get.back();
                                    },
                                    child: Text('System',style: TextStyle(color: Colors.black,fontSize: 20),),
                                  ),
                                ),),
                              SizedBox(height: 10,),
                              Padding(padding: EdgeInsets.only(left: 10,right:10),
                                child: Container(
                                  width: double.infinity,
                                  height: 45,
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(5)

                                  ),
                                  child: ElevatedButton(
                                    style:ElevatedButton.styleFrom(
                                      primary:  Colors.white
                                    ),
                                    onPressed: (){
                                      Provider.of<ThemeProvider>(context,listen: false).saveThemeModeToSharedPref(ThemeMode.light);
                                      Get.back();
                                    },
                                    child: Text('Light',style: TextStyle(color: Colors.black,fontSize: 20),),
                                  ),
                                ),),
                              SizedBox(height: 10,),
                              Padding(padding: EdgeInsets.only(left: 10,right:10),
                                child: Container(
                                  width: double.infinity,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(5)

                                  ),
                                  child: ElevatedButton(
                                    style:ElevatedButton.styleFrom(
                                      primary:   Colors.black
                                    ),
                                    onPressed: (){
                                      Provider.of<ThemeProvider>(context,listen: false).saveThemeModeToSharedPref(ThemeMode.dark);
                                      Get.back();
                                    },
                                    child: Text('Dark',style: TextStyle(color: Colors.white,fontSize: 20),),
                                  ),
                                ),),
                            ],
                          )
                        ],
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Change Theme',style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                )
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*.02,),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*.05,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(5)
              ),
              child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    primary:   Themes.isDarkMode(context) ? Color(0xff151f2c) : Colors.blueGrey,
                  ),
                  onPressed: (){
                    showDialog(context: context, builder: (context)=>AlertDialog(
                        backgroundColor:Colors.grey,
                        title: Text("Change Language",style: TextStyle(color: Colors.white),),
                        actions: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.language,color: Colors.blue,),
                                    TextButton(
                                      onPressed: () {

                                      },
                                      child: Text('English',style: TextStyle(color: Colors.white,fontSize: 20),),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.language,color: Colors.blue,),
                                    TextButton(
                                      onPressed: () {

                                      },
                                      child: Text('Arabic',style: TextStyle(color: Colors.white,fontSize: 20),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ]
                    ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Change Language',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  )
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*.02,),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*.05,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(5)
              ),
              child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    primary:   Themes.isDarkMode(context) ? Color(0xff151f2c) : Colors.blueGrey,
                  ),
                  onPressed: (){
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Logout',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 5,),
                      Icon(Icons.logout)
                    ],
                  )
              ),
            ),
          )
        ],
      )
    );
  }
}
