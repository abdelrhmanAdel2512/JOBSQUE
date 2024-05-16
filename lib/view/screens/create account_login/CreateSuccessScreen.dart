import 'package:amit_final_project_1/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../constants/colors.dart';
import '../../../constants/route_name.dart';

class CreateSuccessScreen extends StatelessWidget {
  const CreateSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back)),
              ],
            ),
            SizedBox(height: 0.15* height),
            Image.asset(Assets.iconsSuccessAccountIlustration),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Your account has been set up!',style: TextStyle(fontSize: 24),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40,right: 40),
              child: Text('We have customized feeds according to your',style: TextStyle(fontSize: 14,),),
            ),
            Text('preferences',style: TextStyle(fontSize: 14,),),
            SizedBox(height:0.37* height),
            Center(
              child: Container(
                  width: 0.9 * width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: ColorsM.mainColor),
                  child: TextButton(

                    onPressed: () {
                      Get.offAllNamed(Routes.appbar);
                    },
                    child: const Text(
                      'Get Started',
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
