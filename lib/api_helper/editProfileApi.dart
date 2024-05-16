import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../main.dart';
import '../model/editProfileModel.dart';
import 'endPoints.dart';

class EditProfileApi {
  final dio = Dio();
  EditPortofolioModel epm = EditPortofolioModel();
  Future<EditPortofolioModel> editProfileSendData( String bio, String address, String mobile,String lang ,String edu,String ex) async {

   try{
     Map<String,String>params = {
       'bio': bio.toString(),
       'address': address.toString(),
       'mobile': mobile.toString(),
       'language':lang.toString(),
       'education':edu.toString(),
       'experience':ex.toString(),
     };

     dio.options.headers['content-Type'] = 'application/json';
     dio.options.headers["authorization"] = "Bearer ${sharedPreferences.read('token')}";
     final  response = await dio.put('${EndPoint.baseUrl}user/profile/edit',queryParameters: params );



     debugPrint('status code: ${response.statusCode}');
     if (response.statusCode == 200) {
       debugPrint('success');
     } else {
       debugPrint('error');
     }
      epm = EditPortofolioModel.fromJson(response.data);
      debugPrint(epm.toJson().toString());
    }
   on Exception catch (e) {
     if (e is DioError) {
       debugPrint('Dio error:');
       debugPrint('  Type: ${e.type}');
       debugPrint('  Message: ${e.message}');
     } else {
       debugPrint('Error: $e');
     }
   }
   return epm;
   }
}