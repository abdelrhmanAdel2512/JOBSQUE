import 'dart:io';

import 'package:dio/dio.dart';

import '../main.dart';
import '../model/all_job_model.dart';

import '../model/apply_model.dart';
import '../model/change_name_or_password.dart';
import 'endpoints.dart';

class ApiFun {
  Dio dio = Dio();

  Future<AlljobModel?> searchJob({required String jobName}) async {
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer ${sharedPreferences.read('token')}";
      final response = await dio.post('${EndPoint.baseUrl}${EndPoint.search}',
          data: {'name': jobName});

      if (response.statusCode == 200) {
        AlljobModel data = AlljobModel.fromJson(response.data);
        print(response.data);
        print(data);
        return data;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<AlljobModel?> filterApi(
      {required String jobTitle, required String location}) async {
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer ${sharedPreferences.read('token')}";
      final response = await dio.post('${EndPoint.baseUrl}${EndPoint.search}',
          data: {'name': jobTitle, 'location': location});

      if (response.statusCode == 200) {
        AlljobModel data = AlljobModel.fromJson(response.data);
        print(response.data);
        print(data);
        return data;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // Future<ApplyModel?> applyApi(
  //     {required File cvFile,
  //     required String name,
  //     required String email,
  //     required String mobile,
  //     required String workType,
  //     required File otherFile,
  //     required String jobsId,
  //     required String userId}) async {
  //   try {
  //     dio.options.headers['content-Type'] = 'application/json';
  //     dio.options.headers["authorization"] =
  //         "Bearer ${sharedPreferences.read('token')}";
  //     FormData formData = FormData.fromMap({
  //       "jobs_id": 1,
  //       "cv_file": await MultipartFile.fromFile(cvFile.path, filename: "cv_file"),
  //       "name": 'name',
  //       "email": 'email',
  //       "mobile": '011111111',
  //       "work_type": 'workType',
  //       "other_file":  await MultipartFile.fromFile(otherFile.path, filename: "other_file") ,
  //       "user_id": 1,
  //     });
  //
  //     final response =
  //         await dio.post('${EndPoint.baseUrl}${EndPoint.apply}', data: {
  //       // 'cv_file': await MultipartFile.fromFile(cvFile.path, filename: "cv_file"),
  //       // 'name': 'name',
  //       // 'email': 'email@aaaa',
  //       // 'mobile': '01148154711',
  //       // 'work_type': 'full',
  //       // 'other_file': await MultipartFile.fromFile(otherFile.path, filename: "other_file"),
  //       // 'jobs_id': 1,
  //       // 'user_id': 1,
  //           formData
  //     });
  //     if (response.statusCode == 200) {
  //       ApplyModel data = ApplyModel.fromJson(response.data);
  //       print(response.data);
  //       print(data);
  //       return data;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return null;
  // }
  Future<ApplyModel?> applyApi({
    required File cvFile,
    required String name,
    required String email,
    required String mobile,
    required String workType,
    required File otherFile,
    required int jobsId,

  }) async {
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer ${sharedPreferences.read('token')}";

      FormData formData = FormData.fromMap({
        "jobs_id": jobsId,
        "cv_file": await MultipartFile.fromFile(cvFile.path, filename: "cv_file"),
        "name": name,
        "email": email,
        "mobile": mobile,
        "work_type": workType,
        "other_file": await MultipartFile.fromFile(otherFile.path, filename: "other_file"),
        "user_id": sharedPreferences.read('userId'),
      });

      final response = await dio.post(
        '${EndPoint.baseUrl}${EndPoint.apply}',
        data: formData,
      );

      if (response.statusCode == 200) {
        ApplyModel data = ApplyModel.fromJson(response.data);
        print(response.data);
        print(data);
        return data;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }


  Future <ChangeNameOrPasswordModel?>changeNameOrPassword (password)async{
    try{
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer ${sharedPreferences.read('token')}";
      final response  = await dio.post('${EndPoint.baseUrl}${EndPoint.changeNameOrPassword}',data: {
        'password':password
      });
      if(response.statusCode == 200){
        ChangeNameOrPasswordModel changeNameOrPasswordModel = ChangeNameOrPasswordModel.fromJson(response.data);
        print(response.statusCode);
        return changeNameOrPasswordModel;
      }
    }catch (e){
      print(e);
    }
  }
}
