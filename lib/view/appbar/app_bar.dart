import 'package:amit_final_project_1/constants/colors.dart';
import 'package:amit_final_project_1/view/screens/apply_screens/applied_screen.dart';
import 'package:amit_final_project_1/view/screens/home_screen.dart';
import 'package:amit_final_project_1/view/screens/messages_screens/messages_screen.dart';
import 'package:amit_final_project_1/view/screens/profile_screen.dart';
import 'package:amit_final_project_1/view/screens/saved_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../controller/appbar_controller.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppbarController>(
      init: AppbarController(),
      builder: (controller) => 
       Scaffold(
         resizeToAvoidBottomInset: false,
        body: SafeArea(
          child:IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeScreen(),
              MessageScreen(),
              AppliedScreen(),
              SavedScreen(),
              ProfileScreen()
            ],
          ) ,
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Color(0xff9CA3AF),
          selectedItemColor: ColorsM.mainColor,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(icon: Icons.home_filled,label: 'Home'),
            _bottomNavigationBarItem(icon: Icons.message_rounded,label: 'Messages'),
            _bottomNavigationBarItem(icon: Icons.shopping_bag_outlined,label: 'Applied'),
            _bottomNavigationBarItem(icon: Iconsax.save_2,label: 'Saved'),
            _bottomNavigationBarItem(icon: Icons.person,label: 'Profile'),

          ],
          ),
        ),
    );
  }
}

_bottomNavigationBarItem ({required IconData icon,required  String label}){
  return BottomNavigationBarItem(icon: Icon(icon),
  label: label);
}