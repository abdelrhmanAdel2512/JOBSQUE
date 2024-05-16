import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controller/create_account_controller.dart';
import '../../widgets/create_account.dart';

class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({super.key});

  TextEditingController firstPassword = TextEditingController();
  TextEditingController secondPassword = TextEditingController();

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
              GetBuilder<CreateAccountController>(
                init: CreateAccountController(),
                builder: (controller) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create new password',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 0.01 * height,
                    ),
                    Text(
                      'Set your new password so you can login and acces Jobsque',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 0.03 * height,
                    ),
                    TextFieldCustom(
                        icon: Icons.lock_outlined,
                        type: 'password',
                        isPassword: true,
                        controller: firstPassword,
                        islogin: true),
                    Text(
                      'Password must be at least 8 characters',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    SizedBox(
                      height: 0.01 * height,
                    ),
                    TextFieldCustom(
                        icon: Icons.lock_outlined,
                        type: 'password',
                        isPassword: true,
                        controller: secondPassword,
                        islogin: true),
                    const Text(
                      'Password must be at least 8 characters',
                      style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ],
                ),
              ),

              const Expanded(child: SizedBox()),
              Container(
                  width: 0.9 * width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:  ColorsM.mainColor),
                  child: TextButton(
                    onPressed: () {
                        Get.toNamed(Routes.passwordChangeSucces);
                    },
                    child: const Text(
                      'Create account',
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
