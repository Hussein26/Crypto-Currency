

import 'package:dio/dio.dart';

import '../core/constant.dart';
import '../model/details_model.dart';
import '../model/home_model.dart';
import '../model/search_model.dart';

class CoinApi {
  Future<List<HomeModel>> getAllCoinsList() async {
    try {
      var response = await Dio().get(
         baseUrl + allCoinEndPoint);

      return List<HomeModel>.from(
          response.data.map((x) => HomeModel.fromJson(x)));
    } catch (e) {

      rethrow;
    }
  }
  Future<List<SearchModel>> getAllSearchResult(String value) async{
    try{
      var response = await Dio().get(
          baseUrl + searchCoinEndPoint + value );

      return List<SearchModel>.from(response.data["coins"].map((x) => SearchModel.formJson(x)));

    }
    catch(e){
      rethrow;
    }
  }
  Future<DetailsModel> getAllDetails(String value) async {
    try{
      var response = await Dio().get(
          baseUrl + coinsDetailsEndPoint + value );
      return DetailsModel.fromJson(response.data);
    }
    catch(e){
      rethrow;
    }
  }
}
