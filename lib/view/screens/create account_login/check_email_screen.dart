import 'package:amit_final_project_1/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../constants/colors.dart';
import '../../../constants/route_name.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 0.19* height),
            Image.asset(Assets.iconsEmailIlustration),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Check your Email',style: TextStyle(fontSize: 24),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40,right: 40),
              child: Text('We have sent a reset password to your email address',style: TextStyle(fontSize: 14,),),
            ),
            const Expanded(child: SizedBox()),
            Center(
              child: Container(
                  width: 0.9 * width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: ColorsM.mainColor),
                  child: TextButton(

                    onPressed: () {
                      Get.toNamed(Routes.createNewPassword);
                    },
                    child: const Text(
                      'Open email app',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),

          ],
        ),
      ),
    );
  }
}
