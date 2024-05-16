import 'package:amit_final_project_1/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/coplete_profile_controller.dart';
import '../../../controller/edit_portofolio_contoller.dart';
import '../../../controller/education_experince_controller.dart';
import '../../widgets/global_widget.dart';

class EducationScreen extends StatelessWidget {
EducationScreen({super.key});

final EducationController educationAndExperienceController = Get.put<EducationController>(EducationController());
final CompleteProfileController completeProfileController = Get.find();
EditPortofolioConrtoller editPortofolioConrtoller = Get.put<EditPortofolioConrtoller>(EditPortofolioConrtoller());
  @override
  Widget build(BuildContext context) {
    TextEditingController universityController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: backArrow(),
        automaticallyImplyLeading: false,
        title: const Text(
          'ُEducation',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.05 * width),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: const Color(0xffD1D5DB))),
                  child: Padding(
                    padding: EdgeInsets.all(0.02 * width),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'University *',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9CA3AF)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        TextFormField(
                          controller: universityController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 1, color: Color(0xff9CA3AF)))),
                        ),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        const Text(
                          'Title',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9CA3AF)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        TextFormField(
                          controller: titleController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 1, color: Color(0xff9CA3AF)))),
                        ),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        const Text(
                          'Start Year',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9CA3AF)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        GetBuilder<EducationController>(
                            init: EducationController(),
                            builder: (controller) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xff9CA3AF))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.startDate
                                                .toString()
                                                .split(' ')[0],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          IconButton(
                                              onPressed: () async {
                                                controller.startDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        firstDate:
                                                            DateTime(1970),
                                                        lastDate:
                                                            DateTime.now(),
                                                        initialDate:
                                                            DateTime.now());
                                                if (controller.startDate !=
                                                    null) {
                                                  controller.update();
                                                }
                                              },
                                              icon: const Icon(Icons.calendar_month)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.03 * height,
                                  ),
                                  const Text(
                                    'End Year',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff9CA3AF)),
                                  ),
                                  SizedBox(
                                    height: 0.01 * height,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xff9CA3AF))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.endDate
                                                .toString()
                                                .split(' ')[0],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          IconButton(
                                              onPressed: () async {
                                                controller.endDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        firstDate:
                                                            DateTime(1970),
                                                        lastDate:
                                                            DateTime.now(),
                                                        initialDate:
                                                            DateTime.now());
                                                if (controller.startDate !=
                                                    null) {
                                                  controller.update();
                                                }
                                              },
                                              icon: const Icon(Icons.calendar_month)),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              );
                            }),
                        SizedBox(height: 0.04 * height),
                        InkWell(
                            onTap: ()async {
                             await editPortofolioConrtoller.editProfileSendData(bio: '', address: '', mobile: '',education: titleController.text,expriance: '');
                              educationAndExperienceController.setData(uni: universityController.text, tit: titleController.text);
                              if (completeProfileController.complete[1] == false) {
                                completeProfileController.changeComplete(index: 1);
                              }
                            },

                            child: buttonBottom(text: 'Save'))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 0.02 * height),



                GetBuilder<EducationController>(
                    builder: (controller) {
                      return
                        educationAndExperienceController.university !=null && educationAndExperienceController.title !=null ?
                        Container(

                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: const Color(0xffD1D5DB))),
                  child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [

                          Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2, color: const Color(0xffD1D5DB))),
                              child: Image.asset(
                                Assets.imagesUniversty,
                                width: 0.15 * width,

                              )),
                          SizedBox(width: 0.01*width),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.university!,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              SizedBox(height: 0.01*height,),
                              Text(controller.title!,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff6B7280))),
                              SizedBox(height: 0.01*height,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 0.6 *width,
                                      child: Text('${controller.startDate?.year.toString()} - ${controller.endDate?.year.toString()}',style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff6B7280)))),
                                  const Icon(Icons.edit,color: Color(0xff3366FF),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ):Container();}
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
