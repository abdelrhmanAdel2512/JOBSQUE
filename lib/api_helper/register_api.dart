import 'package:dio/dio.dart';

import '../main.dart';
import '../model/regester_model.dart';
import 'endpoints.dart';

class RegisterApi {
  final dio = Dio();

  Future<RegisterModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    RegisterModel registerModel =RegisterModel();
    try {
      Response response = await dio.post(
        '${EndPoint.baseUrl}${EndPoint.register}',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Successful request
        sharedPreferences.write('token', response.data['token']);
        sharedPreferences.write('userId', response.data['profile']['user_id']);
        sharedPreferences.write('name', response.data['data']['name']);

        print('Response data: ${response.data}');
        print(sharedPreferences.read('token'));
        print(sharedPreferences.read('userId'));
        print('Response stutas: ${response.statusCode}');


        // Deserialize the response data into your RegisterModel
        registerModel = RegisterModel.fromJson(response.data);

        return registerModel;
      } else {
        // Handle other status codes
        print('Error: ${response.statusCode}, ${response.statusMessage}');
      }
    } catch (error) {
      // Handle Dio errors
      if (error is DioException) {
        print('Dio error:');
        print('  Type: ${error.type}');
        print('  Message: ${error.message}');
        if (error.response != null) {
          print('  Status code: ${error.response!.statusCode}');
          print('  Status message: ${error.response!.statusMessage}');
        }



      } else {
        // Handle other types of errors
        print('Unexpected error: $error');
      }// Handle Dio errors
    }
    return registerModel;
  }
}