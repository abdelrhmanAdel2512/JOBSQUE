import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../main.dart';
import '../model/addPortofolioModel.dart';
import 'endPoints.dart';

class AddPortofolio{
  final dio = Dio();
  AddPortfolioModel addPortofolioModel = AddPortfolioModel();
  Future<AddPortfolioModel> addPortfolioApi(
      {required File file,
       required File image}) async {
    try {


      FormData formData = FormData.fromMap({
     'cv_file': await MultipartFile.fromFile(
            file!.path, filename: 'cv_file' ),

  'image': await MultipartFile.fromFile(
            image!.path, filename: 'image' ),
      });

      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer ${sharedPreferences.read('token')}";
      final  response = await dio.post('${EndPoint.baseUrl}${EndPoint.addPortfolio}', data: formData,);



      if (response.statusCode == 200) {
        debugPrint('API success');
          addPortofolioModel = AddPortfolioModel.fromJson(response.data);
        debugPrint(addPortofolioModel.toJson().toString());
      } else {
        debugPrint('error');
      }
    } on DioError catch (e) {
      debugPrint('Dio error:');
      debugPrint('  Type: ${e.type}');
      debugPrint('  Message: ${e.message}');
      throw e;
    } catch (e) {
      debugPrint('Unexpected error: $e');
      throw e;
    }

    return addPortofolioModel;
  }

}