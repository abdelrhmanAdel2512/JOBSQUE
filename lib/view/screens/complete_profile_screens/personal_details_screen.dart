

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


import '../../../controller/coplete_profile_controller.dart';
import '../../../controller/edit_portofolio_contoller.dart';

import '../../../controller/profile_controller.dart';
import '../../../generated/assets.dart';
import '../../widgets/global_widget.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profController = Get.put<ProfileController>(ProfileController());
    final CompleteProfileController completeProfileController = Get.find();
    TextEditingController nameTxtController=TextEditingController();
    TextEditingController bioTxtController=TextEditingController();
    TextEditingController addressTxtController=TextEditingController();
    TextEditingController phoneTxtController=TextEditingController();
    nameTxtController.text=profController.gusData.data!.profile!.name!;
    bioTxtController.text=profController.gusData.data!.profile!.bio??"";
    addressTxtController.text=profController.gusData.data!.profile!.address??"";;
    phoneTxtController.text=profController.gusData.data!.profile!.mobile??"";
    EditPortofolioConrtoller controller = Get.put<EditPortofolioConrtoller>(EditPortofolioConrtoller());
    final w = Get.width;
    final height = Get.height;

    return Scaffold(
      floatingActionButton: Container(
        width: w * 0.8,
        height: 50,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child:GetBuilder<EditPortofolioConrtoller>(
            builder: (controller) => Text(
              controller.isloading ? 'Loading...' : 'Save',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),

          backgroundColor: Color(0xff3366FF),
          onPressed: () async{
            await  controller.editProfileSendData(bio:bioTxtController.text, address:addressTxtController.text, mobile:phoneTxtController.text,education: '',expriance: '');
            if( controller.editPortofolioModel.status!) {
              Get.back();
              if (completeProfileController.complete[0] == false) {
                completeProfileController.changeComplete(index: 0);
              }
            }else{
              Get.snackbar('error', 'some thing wrong please try again',backgroundColor: Colors.red,);
            }


          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: backArrow(),
        automaticallyImplyLeading: false,
        title: const Text(
          'Edite Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20,),
            child: Column(
              children: [
                SizedBox(height: 10,),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child:                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.imagesProfile, ),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken,)
                            ),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white,width: 2)
                        ),

                      ),

                      Center(
                        child: Icon(Icons.camera_alt_outlined,size: 40,color: Colors.white,),

                      )
                    ],
                  ),
                ),
                TextButton(onPressed: ()async{
                 await controller.changePhoto();
                }, child: const Text(
                  'Change Photo',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ) ),
                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Name',
                      textAlign:TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                      ),),
                    TextField(
                      controller: nameTxtController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'Enter your name',
                        hintStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Bio',
                      textAlign:TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                      ),),
                    TextField(
                      controller: bioTxtController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'Enter your Bio',
                        hintStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Address',
                      textAlign:TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                      ),),
                    TextField(
                      controller: addressTxtController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'Enter your Address',
                        hintStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('No.Handphone',
                      textAlign:TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                      ),),
                    IntlPhoneField(
                      controller: phoneTxtController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(),
                        ),
                      ),

                      initialCountryCode: 'EG',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                    SizedBox(height: 0.1*height,)

                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );

  }
}
