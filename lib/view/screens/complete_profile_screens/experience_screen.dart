import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/coplete_profile_controller.dart';
import '../../../controller/edit_portofolio_contoller.dart';
import '../../../controller/experience_controller.dart';
import '../../../generated/assets.dart';
import '../../widgets/global_widget.dart';

class ExperienceScreen extends StatelessWidget {
  ExperienceScreen({super.key});
  final CompleteProfileController completeProfileController = Get.find();
  final EditPortofolioConrtoller editPortofolioConrtoller = Get.put<EditPortofolioConrtoller>(EditPortofolioConrtoller());
  final TextEditingController positionController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController startYearController = TextEditingController();
  final  ExperienceController experienceController =Get.put<ExperienceController>(ExperienceController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: backArrow(),
        automaticallyImplyLeading: false,
        title: const Text(
          'Experience',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(0.05 * width),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: const Color(0xffD1D5DB))),
                  child: Padding(
                    padding: EdgeInsets.all(0.05 * width),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Position *',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9CA3AF)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        TextFormField(
                          controller: positionController,
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
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(width: 1))),
                            items: const [
                              DropdownMenuItem<String>(
                                  child: Text("Full Time")),
                            ],
                            onChanged: (v) {}),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        const Text(
                          'Company name *',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9CA3AF)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        TextFormField(
                          controller: companyNameController,
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
                          'Location',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9CA3AF)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        TextFormField(
                          controller: locationController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Color(0xff9CA3AF)),),
                              prefixIcon: const Icon(Icons.location_pin)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ), GetBuilder<ExperienceController>(builder: (logic) {
                          return Row(children: [
                            Checkbox(value: logic.checkbox, onChanged: (v){logic.changeCheck(v);}),
                            SizedBox(width: 0.01*width,),
                            const Text('I am currently working in this role'),
                          ],);
                        }),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        const Text(
                          'Start Year *',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9CA3AF)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        TextFormField(
                          controller: startYearController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 1, color: Color(0xff9CA3AF)))),
                        ),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        InkWell(
                            onTap: ()async {
                              await editPortofolioConrtoller.editProfileSendData(bio: '', address: '', mobile: '',education: '',expriance:  positionController.text);

                              if (completeProfileController.complete[2] == false) {
                                completeProfileController.changeComplete(index: 2);
                              }
                              Get.back();
                            },
                            child: buttonBottom(text: 'Save'))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 0.03 *height,),
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
                                    width: 0.15, color: const Color(0xffD1D5DB))),
                            child: Image.asset(
                              Assets.imagesGroup15495,
                              width: 0.15 * width,

                            )),
                        SizedBox(width: 0.01*width),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Senior UI/UX Designer',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                            SizedBox(height: 0.01*height,),
                            const Text('Remote • GrowUp Studio',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff6B7280))),
                            SizedBox(height: 0.01*height,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 0.6 *width,
                                    child: const Text('2019 - 2022',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff6B7280)))),
                                const Icon(Icons.edit,color: Color(0xff3366FF),)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
