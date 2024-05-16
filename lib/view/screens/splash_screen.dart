import 'dart:async';

import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../generated/assets.dart';
import '../../main.dart';

class SplashScreen extends StatelessWidget {
  void onInit() {
    Timer(Duration(seconds: 2),() {

      sharedPreferences.read('token') != null ?Get.offAllNamed(Routes.appbar) :Get.offAllNamed(Routes.onboardingScreen);
    },
    );
  }
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    onInit();
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Center(child: Image.asset(Assets.imagesSplash)),
          Center(child: Image.asset(Assets.imagesLogo))
        ],
      )),
    );
  }
}
