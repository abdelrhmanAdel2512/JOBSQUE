import 'package:amit_final_project_1/constants/colors.dart';
import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../widgets/global_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.01 * width),
          child: GetBuilder<HomeController>(
            builder: (controller) => Column(
              children: [
                Row(
                  children: [
                    backArrow(),
                    SizedBox(
                      width: 0.8 * width,
                      height: 0.05 * height,
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: 'Type something...',
                            prefixIcon: InkWell(
                                onTap: () async{
                                  if (searchController.text.isNotEmpty) {
                                    Get.toNamed(Routes.searchedJobScreen);

                                    await controller.searchApi(
                                        jobName: searchController.text);
                                    controller.addToRecentSearch(
                                        search: searchController.text);
                                  }

                                },
                                child: const Icon(Icons.search, color: Colors.black)),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            )),
                      ),
                    )
                  ],
                ),
                controller.recentSearch.isNotEmpty
                    ? Container(
                        width: double.infinity,
                        color: const Color(0xffE5E7EB),
                        height: 0.04 * height,
                        child: Padding(
                          padding: EdgeInsets.all(0.01 * height),
                          child: const Text('Recent searches'),
                        ),
                      )
                    : const SizedBox(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.recentSearch.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () async{
                      Get.toNamed(Routes.searchedJobScreen);
                    await  controller.searchApi(
                          jobName: controller.recentSearch[index]);

                    },
                    child: SizedBox(
                      height: 0.06 * height,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 0.03 * width, right: 0.03 * width),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.search_off_outlined),
                                GestureDetector(
                                    child: Text(controller.recentSearch[index]))
                              ],
                            ),
                            GestureDetector(
                                onTap: () =>  controller.removeFromRecentSearch(
                                    index: index),
                                child: const Icon(
                                  Icons.highlight_remove,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: const Color(0xffE5E7EB),
                  height: 0.04 * height,
                  child: Padding(
                    padding: EdgeInsets.all(0.01 * height),
                    child: const Text('Popular searches'),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.popularSearches.length,
                  itemBuilder: (context, index) => SizedBox(
                    height: 0.06 * height,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 0.03 * width, right: 0.03 * width),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.search_off_outlined),
                              Text(controller.popularSearches[index])
                            ],
                          ),
                          GestureDetector(
                              onTap: () async{
                                Get.toNamed(Routes.searchedJobScreen);
                              await   controller.searchApi(
                                    jobName: controller.popularSearches[index]);
                                controller.addToRecentSearch(
                                    search: controller.popularSearches[index]);

                              },
                              child: const Icon(
                                Icons.arrow_circle_right_outlined,
                                color: ColorsM.mainColor,
                              ))
                        ],
                      ),
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
