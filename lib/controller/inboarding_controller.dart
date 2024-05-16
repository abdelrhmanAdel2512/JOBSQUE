import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/assets.dart';
import '../view/widgets/onboarding.dart';

class OnboardingController extends GetxController{
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;



  final List<Widget> pages = [
    OnboardingPage(
      title: 'title1',
      description: 'Explore over 25,924 available job roles and upgrade your operator now.',
      imageUrl: Assets.onboarding1,
    ),
    OnboardingPage(
      title: 'title2',
      description: 'Immediately join us and start applying for the job you are interested in.',
      imageUrl: Assets.onboarding2,
    ),
    OnboardingPage(
      title: 'title3',
      description: 'The better the skills you have, the greater the good job opportunities for you.',
      imageUrl: Assets.onboarding3,
    ),
  ];

  pagechange(int index){
    currentPage = index;
    update();
  }

}