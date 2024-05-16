import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:intl_phone_field/intl_phone_field.dart';


import '../../widgets/global_widget.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});



  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            onTap: () =>

                Get.back(),
            child: const Icon(Icons.arrow_back, color: Colors.black,)),
        automaticallyImplyLeading: false,
        title: const Text(
          'Phone number',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(0.05*width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 0.03 * height,
            ),
            const Text(
              'Main phone number',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            SizedBox(
              height: 0.01 * height,
            ),
            IntlPhoneField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(),
                ),
              ),
              initialCountryCode: 'EG',
              onChanged: (phone) {

              },
            ),
            SizedBox(
              height: 0.01 * height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SizedBox(
                  width: 0.7 * width,
                  child: const Text(
                    'Use the phone number to reset your password'
                  ),
                ),
                customSwitch()
              ],
            ),
            const Expanded(child: SizedBox()),
            InkWell(
                onTap: () => Get.back(),
                child: buttonBottom(text: 'save')),
          ],
        ),
      ),
    );
  }
}
