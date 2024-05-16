import 'dart:io';

import 'package:amit_final_project_1/controller/profile_controller.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../API_helper/AddPortofolioApi.dart';
import '../api_helper/editProfileApi.dart';
import '../generated/assets.dart';
import '../model/addPortofolioModel.dart';
import '../model/editProfileModel.dart';


class EditPortofolioConrtoller extends GetxController{
  bool isloading = false;
  List<Map<String,String>>langList=[
    {
      'title':'English',
      'image':Assets.imagesUk,
    },
    {
      'title':'Arabic',
      'image':Assets.imagesKsa,
    },
    {
      'title':'French',
      'image':Assets.imagesFrancepng,
    },
    {
      'title':'Spanish',
      'image':Assets.imagesSpn,
    },
    {
      'title':'Deutsch',
      'image':Assets.imagesNetherlandspng,
    },
    {
      'title':'Italian',
      'image':Assets.imagesIty,
    },
    {
      'title':'Russian',
      'image':Assets.imagesRus,
    },
    {
      'title':'Chinese',
      'image':Assets.imagesChina,
    },
    {
      'title':'Japanese',
      'image':Assets.imagesJp,
    },
    {
      'title':'Korean',
      'image':Assets.imagesKor,
    },
    {
      'title':'Portuguese',
      'image':Assets.imagesPortuguese,
    },
  ];
  List <bool> isSelected =List.filled(11, false);


  var selectedLang='English';

  void setLang(value) {
    selectedLang = value;
    debugPrint('selectedLang: $selectedLang');
    update();
  }
  ProfileController profController = Get.put<ProfileController>(ProfileController());

  EditProfileApi api = EditProfileApi();
  EditPortofolioModel editPortofolioModel = EditPortofolioModel();
  Future<EditPortofolioModel> editProfileSendData(
      {required String bio, required String address, required String mobile ,required education ,required expriance}) async {
    isloading = true;
    update();
    editPortofolioModel = await api.editProfileSendData(bio, address, mobile ,selectedLang, education,expriance);
    await profController.getPortfolio();
    isloading = false;
    update();
    return editPortofolioModel;
  }

  Future<void> changePhoto() async {

    pickedFile = await FilePicker.platform.pickFiles( type: FileType.custom, allowedExtensions: ['jpg', 'png']);
    model = await apClass.addPortfolioApi(file:File(pickedFile.files.single.path) , image:File(pickedFile.files.single.path) );



  }
  dynamic pickedFile;
  AddPortofolio apClass= AddPortofolio();
  AddPortfolioModel model= AddPortfolioModel();

}