import 'package:amit_final_project_1/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../constants/colors.dart';

class PasswordChangeSucces extends StatelessWidget {
  const PasswordChangeSucces({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 0.17* height),
            Image.asset(Assets.iconsPasswordSuccesfullyIlustration),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Password changed succesfully!',style: TextStyle(fontSize: 24),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40,right: 40),
              child: Text('Your password has been changed successfully, we will let you know if there are more problems with your account',style: TextStyle(fontSize: 14,),),
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
                      // Get.toNamed(Routes.countriesScreen);
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
