import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grad_project_final/view_model/provider/profile_provider.dart';
import 'package:provider/provider.dart';


import '../../core/themes.dart';
import '../../view_model/provider/details_provider.dart';
import '../../view_model/provider/home_provider.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String s = "\$";


  @override
  Widget build(BuildContext context) {

    return Consumer<HomeProvider>(builder: (context, provider, child) {
      var providerD = Provider.of<DetailsProvider>(context);
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Crypto Currency",
            style: TextStyle(),
          ),
        ),
        body: ListView.builder(
            itemCount: provider.coinList.length,
            itemBuilder: (context, index) {

              return GestureDetector(
                  onTap: () {
                    providerD.getAllDetails(provider.coinList[index].id);
                  },
                  child:Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,right: 15,left: 15),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .11,
                          decoration: BoxDecoration(
                            color: Themes.isDarkMode(context) ? Color(0xff151f2c) : Colors.blueGrey,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  provider.coinList[index].marketCapRank
                                      .toString(),
                                  style: TextStyle(
                                       fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                backgroundImage: NetworkImage(provider
                                    .coinList[index].imageUrl ==
                                    ""
                                    ? "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"
                                    : provider.coinList[index].imageUrl),
                                radius: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      provider.coinList[index].name,

                                      style: TextStyle(

                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      provider.coinList[index].symbol,
                                      style: TextStyle(
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*.23,),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${provider.coinList[index].currentPrice
                                            .toString()}$s",
                                        style: TextStyle(),

                                      ),
                                      Text(
                                        "${provider.coinList[index].priceChange.toStringAsFixed(4)
                                            }$s",
                                        style: TextStyle(
                                            color: provider.coinList[index]
                                                .priceChange >=
                                                0
                                                ? Colors.green
                                                : Colors.red,
                                        ),
                                      ),
                                      Text("${provider
                                          .coinList[index].priceChangePercentage
                                          .toStringAsFixed(3)}%",
                                        style: TextStyle(
                                            color: provider.coinList[index]
                                                .priceChange >=
                                                0
                                                ? Colors.green
                                                : Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
              );
            }),
      );
    });
  }
}
