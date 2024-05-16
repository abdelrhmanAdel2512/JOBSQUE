import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../constants/colors.dart';
import '../../../controller/appbar_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../controller/saved_contoller.dart';
import '../../../controller/selected_job_controller.dart';
import '../../../controller/show_apply_controller.dart';
import '../../../generated/assets.dart';
import '../../widgets/home_widget.dart';
class AppliedScreen extends StatelessWidget {
   AppliedScreen({super.key});

   SavedController savedController =
   Get.put<SavedController>(SavedController(), permanent: true);
  AppliedJobController jobController = Get.put(AppliedJobController());
   SelectedJobController selectedJob = Get.put(SelectedJobController());
   HomeController homeController =
  Get.put<HomeController>(HomeController());
   final AppbarController appbarController =
   Get.put<AppbarController>(AppbarController());
  @override
  Widget build(BuildContext context) {
    final w = Get.width;
    final h = Get.height;
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
          'Applied Job',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: jobController.isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                ToggleSwitch(
                  minWidth: w * 0.4,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [Color(0xff091A7A)],
                    [Color(0xff091A7A)]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Color(0xffF4F4F5),
                  inactiveFgColor: Color(0xff6B7280),
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: ['Active', 'Rejected'],
                  radiusStyle: true,
                  onToggle: ( index) {
                    jobController.changeJobStatus(index!);
                  },
                ),
                SizedBox(
                  height: 20,
                ),

                GetBuilder<AppliedJobController>(
                    builder: (controller)=>
                    controller.activeJob==0?
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.grey[200],
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child:  Text(
                              'Applied Jobs',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6B7280),

                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 3,//jobController.model!.data!.length,
                            itemBuilder: (context,index)=>
                            // homeController.jobData!.any((element) => element?.id != jobController.model.data![index])?
                            // !homeController.jl.data!.any((element) => element.id == jobController.model!.data![index].jobsId)?
                            // homeController.jl.data!.firstWhere((element) => element.id == jobController.model!.data![index].jobsId)?
                            //     null:
                            InkWell(
                              onTap: (){
                                selectedJob.selectedData =homeController.jobData[index]!;
                                Get.toNamed(Routes.reAppliedScreen);
                              },
                              child: Column(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Column(children: [
                                              Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(15),
                                                    child: Image.network(
                                                      homeController.jobData[index]!
                                                          .image!,
                                                      height: 70,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        left: 10),
                                                    child: Container(
                                                      width: 200,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            homeController.jobData[index]!
                                                                .name!,

                                                            // textAlign: TextAlign.center,
                                                            style:
                                                            TextStyle(
                                                              fontSize:
                                                              18,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              color: Colors
                                                                  .black,
                                                            ),
                                                          ),
                                                          Text(
                                                            homeController.jobData[index]!
                                                                .compName! +" • "+ homeController.jobData[index]!.location!.split(', ')[homeController.jobData[index]!.location!.split(', ').length-2]+", "+homeController.jobData[index]!.location!.split(', ')[homeController.jobData[index]!.location!.split(', ').length-3],
                                                            style:
                                                            TextStyle(
                                                              fontSize:
                                                              14,
                                                              color: Color(
                                                                  0xff374151),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ]),
                                            GetBuilder<SavedController>(
                                              builder: (controller) =>
                                                  IconButton(
                                                    icon: Icon(
                                                        Iconsax.save_2,
                                                        color: controller.showSavedJobs.data!.any((element) => element.jobId == homeController.jobData[index]!.id) ?ColorsM.mainColor : Colors.black


                                                       ,
                                                    ),
                                                    onPressed: () async{

                                                      if(controller.showSavedJobs.data!=null)
                                                        if(!controller.showSavedJobs.data!.any((element) => element.jobId == homeController.jobData[index]!.id)){
                                                          await controller.addToSave(jobId:  homeController.jobData[index]!.id.toString(),);
                                                        }else{
                                                          await controller.deleteSaved(id: controller.showSavedJobs.data![controller.showSavedJobs.data!.indexWhere((element) => element.jobId == homeController.jobData[index]!.id)].id.toString(), );
                                                        }



                                                      selectedJob.update();


                                                    },
                                                  ),
                                            ),
                                          ]),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              typeWidget(name: homeController.jobData[index]!.jobTimeType!),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              typeWidget(name: homeController.jobData[index]!.jobType!),


                                            ],
                                          ),
                                          Text('Posted 2 days ago',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff6B7280),
                                              )
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                // color: index >= 0
                                                //     ? Color(0xff3366FF)
                                                //     : Colors.grey,
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: index >= 0
                                                      ? Color(0xff3366FF)
                                                      : Colors.grey,
                                                  border: Border.all(
                                                      color: index >= 0
                                                          ? Color(0xff3366FF)
                                                          : Colors.grey),
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    index > 0 ? '✓':'1',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w500,
                                                      color:index > 0?
                                                      Colors.white :
                                                      index != 0?
                                                      Color(0xff3366FF) : Colors.white,

                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('Biodata',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color:index >= 0?
                                                    Color(0xff3366FF) : Colors.grey,

                                                  )),
                                            ],
                                          ),
                                          Text('.....',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color:index >= 1
                                                    ? Color(0xff3366FF)
                                                    : Colors.grey,
                                              )),
                                          Column(
                                            children: [
                                              Container(
                                                // color: index >= 0
                                                //     ? Color(0xff3366FF)
                                                //     : Colors.grey,
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: index >= 1
                                                      ? Color(0xff3366FF)
                                                      : Colors.transparent,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: index >= 1
                                                          ? Color(0xff3366FF)
                                                          : Colors.grey),
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    index > 1 ? '✓':'2',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w500,
                                                      color:index >= 1?
                                                      Colors.white : index<1? Colors.grey:
                                                      Color(0xff3366FF) ,

                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('Type of work',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color:index < 1?
                                                    Colors.grey:
                                                    Color(0xff3366FF) ,

                                                  )),
                                            ],
                                          ),
                                          Text('.....',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color:index >= 2
                                                    ? Color(0xff3366FF)
                                                    : Colors.grey,
                                              )),
                                          Column(
                                            children: [
                                              Container(
                                                // color: index >= 0
                                                //     ? Color(0xff3366FF)
                                                //     : Colors.grey,
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                      width: 1,
                                                      color : Colors.grey),
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    index > 2 ? '✓':'3',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('Type of work',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey,

                                                  )),
                                            ],
                                          ),

                                        ],

                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  index != homeController.jobData.length - 1
                                      ? const Divider(
                                    color: Color(0xffc4c4c4),
                                    height: 2,
                                    thickness: 2,
                                    indent: 5,
                                    endIndent: 5,
                                  )
                                      : const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),

                          ),
                        )
                      ],
                    )
                        :
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 0.2 * h,
                          ),
                          Image.asset(
                            Assets.imagesShoopeLogo,
                            height: 0.2 * h,
                          ),
                          SizedBox(
                            height: 0.05 * h,
                          ),
                          Text(
                            'No applications were rejected',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          SizedBox(
                            height: 0.02 * h,
                          ),
                          Text(
                            'If there is an application that is rejected by the ',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 16),
                          ),
                          Text(
                            'company it will appear here',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 16),
                          ),
                          TextButton(onPressed: (){
                            jobController.getAppliedJob();
                          }, child: Text('string'))
                        ],
                      ),

                    )
                )



              ],
            )
        ),
      ),
    );
  }
}
