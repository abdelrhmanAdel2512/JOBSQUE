import 'package:amit_final_project_1/constants/colors.dart';
import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/create_account_controller.dart';
import '../../../main.dart';
import '../../widgets/create_account.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  CreateAccountController createAccountController =Get.put<CreateAccountController>(CreateAccountController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //app bar
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 0.04 * height,
                      width: 0.3 * width,
                      child: Image.asset('assets/images/Logo.png')),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text('Login', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
            SizedBox(
              height: height * 0.01,
            ),
            const Text('Please login to find your dream job',
                style: TextStyle(fontSize: 16)),
            SizedBox(
              height: height * 0.03,
            ),
            TextFieldCustom(
              type: 'email',
              icon: Icons.person_2_outlined,
              isPassword: false,
              controller: email,
              islogin: false,
            ),
            GetBuilder<CreateAccountController>(
              init: CreateAccountController(),
              builder: (controller) => Column(
                children: [
                  TextFieldCustom(
                    type: 'password',
                    icon: Icons.lock_outlined,
                    isPassword: true,
                    controller: password,
                    islogin: true,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      Checkbox(value: controller.isCheck, onChanged: (value) {
                        controller.isCheck = value!;
                        controller.update();
                      },),
                      const Text('Remember me',style: TextStyle(fontSize: 14),),
                      SizedBox(width: 0.2*width,),
                      InkWell(child: Text('Forgot Password?',style: TextStyle(fontSize: 14,color: ColorsM.mainColor),),
                      onTap: () => Get.toNamed(Routes.resetPassword),),
                    ],
                  ),
                   SizedBox(height: 0.2 *height),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    Text('Dont’t have an account?',style: TextStyle(fontSize: 14),),
                    InkWell(child: Text('Register',style: TextStyle(fontSize: 14,color: ColorsM.mainColor),),
                    onTap: () => Get.toNamed(Routes.createAccountScreen1),),

                  ],),
                  SizedBox(
                    height: height * 0.02,
                  ),
              Container(
                  width: 0.9 * width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: (email.text.isEmpty &&

                          password.text.isEmpty)
                          ? ColorsM.ButtonColor
                          : ColorsM.mainColor),
                  child: TextButton(
                    onPressed: ()
                      async{

                        await controller.loginApiFun(
                          email: email.text,
                          password: password.text,
                        );

                        if (sharedPreferences.read('token') != null) {
                          Get.toNamed(Routes.CreateAccountJobScreen);
                          print(sharedPreferences.read('token'));
                          Get.offAllNamed(Routes.appbar);
                        } else {
                          Get.snackbar('Try again', 'Try again');
                          print(controller.registerData.token);
                        }
                      }
                    ,
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),

                  SizedBox(
                    height: height * 0.01,
                  ),
                  textDivider(text: 'Or Login With Account'),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  mediaBar(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
