import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/themes.dart';
import '../../view_model/provider/details_provider.dart';
import '../../view_model/provider/search_provider.dart';

class SearchScreen extends StatelessWidget {
  var _controller = TextEditingController();
  var _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, provider, child) {
      var providerD = Provider.of<DetailsProvider>(context);
      var providerS = Provider.of<SearchProvider>(context);
      cleanText() {
        _controller.clear();
        provider.clearSearch();
      }

      return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .029,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Themes.isDarkMode(context)
                          ? Color.fromRGBO(66, 66, 66, 1)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(2)),
                  width: double.infinity,
                  child: TextFormField(
                    controller: _controller,
                    focusNode: _focus,
                    autofocus: true,
                    onChanged: (value) {
                      provider.getAllSearchList(value);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search...',
                      hintStyle: TextStyle(fontSize: 20),
                      suffixIcon: IconButton(
                        onPressed: () {
                          cleanText();
                          _focus.requestFocus();
                        },
                        icon: Icon(Icons.cancel),
                      ),

                    ),
                  ),
                ),
              ),
              _controller.text.isEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .27,
                          ),
                          Center(
                            child: SvgPicture.asset(
                              'assets/undraw_the_search_s0xf.svg',
                              width: MediaQuery.of(context).size.width * .2,
                              height: MediaQuery.of(context).size.height * .3,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Search for a coin",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: provider.searchList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  providerD.getAllDetails(
                                      provider.searchList[index].id);
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 15, right: 15, left: 15),
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .11,
                                        decoration: BoxDecoration(
                                          color: Themes.isDarkMode(context)
                                              ? Color(0xff151f2c)
                                              : Colors.blueGrey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 15,
                                            ),
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(provider
                                                          .searchList[index]
                                                          .image ==
                                                      ""
                                                  ? "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"
                                                  : provider
                                                      .searchList[index].image),
                                              radius: 20,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    provider
                                                        .searchList[index].name,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                  Text(
                                                    provider.searchList[index]
                                                        .symbol,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .42,
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "rank",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    provider
                                                        .searchList[index].rank
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ));
                          }),
                    ),
            ],
          ),
        )),
      );
    });
  }
}
