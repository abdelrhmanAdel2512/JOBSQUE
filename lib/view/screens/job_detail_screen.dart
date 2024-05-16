import 'package:amit_final_project_1/constants/colors.dart';
import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../controller/job_detail_controller.dart';
import '../../controller/saved_contoller.dart';
import '../../controller/selected_job_controller.dart';
import '../widgets/global_widget.dart';
import 'package:iconsax/iconsax.dart';
import '../widgets/home_widget.dart';
class JobDetailScreen extends StatelessWidget {
  JobDetailScreen({super.key});

  final JocDetailController getController =
      Get.put<JocDetailController>(JocDetailController());
  final SelectedJobController selectedJobController = Get.put<SelectedJobController>(SelectedJobController());
  final SavedController savedController = Get.put<SavedController>(SavedController(),);
  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    getController.jobdeatil = selectedJobController.selectedData;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:
        backArrow(),
        automaticallyImplyLeading: false,
        title: const Text(
          'Job Detail',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black),
        ),
        actions: [GetBuilder<SavedController>(
          builder: (controller) =>  IconButton(
              onPressed: () async{
                if(!savedController.showSavedJobs.data!.any((element) => element.jobId == getController.jobdeatil.id!)){
                  await savedController.addToSave(jobId: getController.jobdeatil.id!.toString());
                }else{
                  savedController.deleteSaved(id: savedController.showSavedJobs.data![savedController.showSavedJobs.data!.indexWhere((element) => element.jobId == getController.jobdeatil.id!)].id.toString());
                }
              }, icon: Icon(Iconsax.save_2,color:  controller.showSavedJobs.data!.any((element) => element.jobId == getController.jobdeatil.id!) ? ColorsM.mainColor : Colors.black,)),
        )],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: SizedBox(
        width: width * 0.9,
        height: 50,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: const Color(0xff3366FF),
          onPressed: () {Get.toNamed(Routes.applyJobScreen);},
          child: const Text(
            'Apply now',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(0.03 * width),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    getController.jobdeatil.image!,
                    width: 0.2 * width,
                  )),
              SizedBox(
                height: 0.03 * height,
              ),
              Text(
                getController.jobdeatil.name!,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              Text(
                  '${getController.jobdeatil.compName!} •${getController.jobdeatil.location?.split(',')[getController.jobdeatil.location!.split(',').length - 2]} , ${getController.jobdeatil.location?.split(',').last}'),
              SizedBox(
                height: 0.03 * height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  typeWidget(name: getController.jobdeatil.jobType!),
                  typeWidget(name: getController.jobdeatil.jobTimeType!),
                  typeWidget(name: getController.jobdeatil.compName!),
                ],
              ),
              SizedBox(
                height: 0.03 * height,
              ),
              ToggleSwitch(
                minWidth: width * 0.29,
                cornerRadius: 20.0,
                activeBgColors: const [
                  [Color(0xff02337A)],
                  [Color(0xff02337A)],
                  [Color(0xff02337A)]
                ],
                inactiveFgColor: const Color(0xff6B7280),
                inactiveBgColor: const Color(0xffF4F4F5),
                activeFgColor: Colors.white,
                initialLabelIndex: 0,
                totalSwitches: 3,
                labels: const ['Desicription', 'Company', 'People'],
                radiusStyle: true,
                onToggle: (index) {
                  getController.changeIndex(indexed: index!);
                },
              ),
              SizedBox(
                height: 0.03 * height,
              ),
              GetBuilder<JocDetailController>(
                builder: (controller) => controller.index == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Job Description',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 0.01 * height,
                          ),
                          Text(
                            controller.jobdeatil.jobDescription!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 0.03 * height,
                          ),
                          const Text(
                            'Skill Required',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 0.01 * height,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.jobdeatil.jobSkill
                                ?.split(',')
                                .length,
                            itemBuilder: (context, index) => Text(
                              '• ${controller.jobdeatil.jobSkill!.split(',')[index]}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      )
                    : controller.index == 1
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Contact Us',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xffE5E7EB))),
                                    width: 0.45 * width,
                                    height: 0.1 * height,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text('Email'),
                                        Text(
                                          controller.jobdeatil.compEmail!,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xffE5E7EB))),
                                    width: 0.45 * width,
                                    height: 0.1 * height,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text('Website'),
                                        Text(
                                          controller.jobdeatil.compWebsite!,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 0.03 * height,
                              ),
                              const Text(
                                'About Company',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 0.015 * height,
                              ),
                              Text(
                                controller.jobdeatil.aboutComp!,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.employees.length} Employees For',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Text('UI/UX Deign')
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.03* height),

                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.employees.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.all(0.03 * width),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                  controller.employees[index]
                                                      ['image']!,
                                                  width: 0.1 * width),
                                              SizedBox(
                                                width: 0.04 * width,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      controller.employees[
                                                          index]['name']!,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16)),
                                                  Text(controller
                                                          .employees[index]
                                                      ['position']!),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const Text('Work during'),
                                              Text(
                                                '${controller.employees[index]['duration']} Years',
                                                style: const TextStyle(
                                                    color: ColorsM.mainColor),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 0.02* height,),
                                      const Divider(
                                        height: 1,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 0.08* height,)
                            ],
                          ),
              )
            ],
          ),
        ),
      )),
    );
  }
}