import 'package:amit_final_project_1/constants/colors.dart';
import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/two_step_verficatio_controller.dart';
import '../../widgets/global_widget.dart';

class TwoStepVerification extends StatelessWidget {
  TwoStepVerification({super.key});

  final TwoStepVerificationController twoStepVerificationController =
      Get.put<TwoStepVerificationController>(TwoStepVerificationController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            onTap: () => twoStepVerificationController.index == 0 ? Get.back() : twoStepVerificationController.subIndex(),
            child: const Icon(Icons.arrow_back, color: Colors.black,)),
        automaticallyImplyLeading: false,
        title: const Text(
          'Two-step verification',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.05 * width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.03 * height,
              ),
              Container(
                width: double.infinity,
                height: height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: const Color(0xffD1D5DB))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 0.6 * width,
                          child: const Text(
                            'Secure your account with two-step verification',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff6B7280)),
                          )),
                      customSwitch()
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0.03 * height),
              SizedBox(
                height: 0.5 *height,
                child: GetBuilder<TwoStepVerificationController>(builder: (logic) {
                  return logic.index == 0
                      ? Column(
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                    radius: 0.08 * width,
                                    backgroundColor: const Color(0xffD6E4FF),
                                    child: const Icon(
                                      Icons.lock_open,
                                      color: ColorsM.mainColor,
                                    )),
                                SizedBox(
                                    width: 0.7 * width,
                                    child: const Text(
                                      'Two-step verification provides additional security by asking for a verification code every time you log in on another device.',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff6B7280)),
                                    ))
                              ],
                            ),
                            SizedBox(height: 0.03 * height),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                    radius: 0.08 * width,
                                    backgroundColor: const Color(0xffD6E4FF),
                                    child: const Icon(
                                      Icons.chrome_reader_mode,
                                      color: ColorsM.mainColor,
                                    )),
                                SizedBox(
                                    width: 0.7 * width,
                                    child: const Text(
                                      'Adding a phone number or using an authenticator will help keep your account safe from harm.',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff6B7280)),
                                    ))
                              ],
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Select a verification method',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 0.03 * height),
                            DropdownButtonFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(width: 1))),
                                items: const [
                                  DropdownMenuItem<String>(
                                      child: Text("Telephone number (SMS)"))
                                ],
                                onChanged: (v) {}),
                            SizedBox(height: 0.03 * height),
                            const Text(
                              'Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff6B7280)),
                            )
                          ],
                        );
                }),
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                  onTap: () => twoStepVerificationController.index == 1 ? Get.toNamed(Routes.twoStepVerification2Screen): twoStepVerificationController.addIndex(),
                  child: buttonBottom(text: 'Next')),
            ],
          ),
        ),
      ),
    );
  }
}
