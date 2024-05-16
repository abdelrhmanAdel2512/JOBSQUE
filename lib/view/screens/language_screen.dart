
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../controller/edit_portofolio_contoller.dart';
import '../widgets/global_widget.dart';

class LanguageScreen extends StatelessWidget {
  final w = Get.width;

  final EditPortofolioConrtoller controller = Get.put<EditPortofolioConrtoller>(EditPortofolioConrtoller());

   LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        leading: backArrow(),
        automaticallyImplyLeading: false,
        title: const Text(
          'Language',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: GetBuilder<EditPortofolioConrtoller>(
            builder: (context) {
              return ListView.builder(
                  itemCount: controller.langList.length,
                  itemBuilder: (context,index)=>Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(controller.langList[index]['image']!,width: 60,height: 60,),
                              const SizedBox(width: 10,),
                              Text(controller.langList[index]['title']!),
                            ],
                          ),
                          Radio(
                            value: controller.langList[index]['title'],
                            groupValue:
                            controller.selectedLang,
                            onChanged: (value) {
                              controller.setLang(value);
                            },
                          ),


                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      const SizedBox(height: 10,),


                    ],),
                  )
              );
            }
        ),
      ),
    );
  }
}
