import 'package:amit_final_project_1/model/all_job_model.dart';
import 'package:get/get.dart';

import '../generated/assets.dart';


class JocDetailController extends GetxController{
  Data jobdeatil = Data() ;
  int index= 0;
  var dropdownValue ;

  void changeIndex ({required indexed}){
    index = indexed;
    update();

  }
  List<Map<String, String>> employees = [
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': Assets.imagesPeopleImage,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': Assets.imagesPeopleImage,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': Assets.imagesPeopleImage,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': Assets.imagesPeopleImage,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': Assets.imagesPeopleImage,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': Assets.imagesPeopleImage,
      'duration': '5'
    },
  ];

}