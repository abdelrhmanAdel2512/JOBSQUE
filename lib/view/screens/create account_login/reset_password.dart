import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/route_name.dart';
import '../../widgets/create_account.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  TextEditingController email = TextEditingController();

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
              customAppBar(),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                'Reset Password',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              TextFieldCustom(
                type: 'Enter your email....',
                icon: Icons.email_outlined,
                isPassword: false,
                controller: email,
                islogin: false,
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('Dont’t have an account?',style: TextStyle(fontSize: 14),),
                  InkWell(child: Text('Register',style: TextStyle(fontSize: 14,color: ColorsM.mainColor),),
                    onTap: () => Get.toNamed(Routes.loginScreen),),

                ],),
              SizedBox(height: 0.02*height,),
              Container(
                  width: 0.9 * width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:  ColorsM.mainColor),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.checkEmailScreen);
                    },
                    child: const Text(
                      'Request password reset',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
