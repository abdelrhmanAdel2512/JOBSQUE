import 'package:amit_final_project_1/constants/colors.dart';
import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:amit_final_project_1/view/widgets/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../generated/assets.dart';


class SearchedJobScreen extends StatelessWidget {
  SearchedJobScreen({super.key, this.dropdownValue});

 final TextEditingController jobTitleController = TextEditingController();
 final TextEditingController locationController = TextEditingController();

 late final dynamic dropdownValue ;
  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (controller) => Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back)),
                      Container(
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.search),
                                  Text(controller.searchName),
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.searchScreen);
                                  },
                                  child: const Icon(Icons.highlight_remove))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding:  EdgeInsets.all(0.01 * width),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                      topRight: Radius.circular(35)),

                                ),
                                backgroundColor: Colors.white,
                                SizedBox(
                                  height: 0.9 * height,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              MediaQuery.of(context).viewInsets.bottom),
                                      child: SizedBox(
                                        height: 0.9 * height,
                                        child: Padding(
                                          padding: EdgeInsets.all(0.05 * width),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 0.03 * height,
                                              ),
                                               Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Icon(Icons.arrow_back),
                                                  const Text(
                                                    'Set Filter',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 20),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      locationController.clear();
                                                      jobTitleController.clear();
                                                    },
                                                    child: const Text('Reset',
                                                        style: TextStyle(
                                                            color: ColorsM.mainColor)),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 0.03 * height,
                                              ),
                                              const Text(
                                                'Job Tittle ',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              SizedBox(
                                                height: 0.01 * height,
                                              ),
                                              textField(
                                                  controller: jobTitleController,
                                                  icon: Icons.work_outline),
                                              const Text(
                                                'Location',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              SizedBox(
                                                height: 0.01 * height,
                                              ),
                                              textField(
                                                  controller: locationController,
                                                  icon: Icons.location_on_outlined),
                                              SizedBox(
                                                height: 0.01 * height,
                                              ),
                                              const Text(
                                                'Salary',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              SizedBox(
                                                height: 0.01 * height,
                                              ),
                                              DropdownButtonFormField<String>(
                                                borderRadius: BorderRadius.circular(30),
                                                value: dropdownValue,
                                                icon: const Icon(Icons.arrow_downward),
                                                elevation: 16,

                                                // style: const TextStyle(color: Colors.deepPurple),
                                               decoration: InputDecoration(

                                                 prefixIcon: const Icon(Icons.monetization_on_outlined ),
                                                  border : OutlineInputBorder(

                                                       borderRadius:
                                                       BorderRadius.circular(10),
                                                       borderSide: const BorderSide(width: 10)),

                                               ),

                                                onChanged: (String? value) {
                                                  dropdownValue = value;
                                                  // This is called when the user selects an item.
                                                },
                                                items: controller.items
                                                    .map<DropdownMenuItem<String>>(
                                                        (String value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                              ),
                                              SizedBox(
                                                height: 0.01 * height,
                                              ),
                                              const Text(
                                                'Job Type',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              const Expanded(child: SizedBox()),
                                              GetBuilder<HomeController>(
                                                builder: (controller) =>
                                                 GridView.builder(
                                                  gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 8,
                                                    mainAxisSpacing: 8,
                                                    childAspectRatio: 2,
                                                  ),
                                                  shrinkWrap: true,
                                                  itemCount: controller.jobTypeFilterList
                                                      .length,
                                                  itemBuilder: (context, index) => filterChipsJobFilter(text:controller.jobTypeFilterList[index], index:index),
                                                ),
                                              ),
                                              SizedBox(height: 0.12* height,),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: const Color(0xff3366FF),
                                                  minimumSize: const Size(double.infinity, 50),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(50),
                                                  ),
                                                ),

                                                onPressed: ()async {
                                                  Get.back();

                                                    await  controller.filterApi(jobTitle: jobTitleController.text, location: locationController.text);



                                                },
                                                child: const Text(
                                                  "Show Result",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                          },
                          child: const Icon(Icons.tune)),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: filterChipsJobFilter(text: controller.jobTypeFilterList[0], index: 0),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: filterChipsJobFilter(text: controller.jobTypeFilterList[1], index: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: filterChipsJobFilter(text: controller.jobTypeFilterList[2], index: 2),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: filterChipsJobFilter(text: controller.jobTypeFilterList[3], index: 3),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: filterChipsJobFilter(text: controller.jobTypeFilterList[4], index: 4),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: filterChipsJobFilter(text: controller.jobTypeFilterList[5], index: 5),
                      ),
                    ],
                  ),
                ),
              ),
              controller.search.isNotEmpty ?
              Column(
                children: [Container(
                  width: double.infinity,
                  height: 0.04 * height,
                  color: const Color(0xffE5E7EB),
                  child: Padding(
                    padding:
                    EdgeInsets.only(top: 0.02 * width, left: 0.05 * width),
                    child: Text('Featuring ${controller.search.length} jobs'),
                  ),
                ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.search.length,
                      itemBuilder: (context, index) => jobView(
                        page: Routes.jobDetailScreen,
                        data:  controller.search[index]!,
                          width: width,
                          height: height,
                          location: controller.search[index]!.location,
                          id: controller.search[index]!.id,
                          image: controller.search[index]!.image,
                          name: controller.search[index]!.name,
                          compName: controller.search[index]!.compName,
                          jobType: controller.search[index]!.jobType,
                          jobTimeType: controller.search[index]!.jobTimeType,
                          salary: controller.search[index]!.salary)),
                ],
              ) : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 0.2*height,),
                  Image.asset(Assets.imagesSearchIlustration),
                  SizedBox(height: 0.05 * height,),
                  const Text('Search not found' , style: TextStyle(fontWeight:FontWeight.bold,fontSize: 24 ),),
                  SizedBox(height: 0.02 * height,),
                  const Text('Try searching with different keywords so' , style: TextStyle(fontWeight:FontWeight.w300,fontSize: 16 ),),
                  const Text(' we can show you' , style: TextStyle(fontWeight:FontWeight.w300,fontSize: 16 ),)
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
