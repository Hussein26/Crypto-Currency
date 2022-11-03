
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../model/details_model.dart';
import '../../network/coin_api.dart';
import '../../network/dio_exceptions.dart';
import '../../view/screens/details_screen.dart';

class DetailsProvider extends ChangeNotifier{

  DetailsModel? detailsModel =DetailsModel(id:"", name: "", symbol: "", description: "", image: "", market_cap_rank: 0, currentPrice: 0, percentChange_24h: 0, percentChange_7d: 0, percentChange_14:0, percentChange_30:0, percentChange_60: 0, percentChange_200:0, percentChange_1y:0);

  Future getAllDetails(String value) async{
    try{
     await CoinApi().getAllDetails(value).then((value) {
         detailsModel = value;
        Get.to(DetailScreen());
      });
    }
    on DioError catch(e){
      String error =  DioExceptions.fromDioError(e).toString();
      print(error);
    }
  } 
}