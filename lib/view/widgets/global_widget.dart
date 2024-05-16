import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/colors.dart';
import '../../controller/home_controller.dart';
import '../../controller/phone_and_password_controller.dart';
import '../../controller/saved_contoller.dart';
import '../../controller/selected_job_controller.dart';

import '../../model/all_job_model.dart';

import 'home_widget.dart';

Widget backArrow() {
  return InkWell(
      onTap: () => Get.back(),
      child: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ));
}

Widget jobView({
  required page,
  required location,
  required Data data,
  required width,
  required height,
  required image,
  required name,
  required compName,
  required jobType,
  required jobTimeType,
  required salary,
  required id,
}) {
  SavedController savedController =
      Get.put<SavedController>(SavedController(), permanent: true);
  SelectedJobController selectedJobController =
      Get.put<SelectedJobController>(SelectedJobController());
  return InkWell(
    onTap: () {
      Get.toNamed(
        page,
      );
      selectedJobController.selectedData = data;
    },
    child: Padding(
      padding: EdgeInsets.all(0.01 * width),
      child: Column(
        children: [
          SizedBox(
            height: 0.12 * height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        child: Image.network(
                          image,
                          width: 0.15 * width,
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 0.015 * width, top: 0.03 * height),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '${compName!} •${location.split(',')[location.split(',').length - 2]} , ${location.split(',').last}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                GetBuilder<SavedController>(
                  builder: (controller) => IconButton(
                      onPressed: () async {
                        if (!savedController.showSavedJobs.data!
                            .any((element) => element.jobId == id)) {
                          await savedController.addToSave(jobId: id.toString());
                        } else {
                          savedController.deleteSaved(
                              id: savedController
                                  .showSavedJobs
                                  .data![savedController.showSavedJobs.data!
                                      .indexWhere(
                                          (element) => element.jobId == id)]
                                  .id
                                  .toString());
                        }
                      },
                      icon: Icon(
                        Iconsax.save_2,
                        color: savedController.showSavedJobs.data!
                                .any((element) => element.jobId == id)
                            ? ColorsM.mainColor
                            : Colors.black,
                      )),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  typeWidget(name: jobType),
                  typeWidget(name: jobTimeType),
                  typeWidget(name: compName),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${int.parse(salary) / 1000}K',
                    style: const TextStyle(
                        color: Color(0xff2E8E18),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text('/Month'),
                ],
              )
            ],
          ),
          SizedBox(
            height: 0.01 * height,
          ),
          SizedBox(
            width: width,
            child: const Divider(
              height: 0,
              color: Colors.black,
              thickness: 0,
              indent: 0,
              endIndent: 0,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget textField({required controller, required icon}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 10))),
  );
}

Widget filterChipsJobFilter({required String text, required int index}) {
  dynamic tempController = Get.find<HomeController>();
  return FilterChip(
    label: Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: tempController.jobTypeFilter[index]
            ? Colors.white
            : Colors.grey[800],
      ),
    ),
    onSelected: (bool value) {
      tempController.jobTypeFilter[index] =
          !tempController.jobTypeFilter[index];
      if (index < 3) {
        tempController.jobTypeFilter[index + 3] = false;
      } else {
        tempController.jobTypeFilter[index - 3] = false;
      }
      tempController.update();
      debugPrint(index.toString());
    },
    shape: RoundedRectangleBorder(
      side: BorderSide(
          color: tempController.jobTypeFilter[index]
              ? const Color(0x6E0034D9)
              : Colors.grey[500]!,
          width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: tempController.jobTypeFilter[index]
        ? const Color(0x6E0034D9)
        : Colors.transparent,
  );
}

Widget applyJob(
    {required text,
    required downText,
    required borderColor,
    required textColor,
    required backgroundColor}) {
  double width = Get.width;
  double height = Get.height;
  return Column(
    children: [
      Container(
        width: 0.18 * width,
        height: 0.08 * height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 1, color: borderColor),
            color: backgroundColor),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 20, color: textColor),
        )),
      ),
      Padding(
        padding: EdgeInsets.only(top: 0.06 * width),
        child: Text(
          downText,
          style: TextStyle(color: borderColor),
        ),
      )
    ],
  );
}

Widget separatorWords({required String text}) {
  double width = Get.width;
  double height = Get.height;
  return Container(
    width: double.infinity,
    height: 0.03 * height,
    color: const Color(0xffE5E7EB),
    child: Padding(
      padding: EdgeInsets.only(left: 0.05 * width),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xff6B7280)),
      ),
    ),
  );
}

Widget buttonBottom({required text}) {
  double width = Get.width;
  double height = Get.height;
  return Container(
    width: 0.9 * width,
    height: 0.07 * height,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), color: ColorsM.mainColor),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    ),
  );
}

Widget customSwitch() {
  return GetBuilder<PhoneAndPasswordController>(
      init: PhoneAndPasswordController(),
      builder: (logic) {
        return FlutterSwitch(
          width: 60,
          height: 30,
          toggleSize: 15,
          value: logic.isSwitched,
          borderRadius: 30.0,
          onToggle: (val) {
            logic.changeIsSwitched(val);
          },
        );
      });
}

Widget passwordTextField({required controller, required name, required num}) {
  PhoneAndPasswordController getController = Get.find();
  return TextFormField(
    obscureText: num == 1
        ? getController.obscureText1
        : num == 2
            ? getController.obscureText2
            : getController.obscureText3,
    controller: controller,
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Colors.black),
        ),
        prefixIcon: const Icon(Icons.lock),
        hintText: name,
        suffixIcon: InkWell(
          onTap: () {
            {
              num == 1
                  ? getController.changeObscureText1()
                  : num == 2
                      ? getController.changeObscureText2()
                      : getController.changeObscureText3();
            }
          },
          child: (num == 1
                  ? getController.obscureText1
                  : num == 2
                      ? getController.obscureText2
                      : getController.obscureText3)
              ? const Icon(
                  Icons.visibility_off_outlined,
                  color: ColorsM.iconColor,
                )
              : const Icon(
                  Icons.visibility_outlined,
                  color: ColorsM.iconColor,
                ),
        )),
  );
}

Widget buttonSheetField({required text, required icon}) {
  double width = Get.width;
  double height = Get.height;
  return Column(
    children: [
      SizedBox(
        height: 0.02 * height,
      ),
      Container(
        width: 0.9 * width,
        height: 0.06 * height,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 0.04 * width, left: 0.04 * width),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                  SizedBox(width: 0.04 * width),
                  Text(
                    text,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  )
                ],
              ),
              const Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
      )
    ],
  );
}
