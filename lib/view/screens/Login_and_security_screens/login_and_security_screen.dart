import 'package:amit_final_project_1/constants/route_name.dart';
import 'package:amit_final_project_1/view/widgets/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginAndSecurityScreen extends StatelessWidget {
  const LoginAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: backArrow(),
        automaticallyImplyLeading: false,
        title: const Text(
          'Login and security',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(children: [
          separatorWords(text:'Accont access' ),
          InkWell(
              onTap: (){Get.toNamed(Routes.emailAddressScreen);},child: textbot(text: 'Email address')),
          InkWell(
              onTap: () => Get.toNamed(Routes.phoneNumberScreen),child: textbot(text: 'Phone number')),
          InkWell(onTap: () => Get.toNamed(Routes.changePasswordScreen), child:textbot(text: 'Change password')),
          InkWell(onTap: () =>Get.toNamed(Routes.twoStepVerification) ,child: textbot(text: 'Two-step verification')),
          InkWell(child: textbot(text: 'Face ID')),

        ]),
      ),
    );
  }
}


Widget textbot ({required text}){
  double width = Get.width;
  double height = Get.height;
  return Padding(
    padding:  EdgeInsets.all(0.03*width),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,style:  const TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
            const Icon(Icons.arrow_forward)

          ],
        ),
        SizedBox(height: 0.01*height,),
        const SizedBox(width:double.infinity,
          child: Divider(
            height: 1,
            color: Colors.black,
          ),
        )
      ],
    ),
  );
}