

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../model/search_model.dart';
import '../../network/coin_api.dart';
import '../../network/dio_exceptions.dart';
import '../../view/screens/details_screen.dart';

class SearchProvider extends ChangeNotifier{
  List<SearchModel> searchList = [];

 Future getAllSearchList (String search) async {
   try{
     await CoinApi().getAllSearchResult(search).then((value) {
       searchList = value;
       notifyListeners();
     });
   }
  on DioError catch(e){
     String error = DioExceptions.fromDioError(e).toString();
     print(error);
  }
 }
 clearSearch(){
   searchList = [];
   notifyListeners();
 }
}