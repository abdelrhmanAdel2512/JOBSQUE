import 'package:amit_final_project_1/view/widgets/create_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/route_name.dart';
import '../../../controller/create_account_job_conroller.dart';
import '../../../main.dart';
import 'countries_screen.dart';

class CreateAccountJobScreen extends StatelessWidget {
  const CreateAccountJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 0.015 * height,
              ),
              Text(
                'What type of work are you interested in?',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 0.015 * height,
              ),
              Text(
                'Tell us what you’re interested in so we can customise the app for your needs.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              GetBuilder<CreateAccountJobController>(
                init: CreateAccountJobController(),
                  builder: (controller) => Expanded(
                          child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 10,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.details.length,
                        itemBuilder: (context, index) {
                          return jobChoose(
                              icon: controller.details[index]['icon'],
                              name: controller.details[index]['title'],
                              index: index);
                        },
                      ))),
              


              Center(
                child: Container(
                    width: 0.9 * width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ColorsM.mainColor),
                    child: TextButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        Get.toNamed(Routes.countriesScreen);
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
