import 'package:amit_final_project_1/constants/colors.dart';
import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:amit_final_project_1/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../controller/saved_contoller.dart';
import '../widgets/global_widget.dart';
import '../widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

 final HomeController getController =
      Get.put<HomeController>(HomeController(), permanent: true);
 final SavedController savedController = Get.put<SavedController>(SavedController(),permanent: true);
  @override
  Widget build(BuildContext context) {

    double width = Get.width;
    double height = Get.height;
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: controller.isLoading == false? SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text('Hi, ${sharedPreferences.read('name')}👋',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400)),
                          const Text('Create a better future for yourself here',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w200))
                        ],
                      ),
                      Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(
                              side:
                                  BorderSide(color: Colors.black12, width: 2)),
                        ),
                        child: IconButton(
                          onPressed: () {Get.toNamed(Routes.notificationScreen);},
                          icon: const Icon(Icons.notifications_none_outlined,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  InkWell(
                    onTap:() => Get.toNamed(Routes.searchScreen),
                    child: Container(
                      width: 0.8 * width,
                      height: 0.05 * height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0.02 * width),
                        child: const Row(
                          children: [Icon(Icons.search), Text('search...')],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.03 * height,
                  ),
                  Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Suggested Job', style: TextStyle(fontSize: 18)),
                          Text('View all',
                              style: TextStyle(color: ColorsM.mainColor)),
                        ],
                      ),
                      SizedBox(
                        height: 0.02 * height,
                      ),

                           carouselSlider()
                          ,
                      SizedBox(height: 0.01* height,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Job',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'View all',
                            style: TextStyle(color: ColorsM.mainColor),
                          )
                        ],
                      ),

                      ListView.builder(

                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.jobData.length,
                        itemBuilder: (context, index) => jobView(
                          page: Routes.jobDetailScreen,
                            data: controller.jobData[index]!,
                            location: controller.jobData[index]!.location,
                            id: controller.jobData[index]!.id,
                            width: width,
                            height: height,
                            image: controller.jobData[index]!.image,
                            name: controller.jobData[index]!.name,
                            compName: controller.jobData[index]!.compName,
                            jobType: controller.jobData[index]!.jobType,
                            jobTimeType: controller.jobData[index]!.jobTimeType,
                            salary:controller.jobData[index]!.salary),

                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ):const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
