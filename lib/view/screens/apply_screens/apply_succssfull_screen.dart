import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:amit_final_project_1/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';

class ApplySuccessful extends StatelessWidget {
  const ApplySuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:    InkWell(
            onTap: () => Get.offAllNamed(Routes.appbar),
            child: const Icon(Icons.arrow_back, color: Colors.black,)),
        automaticallyImplyLeading: false,
        title: const Text(
          'Apply Job',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(0.05 *width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: 0.25* height,),
                Image.asset(Assets.iconsDataIlustration),
                SizedBox(height: 0.03*height,),
                SizedBox(
                    width: 0.58* width,
                    child: const Text('Your data has been successfully sent',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500))),
                SizedBox(height: 0.03*height,),
                SizedBox(
                    width: 0.9* width,
                    child: const Text('You will get a message from our team, about the announcement of employee acceptance',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),)),
                SizedBox(height: 0.15*height,),
                InkWell(
                  onTap: () {

                    Get.offAllNamed(Routes.appbar);
                  }
                  ,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:ColorsM.mainColor ,

                    ),
                    height: 0.06 * height,
                    child: const Center(
                      child: Text(
                          'Back to home',
                        style: TextStyle(color: Colors.white),
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
