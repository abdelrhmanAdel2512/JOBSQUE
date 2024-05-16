import 'package:amit_final_project_1/model/countries_model.dart';
import 'package:get/get.dart';

import '../api_helper/register_api.dart';
import '../model/regester_model.dart';

class CountriesController extends GetxController{
  bool isShow = true;
  bool isSelected = false;
  List countries = CountriesModel().countries;
  List <bool>isSelect = List.filled(13,false);





}