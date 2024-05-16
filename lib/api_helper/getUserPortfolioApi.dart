import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


import '../main.dart';
import '../model/getUserPortfolioModel.dart';
import 'endPoints.dart';

class GetUserPortfolio {
  GetPortofoliosModel  up = GetPortofoliosModel();
  final dio=Dio();
  Future<GetPortofoliosModel> getPortfolio() async {
    try {

      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer ${sharedPreferences.read('token')}";
      final response  = await dio.get('${EndPoint.baseUrl}${EndPoint.getProfile}');


      if(response.statusCode==200){
        debugPrint(response.data.toString());
        debugPrint('profile API success');
      }
      else{
        debugPrint('error');
      }
      up = GetPortofoliosModel.fromJson(response.data);
    }

    catch (e) {
      if (e is DioException) {
        debugPrint('Dio error:');
        debugPrint('  Type: ${e.type}');
        debugPrint('  Message: ${e.message}');
        return up ;
      }
      else {
        // Handle other types of errors
        debugPrint('Unexpected error: $e');
        return up ;
      }
    }
    return up;
  }


}