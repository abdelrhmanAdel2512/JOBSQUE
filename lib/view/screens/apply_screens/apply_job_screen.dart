import 'package:amit_final_project_1/constants/colors.dart';
import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:amit_final_project_1/generated/assets.dart';
import 'package:amit_final_project_1/view/widgets/global_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../controller/applied_contoller.dart';
import '../../../controller/selected_job_controller.dart';


class ApplyJobScreen extends StatelessWidget {
  const ApplyJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;

    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    SelectedJobController selectedJobController =
        Get.put<SelectedJobController>(SelectedJobController());
    AppliedController appliedController =
    Get.put<AppliedController>(AppliedController());
    return Scaffold(

      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              if (appliedController.isLoading == false) {
                appliedController.currentPage == 0
                    ? Get.back()
                    : appliedController.subCurrentPage();
              }
            },
            child: const Icon(Icons.arrow_back,color: Colors.black,)),
        automaticallyImplyLeading: false,
        title: const Text(
          'Apply Job',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: GetBuilder<AppliedController>(
          init: AppliedController(),
          builder: (controller) => Padding(
            padding: EdgeInsets.all(0.04 * width),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    applyJob(
                        text: controller.currentPage == 0 ? '1 ' : '✓',
                        borderColor: ColorsM.mainColor,
                        downText: 'Biodata',
                        textColor: controller.currentPage == 0
                            ? ColorsM.mainColor
                            : Colors.white,
                        backgroundColor: controller.currentPage == 0
                            ? Colors.white
                            : ColorsM.mainColor),
                    Text(
                      '--------',
                      style: TextStyle(
                          color: controller.currentPage >= 1
                              ? ColorsM.mainColor
                              : Colors.grey),
                    ),
                    applyJob(
                        text: controller.currentPage <= 1 ? '2' : '✓',
                        borderColor: controller.currentPage == 0
                            ? const Color(0xff9CA3AF)
                            : ColorsM.mainColor,
                        downText: 'Type of work',
                        textColor: controller.currentPage == 1
                            ? ColorsM.mainColor
                            : controller.currentPage == 2
                                ? Colors.white
                                : Colors.grey,
                        backgroundColor: controller.currentPage <= 1
                            ? Colors.white
                            : ColorsM.mainColor),
                    Text(
                      '--------',
                      style: TextStyle(
                          color: controller.currentPage == 2
                              ? ColorsM.mainColor
                              : Colors.grey),
                    ),
                    applyJob(
                        text: '3',
                        borderColor: controller.currentPage == 2
                            ? ColorsM.mainColor
                            : Colors.grey,
                        downText: 'Upload portfolio',
                        textColor: controller.currentPage == 2
                            ? ColorsM.mainColor
                            : Colors.grey,
                        backgroundColor: Colors.white),
                  ],
                ),
                SizedBox(
                  height: 0.03 * height,
                ),
                controller.currentPage == 0
                    ? SizedBox(

                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Biodata',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: 0.01 * height,
                            ),
                            const Text('Fill in your bio data correctly',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16)),
                            SizedBox(
                              height: 0.03 * height,
                            ),
                            const Text(
                              'Full Name*',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 0.01 * height,
                            ),
                            TextFormField(

                              controller: fullNameController,
                              decoration: InputDecoration(
                                  hintText: 'Full Name',
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 0.03 * height,
                            ),
                            const Text(
                              'Email*',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 0.01 * height,
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 0.03 * height,
                            ),
                            const Text(
                              'No.Handphone*',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 0.01 * height,
                            ),
                            IntlPhoneField(

                              controller: phoneNumberController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                              initialCountryCode: 'EG',
                              onChanged: (phone) {
                              },
                            ),
                            SizedBox(
                              height: 0.01 * height,
                            ),
                          ],
                        ),
                      )
                    : controller.currentPage == 1
                        ? SizedBox(
                  height: 0.61* height,
                            width: double.infinity,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Type of work',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    height: 0.01 * height,
                                  ),
                                  const Text('Fill in your bio data correctly',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16)),
                                  SizedBox(
                                    height: 0.03 * height,
                                  ),
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.typeOfWorkList.length,
                                    itemBuilder: (context, index) => Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      controller.typeOfWorkList[
                                                                  index] ==
                                                              controller
                                                                  .typeOfWork
                                                          ? const Color(0xff3366FF)
                                                          : const Color(
                                                              0xffD1D5DB)),
                                              color: controller
                                                              .typeOfWorkList[
                                                          index] ==
                                                      controller.typeOfWork
                                                  ? const Color(0xffD6E4FF)
                                                  : Colors.transparent),
                                          height: 0.1 * height,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  children: [
                                                    Text(
                                                      controller
                                                              .typeOfWorkList[
                                                          index],
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16),
                                                    ),
                                                    const Text(
                                                      'CV.pdf  Portfolio.pdf ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight
                                                                  .w300),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Radio(
                                                value: controller
                                                    .typeOfWorkList[index],
                                                groupValue:
                                                    controller.typeOfWork,
                                                onChanged: (value) {
                                                  controller.setTypeOfWork(
                                                      type: value);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.017 * height,
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                          )
                        : SizedBox(
                            height: 0.61 * height,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Upload portfolio',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 0.01 * height,
                                ),
                                const Text('Fill in your bio data correctly',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16)),
                                SizedBox(
                                  height: 0.03 * height,
                                ),
                                const Text('Upload CV*'),
                                SizedBox(
                                  height: 0.01 * height,
                                ),
                                Container(
                                  height: 0.1 * height,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: const Color(0xffD1D5DB),
                                          width: 1)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(Assets.iconsLogo),
                                          SizedBox(
                                            width: 0.02 * width,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller.fileName ??
                                                    'Empty',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                'CV.pdf ${controller.fileSize ?? '0'} B',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              await controller.filePacker();
                                            },
                                            child: const Icon(Icons.edit),
                                          ),
                                          SizedBox(
                                            width: 0.03 * width,
                                          ),
                                          const InkWell(
                                            child:
                                                Icon(Icons.highlight_remove),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 0.02 * height,
                                ),
                                DottedBorder(
                                  borderType: BorderType.RRect,
                                  strokeCap: StrokeCap.butt,
                                  strokeWidth: 1,
                                  color: const Color(0xff6690FF),
                                  radius: const Radius.circular(10),
                                  child: Container(
                                    color: const Color(0xffECF2FF),
                                    width: double.infinity,
                                    height: 0.35 * height,
                                    child: Padding(
                                      padding: EdgeInsets.all(0.02 * height),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                              Assets.iconsDocumentUpload),
                                          const Text(
                                            'Upload your other file',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18),
                                          ),
                                          const Text(
                                            'Max. file size 10 MB',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await controller.filePacker2();
                                            },
                                            child: Container(
                                              height: 0.06 * height,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffD6E4FF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50),
                                                  border: Border.all(
                                                      color:
                                                          const Color(0xff6690FF),
                                                      width: 1)),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .file_upload_outlined,
                                                      color:
                                                          Color(0xff6690FF)),
                                                  Text(
                                                    'Add file',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        color: Color(
                                                            0xff6690FF)),
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
                              ],
                            ),
                          ),
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: () async {
                    if (controller.currentPage == 2 &&
                        fullNameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        phoneNumberController.text.isNotEmpty) {
                      await controller.applyApi(
                          cvFile: controller.file!,
                          name: fullNameController.text,
                          email: emailController.text,
                          mobile: phoneNumberController.text,
                          workType:
                              selectedJobController.selectedData.jobType!,
                          otherFile: controller.file2!,
                          jobsId: selectedJobController.selectedData.id!,
                          );
                      if (controller.applyModel.status == true) {
                        Get.toNamed(Routes.applySuccessful);
                      } else {
                        Get.snackbar('error', 'error');
                      }
                    } else {
                      controller.addCurrentPage();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: controller.isLoading == false
                          ? ColorsM.mainColor
                          : Colors.grey,
                    ),
                    height: 0.06 * height,
                    child: Center(
                      child: controller.isLoading == false
                          ? Text(
                              controller.currentPage == 2 ? 'Submit' : 'Next')
                          : const CircularProgressIndicator(),
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
