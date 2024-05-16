import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controller/create_account_controller.dart';

import '../../../main.dart';
import '../../widgets/create_account.dart';

class CreateAccountScreen1 extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  CreateAccountController createAccountController = Get.put<CreateAccountController>(CreateAccountController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GetBuilder<CreateAccountController>(
            init: CreateAccountController(),
            autoRemove: false,
            builder: (controller) {
          return  Padding(
            padding:  EdgeInsets.all(0.02 * width),
            child: Column(
              children: [
                customAppBar(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Please create an account to find your dream job'),
                ),
                SizedBox(
                  height: 0.02 * height,
                ),
                TextFieldCustom(
                  type: 'User name',
                  icon: Icons.person_2_outlined,
                  isPassword: false,
                  controller: username,
                  islogin: false,
                ),
                TextFieldCustom(
                  type: 'Email',
                  icon: Icons.email_outlined,
                  isPassword: false,
                  controller: email,
                  islogin: false,
                ),
                TextFieldCustom(
                  type: 'password',
                  icon: Icons.lock_outlined,
                  isPassword: true,
                  controller: password,
                  islogin: false,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Password must be at  least 8 characters',
                      style: TextStyle(color: controller.color)),
                ),
                SizedBox(
                  height: 0.15 * height,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    InkWell(
                        child: const Text(
                      ' Login',
                      style: TextStyle(color: ColorsM.mainColor),
                    ),
                    onTap:  () {
                          Get.offNamed(Routes.loginScreen);
                    },),
                  ],
                ),
                SizedBox(height: 0.02 * height),
                Center(
                  child: Container(
                      width: 0.9 * width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: (username.text.isEmpty &&
                                  email.text.isEmpty &&
                                  password.text.isEmpty)
                              ? ColorsM.ButtonColor
                              : ColorsM.mainColor),
                      child: TextButton(
                        onPressed: () async{

                          await controller.registerApiFun(
                            name: username.text,
                            email: email.text,
                            password: password.text,
                          );

                          if (sharedPreferences.read('token') != null) {
                            Get.offAllNamed(Routes.CreateAccountJobScreen);
                            print(sharedPreferences.read('token'));
                          } else {
                            Get.snackbar('Try again', 'Try again');
                            print(controller.registerData.token);
                          }
                        },
                        child: const Text(
                          'Create account',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                textDivider(text: 'Or Sign up With Account'),
                mediaBar()
              ],
            ),
          );
        }),
      ),
    );
  }
}
