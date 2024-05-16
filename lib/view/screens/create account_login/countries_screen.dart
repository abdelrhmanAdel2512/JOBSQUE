import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../constants/colors.dart';
import '../../../constants/route_name.dart';
import '../../../controller/countries_controller.dart';
import '../../widgets/create_account.dart';

class CountriesScreen extends StatelessWidget {
  CountriesScreen({super.key});

  bool isShow = true;
  CountriesController myController = Get.put(CountriesController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Where are you prefefred Location?',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Let us know, where is the work location you want at this time, so we can adjust it.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 0.03 * height),
            ToggleSwitch(
              minWidth: 0.85 * width,
              cornerRadius: 20.0,
              activeBgColors: [
                [Color(0xff091A7A)!],
                [Color(0xff091A7A)!]
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Color(0xffF4F4F5),
              inactiveFgColor: Color(0xff6B7280),
              initialLabelIndex: 1,
              totalSwitches: 2,
              labels: ['Work From Office', 'Remote Work'],
              radiusStyle: true,
              onToggle: (index) {
                isShow = !isShow;
                myController.update();
              },
            ),
            GetBuilder<CountriesController>(
                init: CountriesController(),
                builder: (controller) => (!isShow)
                    ? SizedBox()
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              'Select the country you want for your job',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              for (int index = 0;
                                  index < controller.countries.length;
                                  index++)
                                countriesSelecor(
                                    title: controller.countries[index]['title'],
                                    image: controller.countries[index]['img'],
                                    isSelected: index),
                            ],
                          ),
                          SizedBox(height: 0.1*height),
                          Center(
                            child: Container(
                                width: 0.9 * width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: ColorsM.mainColor),
                                child: TextButton(
                                  style: ButtonStyle(),
                                  onPressed: () {
                                    Get.toNamed(Routes.createSuccessScreen);

                                  },
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
                        ],
                      )),

          ],
        ),
      ),
    );
  }
}
