import 'package:dio/dio.dart';

import '../main.dart';
import '../model/login_model.dart';
import 'endpoints.dart';

class LoginApi{
  final dio = Dio();
  Future<UserModel?> login({

    required String email,
    required String password,
  }) async {
    UserModel userModel = UserModel();
    try {
      Response response = await dio.post(
        '${EndPoint.baseUrl}${EndPoint.login}',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Successful request
        sharedPreferences.write('token', response.data['token']);
        sharedPreferences.write('userId', response.data['user']['id']);

        print('Response data: ${response.data}');
        print(sharedPreferences.read('token'));
        print(sharedPreferences.read('userId'));
        print('Response stutas: ${response.statusCode}');


        // Deserialize the response data into your RegisterModel
        userModel = UserModel.fromJson(response.data);

        return userModel;
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
      }
      return userModel;
    }
    return userModel;
  }
}
