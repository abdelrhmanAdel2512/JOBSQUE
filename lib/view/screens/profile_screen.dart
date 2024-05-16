import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/appbar_controller.dart';
import '../../controller/profile_controller.dart';
import '../../generated/assets.dart';
import '../../main.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

   ProfileController profController =
      Get.put<ProfileController>(ProfileController());
   AppbarController appbarController =
  Get.put<AppbarController>(AppbarController());

  @override
  Widget build(BuildContext context) {
    profController.getPortfolio();
    final width = Get.width;
    final height = Get.height;
    return Scaffold(
      body: GetBuilder<ProfileController>(
        builder: (controller) => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child:   SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: const Color(0xffD6E4FF),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                appbarController.changeTabIndex(0);
                                  },
                                  icon: const Icon(Icons.arrow_back)),
                              const Text(
                                'Profile',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Get.offAllNamed(Routes.loginScreen);
                                    sharedPreferences.erase();
                                  },
                                  icon: const Icon(
                                    Icons.logout_outlined,
                                    color: Color(0xffFF472B),
                                  )),
                            ],
                          ),
                        ),
                      ),

                      profController.gusData.data  != null ? Column(
                        children: [

                          Stack(
                            children: [
                              Center(
                                child: Container(
                                  color: const Color(0xffD6E4FF),
                                  width: double.infinity,
                                  height: height * 0.18,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: height * 0.1, left: (width / 2) - 60),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5,
                                  ),
                                  borderRadius: BorderRadius.circular(70),
                                ),
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage(Assets.imagesProfile),
                                  radius: 60,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            profController.gusData.data!.profile!.name ??
                                '** no name',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xfff3f3f3),
                              ),
                              width: double.infinity,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Applied',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54),
                                        ),
                                        Text('46',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                            ))
                                      ],
                                    ),
                                    VerticalDivider(
                                        width: 5,
                                        color: Colors.red,
                                        thickness: 20,
                                        endIndent: 0,
                                        indent: 20),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Reviewed',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54),
                                        ),
                                        Text('23',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    ),
                                    VerticalDivider(
                                        width: 5,
                                        color: Colors.red,
                                        thickness: 20,
                                        endIndent: 0,
                                        indent: 20),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Contacted',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54),
                                        ),
                                        Text('16',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'About',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black38,
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.editProfile);
                                        },
                                        child: const Text(
                                          'Edit',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.blue,
                                          ),
                                        ))
                                  ],
                                ),
                                Text(
                                  profController.gusData.data!.profile?.bio ??
                                      '** no Bio',
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 10, top: 10, bottom: 10),
                              child: Text(
                                "General",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6B7280),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Column(
                              children: [
                                InkWell(
                                    onTap: () {Get.toNamed(Routes.editProfile);},
                                    child: generalWidget(text: 'Edit Profile', icon: Icons.person_outlined)),
                                InkWell(
                                    onTap: () {Get.toNamed(Routes.uploadPortfolio2);},
                                    child: generalWidget(text: 'Portfolio', icon:  Icons.drive_folder_upload)),
                                InkWell(
                                    onTap: () {Get.toNamed(Routes.languageScreen);},
                                    child: generalWidget(text: 'Language', icon: Icons.language)),
                                InkWell(
                                    onTap: () {Get.toNamed(Routes.notificationSittingScreen);},
                                    child: generalWidget(text: 'Notification', icon:  Icons.notifications_none_outlined)),
                                InkWell( onTap: () {
                                      Get.toNamed(Routes.loginAndSecurityScreen);
                                },child: generalWidget(text: 'Login and security', icon: Icons.lock_person_outlined)),
                                InkWell( onTap: () {
                                      Get.toNamed(Routes.completeProfileScreen);
                                },child: generalWidget(text: 'Complete Profile', icon: Icons.account_circle_rounded)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 10, top: 10, bottom: 10),
                              child: Text(
                                "Others",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6B7280),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Column(
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: othersWidget(text: 'Accesibility')),
                                InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.helpCenterScreen);
                                    },
                                    child: othersWidget(text: 'Help Center')),
                                InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.termsAndConditionsScreen);
                                    },
                                    child:
                                        othersWidget(text: 'Terms & Conditions')),
                                InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.privacyPolicyScreen);
                                    },
                                    child: othersWidget(text: 'Privacy Policy')),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ): Container(
                        child: Center(
                          child: Text('Server error' ,style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w500 ),),
                        ),
                      ),
                    ],
                  ),
                )
              ),
      ),
    );
  }
}

Widget othersWidget({required text}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Icon(Icons.arrow_forward)
        ],
      ),
      // SizedBox(height: 10,),
      const Divider(
        height: 30,
        thickness: 2,
        color: Colors.black26,
      ),
      // SizedBox(height: 10,),
    ],
  );
}

Widget generalWidget({required icon, required text}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xffD6E4FF),
                radius: 25,
                child: Icon(icon, size: 30, color: const Color(0xff3366FF)),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward,
              ))
        ],
      ),
      // SizedBox(height: 10,),
      const Divider(
        height: 30,
        thickness: 2,
        color: Colors.black26,
      ),
      // SizedBox(height: 10,),
    ],
  );
}
