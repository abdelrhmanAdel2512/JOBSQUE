import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';

import '../main.dart';
import '../model/appliedJobModel.dart';
import 'endpoints.dart';

class AppliedJobApi{

  final dio = Dio();
  Future<AppliedJobModel> getAppliedJob() async {
    AppliedJobModel model = AppliedJobModel();
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer ${sharedPreferences.read('token')}";
      final  response = await dio.get('${EndPoint.baseUrl}${EndPoint.apply}/${sharedPreferences.read('userId')}',);
      model = AppliedJobModel.fromJson(response.data);
      model = AppliedJobModel.fromJson(response.data);
        print(response.statusCode);
      if(response.statusCode==200){
        debugPrint(response.data.toString());
        debugPrint('applied job API success');
        return model;
      }
      else{
        print('error');
      }
      model = AppliedJobModel.fromJson(response.data);
      debugPrint(response.data.toString());

    }  on Exception catch  (e) {
      if (e is DioException) {
        debugPrint('Dio error:');
        debugPrint('  Type: ${e.type}');
        debugPrint('  Message: ${e.message}');
      }
      else {
        // Handle other types of errors
        debugPrint('Unexpected error: $e');
      }
    }
    return model;
  }
}