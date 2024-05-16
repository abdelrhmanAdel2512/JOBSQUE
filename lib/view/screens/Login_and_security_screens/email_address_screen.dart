import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/global_widget.dart';

class EmailAddressScreen extends StatelessWidget {
  const EmailAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: backArrow(),
        automaticallyImplyLeading: false,
        title: const Text(
          'Email address',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(0.05*width),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.03* height),
              const Text('Main e-mail address'),
              SizedBox(height: 0.01* height),
              TextFormField(decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: 'email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(width: 1))
              ),),
              const Expanded(child: SizedBox()),
              InkWell(
                  onTap: () => Get.back(),
                  child: buttonBottom(text: 'save')),
            ],
          ),
        ),
      ),
    );
  }
}
