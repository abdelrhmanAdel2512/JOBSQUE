import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_helper/login_api.dart';
import '../api_helper/register_api.dart';
import '../model/login_model.dart';
import '../model/regester_model.dart';

class CreateAccountController extends GetxController {

  //-----------------------Create Account ------------------------------------
  bool obscureText = true;
  String theControllerText = '';
  Color color = Colors.grey;


  changeobscureText() {
    obscureText = !obscureText;
    update();
  }

  ColoChange() {
    if (theControllerText.isEmpty) {
      color = Colors.grey;
      update();
    } else if (theControllerText.length < 8) {
      color = Colors.red;
      update();
    } else {
      color = Colors.green;
      update();
    }
  }

  RegisterApi api = RegisterApi();
  RegisterModel registerData = RegisterModel();
  bool isLoading = false;




  Future<void> registerApiFun({
    required String name,
    required String email,
    required String password,
  }) async {


      isLoading = true;
      update();

      registerData = await api.register(name: name, email: email, password: password);
      isLoading = false;

      update();


  }

  //-------------------------------------------Login---------------------------
bool isCheck = false;

  LoginApi loginApi = LoginApi();
  UserModel loginData = UserModel();

  Future<void> loginApiFun({
    required String email,
    required String password,
  }) async {
    print("----------------------------------------------------------");

    try {
      update();
      // Assuming this is necessary
      loginData = (await loginApi.login(email: email, password: password))!;

      // statusCode = (await data.status)!;
      update(); // Is this necessary?

      // print("Status Code: $statusCode");
    } catch (error) {
      print("Error: $error");
      // Handle the error as needed
    }

    print("----------------------------------------------------------");
  }

}
