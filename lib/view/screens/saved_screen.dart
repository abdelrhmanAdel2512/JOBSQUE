import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:amit_final_project_1/generated/assets.dart';
import 'package:amit_final_project_1/model/all_job_model.dart';
import 'package:amit_final_project_1/view/widgets/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controller/appbar_controller.dart';
import '../../controller/saved_contoller.dart';
import '../../controller/selected_job_controller.dart';

class SavedScreen extends StatelessWidget {
  SavedScreen({super.key});

  final SavedController savedController =
      Get.put<SavedController>(SavedController(), permanent: true);
   AppbarController appbarController =
      Get.put<AppbarController>(AppbarController());
  final SelectedJobController selectedJobController =
  Get.put<SelectedJobController>(SelectedJobController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            onTap: () => appbarController.changeTabIndex(0),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        automaticallyImplyLeading: false,
        title: const Text(
          'Saved',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: GetBuilder<SavedController>(
        builder: (controller) => savedController.isLoading == false
            ? Column(
                children: [
                  savedController.showSavedJobs.data!.isNotEmpty
                      ? Column(
                          children: [
                            Container(

                              width: double.infinity,
                              color: const Color(0xffE5E7EB),
                              child: Center(
                                child: Text(
                                    ' ${savedController.showSavedJobs.data!.length} job saved'),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  savedController.showSavedJobs.data!.length,
                              itemBuilder: (context, index) => SizedBox(

                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.all(0.03 * width),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    15,
                                                  ),
                                                  child: Image.network(
                                                    savedController
                                                        .showSavedJobs
                                                        .data![index]
                                                        .jobs!
                                                        .image!,
                                                    width: 0.15 * width,
                                                  )),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 0.03 * width),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      savedController
                                                          .showSavedJobs
                                                          .data![index]
                                                          .jobs!
                                                          .name!,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18),
                                                    ),
                                                    Text(
                                                      '${savedController.showSavedJobs.data![index].jobs!.compName!} •${savedController.showSavedJobs.data![index].jobs!.location?.split(',')[savedController.showSavedJobs.data![index].jobs!.location!.split(',').length - 2]} , ${savedController.showSavedJobs.data![index].jobs!.location?.split(',').last}',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                Get.bottomSheet(Container(
                                                  height: 0.35 * height,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(20),
                                                      topLeft:
                                                          Radius.circular(20),
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      buttonSheetField(
                                                          text: 'Apply Job',
                                                          icon: Icons
                                                              .shopping_bag_outlined),
                                                      buttonSheetField(
                                                          text: 'Share via...',
                                                          icon:
                                                              Icons.ios_share),
                                                      InkWell(
                                                          onTap: () {
                                                            Get.back();
                                                            savedController.deleteSaved(
                                                                id: savedController
                                                                    .showSavedJobs
                                                                    .data![
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                          },
                                                          child: buttonSheetField(
                                                              text:
                                                                  'Cancel save',
                                                              icon: Iconsax
                                                                  .save_remove)),
                                                    ],
                                                  ),
                                                ));
                                              },
                                              icon: const Icon(
                                                  Icons.more_horiz_outlined))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.02 * height,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Posted 2 days ago'),
                                          Text('Be an early applicant'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.02 * height,
                                      ),
                                      const Divider(
                                        height: 1,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 0.25 * height,
                            ),
                            Image.asset(Assets.iconsSavedIlustration),
                            SizedBox(
                              height: 0.03 * height,
                            ),
                            const Center(
                                child: Text(
                              'Nothing has been saved yet',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            )),
                            SizedBox(
                              height: 0.01 * height,
                            ),
                            const Center(
                                child: Text(
                              'Press the star icon on the job you want to save.',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ))
                          ],
                        ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ))),
    );
  }
}
