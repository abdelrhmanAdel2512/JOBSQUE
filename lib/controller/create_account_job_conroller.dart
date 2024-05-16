
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CreateAccountJobController extends GetxController {

  List isOn = [false,false,false,false,false,false];
  List<Map<String , dynamic>> details = [
    {
      "icon": Icons.design_services,
      "title": "UI/UX Design",
    } ,{
      "icon": Icons.architecture_outlined,
      "title": "Illustrator Designer",
    } ,{
      "icon": Icons.terminal,
      "title": "Developer",
    } ,{
      "icon": Icons.manage_accounts_outlined,
      "title": "Management",
    } ,{
      "icon": Icons.computer_outlined,
      "title": "Information Technology",
    }, {
      "icon": Icons.analytics_outlined,
      "title": "Research and Analytics",
    }
  ];

  changeColor(int index) {
    if (isOn[index] == false) {
      isOn[index] = true ;
      update();
    } else {
      isOn[index] =false ;
      update();
    }
  }
}
