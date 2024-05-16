import 'package:amit_final_project_1/constants/colors.dart';
import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controller/home_controller.dart';
import '../../controller/saved_contoller.dart';
import '../../controller/selected_job_controller.dart';

Widget carouselSlider() {
  HomeController getController =
      Get.put<HomeController>(HomeController(), permanent: true);
  SelectedJobController selectedController =
  Get.put<SelectedJobController>(SelectedJobController());
  double width = Get.width;
  double height = Get.height;
  return CarouselSlider.builder(
    itemCount: getController.jobData.length,
    options: CarouselOptions(
      height: 0.28 * height,
      autoPlay: false,
      padEnds: true,
      enableInfiniteScroll: false,
      viewportFraction: 0.85,
      onPageChanged: (index, reason) {
        getController.addPageNumber(index: index);
      },
    ),
    itemBuilder: (context, index, realIndex) => Padding(
      padding: EdgeInsets.only(left: 0.01 * height),
      child: Container(
        width: 0.9 * width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color:
        index==getController.pageNumber ?  const Color(0xff091A7A) : const Color(0xffF4F4F5)
        ),
        child: Padding(
          padding: EdgeInsets.all(0.04 * width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.08 * height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        child: Image.network(
                          getController.jobData[index]!.image!,
                          width: 0.15 * width,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 0.33 * width,
                          child: Text(
                            getController.jobData[index]!.name!,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                            width: 0.2 * width,
                            child: Text(
                              '${getController.jobData[index]!.compName!} •${getController.jobData[index]!.location?.split(',')[getController.jobData[index]!.location!.split(',').length - 2]} '
                              ,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )),
                      ],
                    ),

                    GetBuilder<SavedController>(
                      builder: (controller) =>  IconButton(
                          onPressed: () async{
                            if(!controller.showSavedJobs.data!.any((element) => element.jobId == getController.jobData[index]!.id!)){
                              await controller.addToSave(jobId: getController.jobData[index]!.id!.toString());
                            }else{
                              controller.deleteSaved(id: controller.showSavedJobs.data![controller.showSavedJobs.data!.indexWhere((element) => element.jobId == getController.jobData[index]!.id!)].id.toString());
                            }
                          }, icon: Icon(Iconsax.save_2,color: controller.showSavedJobs.data!.any((element) => element.jobId == getController.jobData[index]!.id!) ? ColorsM.mainColor : Colors.white,)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 0.03 * height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index==getController.pageNumber ? const Color(0xff265E70FF) : const Color(0xffD6E4FF)),
                    child: Center(
                      child: Padding(
                     padding :    EdgeInsets.only(left:  0.03 * width,right:0.03 * width,bottom: 0.02 * width, top: 0.02 * width,),
                        child: Text(
                          getController.jobData[index]!.jobType!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index==getController.pageNumber ? const Color(0xff265E70FF) : const Color(0xffD6E4FF)),
                    child: Center(
                      child: Padding(
                        padding :    EdgeInsets.only(left:  0.03 * width,right:0.03 * width,bottom: 0.02 * width, top: 0.02 * width,),
                        child: Text(
                          getController.jobData[index]!.jobTimeType!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index==getController.pageNumber ? const Color(0xff265E70FF) : const Color(0xffD6E4FF)),
                    child: Center(
                      child: Padding(
                        padding :    EdgeInsets.only(left:  0.03 * width,right:0.03 * width,bottom: 0.02 * width, top: 0.02 * width,),
                        child: Text(
                          getController.jobData[index]!.compName!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.03 * height,
              ),
              Container(
                height: 0.05 * height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Text('${int.parse(getController.jobData[index]!.salary!) / 1000}K',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: Colors.white)),
                      const Text('/Month',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.white)),
                    ],),

                    Container(
                        width: 0.28 * width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorsM.mainColor),
                        child: TextButton(
                          onPressed: () {
                            selectedController.selectedData = getController.jobData[index]!;
                            Get.toNamed(Routes.applyJobScreen);
                          },
                          child: const Text(
                            'Apply',
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
// getController.jobData[index]!.image!
Widget typeWidget({required String name}){
  double width = Get.width;

  return Padding(
    padding: EdgeInsets.all(0.004 * width),
    child: Container(
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(15),
        color: const Color(0xffD6E4FF),
      ),
      child: Center(
          child: Padding(
            padding:
            EdgeInsets.only(left:  0.04 * width,right:0.04 * width,bottom: 0.02 * width, top: 0.02 * width,),
            child: Text(name
               ,
                style: const TextStyle(fontSize: 11,color: Color(0xff3366FF))),
          )),
    ),
  );
}