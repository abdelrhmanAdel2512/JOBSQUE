import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:amit_final_project_1/view/widgets/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../controller/phone_and_password_controller.dart';

class TowStepVerification2Screen extends StatelessWidget {
  TowStepVerification2Screen({super.key});

 final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        centerTitle: true,
        leading: backArrow(),
        automaticallyImplyLeading: false,
        title: const Text(
          'Two-step verification',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.05 * width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.03 * height,
              ),
              const Text(
                'Add phone number',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              const Text(
                'We will send a verification code to this number',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff6B7280)),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              IntlPhoneField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(),
                  ),
                ),
                initialCountryCode: 'EG',
                onChanged: (phone) {

                },
              ),
              SizedBox(height: 0.01 * height,),
              const Text('Enter your password',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
              SizedBox(height: 0.01 * height,),
              GetBuilder<PhoneAndPasswordController>(
                  init: PhoneAndPasswordController(),
                  builder: (logic) {
                return passwordTextField(
                    num: 1, name: 'password', controller: passwordController);
              }),
              const Expanded(child: SizedBox()),
              InkWell(
                  onTap: ()  {
                    Get.toNamed(Routes.twoStepVerification3Screen);
                  },
                  child: buttonBottom(text: 'save')),
            ],
          ),
        ),
      ),
    );
  }
}
