import 'package:amit_final_project_1/view/widgets/global_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

 final ChatController controller = Get.put<ChatController>(ChatController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    dynamic argument = Get.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:  EdgeInsets.all(0.01 *width),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backArrow(),
                Image.asset(
                  argument['image'],
                  width: 0.15 * width,
                ),
                Text( argument['name'],style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
              ],
            ),
          ),
          InkWell(
              onTap: () {
                Get.bottomSheet(Container(
                  height: height,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20),),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buttonSheetField(text: 'Visit job post',icon: Icons.work_outline),
                        buttonSheetField(text: 'View my application',icon: Icons.text_snippet_outlined),
                        buttonSheetField(text: 'Mark as unread',icon: Icons.mail_outline),
                        buttonSheetField(text: 'Mute',icon: Icons.notifications_none),
                        buttonSheetField(text: 'Archive',icon: Icons.file_download_outlined),
                        buttonSheetField(text: 'Delete conversation',icon: Icons.delete_outline),



                      ],
                    ),
                  ),
                ));
              },
              child: const Icon(Icons.more_horiz_outlined ,color: Colors.black,))
        ],
      ),),
      body: SafeArea(
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0.3*width,
                  child: const Divider(
                    color: Colors.black, // Set the color of the divider
                    height: 20, // Set the height of the divider
                  ),
                ),
                const Text('Today, Nov 13'),
                SizedBox(
                  width: 0.3*width,
                  child: const Divider(
                    color: Colors.black,
                    height: 20,
                  ),
                ),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.chat.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(0.02 * width),
                      child: Row(
                        mainAxisAlignment: index % 2 == 0
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: index % 2 == 0
                                  ? const Color(0xffE5E7EB)
                                  : const Color(0xff3366FF),
                              borderRadius: index % 2 == 0
                                  ? const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))
                                  : const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                            ),
                            constraints:
                                BoxConstraints(maxWidth: 0.8 * width),
                            child: Padding(
                              padding: EdgeInsets.all(0.02 * width),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    controller.chat[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17,
                                        color: index % 2 == 0
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                  Text('10.18',style: TextStyle(color: index % 2 == 0 ? const Color(0xff9CA3AF) : const Color(0xffE5E7EB)),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
         const Expanded(child: SizedBox()),
            Container(
              height: 0.08* height,
              color: Colors.white,
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(

                    width: 0.18 *width,
                      height: 0.06*height,
                      decoration: BoxDecoration( border: Border.all(width: 1, color: const Color(0xffD1D5DB)) , shape: BoxShape.circle ),
                      child: const Center(child: Icon(Icons.attachment_outlined))),

                  Container(
                    width: 0.6 * width,
                    height: 0.06*height,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(width: 1 ,color: const Color(0xffD1D5DB),)),
                    child: const Center(child: Text('Write a message...')),
                  ),
                  Container(

                      width: 0.18 *width,
                      height: 0.06*height,
                      decoration: BoxDecoration( border: Border.all(width: 1,color: const Color(0xffD1D5DB)) , shape: BoxShape.circle,),
                      child: const Center(child: Icon(Icons.mic_rounded))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
