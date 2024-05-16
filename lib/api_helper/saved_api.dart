import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../model/add_saved_model.dart';
import '../model/delete_saved_model.dart';
import '../model/show_savae_jobs.dart';
import 'endpoints.dart';

class SavedApi {
  Dio dio = Dio();

  Future<AddSavedModel?> addToSaveApi({required String jobId}) async {
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer ${sharedPreferences.read('token')}";
      final response = await dio.post(
          '${EndPoint.baseUrl}${EndPoint.addToSaved}',
          data: {'job_id': jobId});
      if (response.statusCode == 200) {
        AddSavedModel addSavedData = AddSavedModel.fromJson(response.data);
        print(response.statusCode);
        return addSavedData;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<ShowSavedJobs?> showSavedApi() async {
    ShowSavedJobs showSavedJobs = ShowSavedJobs();
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer ${sharedPreferences.read('token')}";
      final response =
          await dio.get('${EndPoint.baseUrl}${EndPoint.addToSaved}');
      if (response.statusCode == 200) {
        showSavedJobs =ShowSavedJobs.fromJson(response.data);

        print( 'status ${response.statusCode}');
        return showSavedJobs ;
      }
    } catch (e) {

      return ShowSavedJobs(
         status: false,
         data: []
      );
    }
    return showSavedJobs;
  }
  Future<DelFavJobModel> delFavJob({required String jobID}) async {
    DelFavJobModel model = DelFavJobModel();

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer ${sharedPreferences.read('token')}";

      final response = await dio.delete(
        'https://project2.amit-learning.com/api/favorites/$jobID',
      );

      if (response.statusCode == 200) {
        debugPrint('Job deleted');

        if (response.data != null) {
          model = DelFavJobModel.fromJson(response.data);
        } else {
          debugPrint('Error: Response data is null');
        }
      } else {
        // Handle other status codes if needed
        debugPrint('Job not deleted. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      debugPrint('Dio error:');
      debugPrint('  Type: ${e.type}');
      debugPrint('  Message: ${e.message}');
      // Handle Dio-specific errors
    } on Exception catch (e) {
      // Handle other types of exceptions
      debugPrint('Unexpected error: $e');
    }

    return model;
  }

}
