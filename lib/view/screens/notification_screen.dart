import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../generated/assets.dart';
import '../widgets/global_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> newNotification = [
      {
        'name': 'Dana',
        'msg': 'Posted new design jobs',
        'time': '10:00AM',
        'img': Assets.imagesDanaLogo,
      },
      {
        'name': 'Shoope',
        'msg': 'Posted new design jobs',
        'time': '10:00AM',
        'img': Assets.imagesShoopeLogo,
      },
      {
        'name': 'Slack',
        'msg': 'Posted new design jobs',
        'time': '10:00AM',
        'img': Assets.imagesSlackLogo,
      },
      {
        'name': 'Facebook',
        'msg': 'Posted new design jobs',
        'time': '10:00AM',
        'img': Assets.imagesFacebookLogo,
      },
    ];
    List<Map<String, String>> oldNotficition = [
      {
        'name': 'Email setup successful',
        'msg':
            'Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.',
        'time': '10:00AM',
      },
      {
        'name': 'Welcome to Jobsque',
        'msg':
            'Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....',
        'time': '8:00AM',
      },
    ];
    double width = Get.width;
    double height = Get.height;

    return Scaffold(
      appBar: AppBar(
        leading: backArrow(),
        automaticallyImplyLeading: false,
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: newNotification.length + oldNotficition.length == 0
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.2 * height,
                    ),
                    Image.asset(
                      Assets.imagesNotificationIlustration,
                      height: 0.2 * height,
                    ),
                    SizedBox(
                      height: 0.05 * height,
                    ),
                    const Text(
                      'No new notifications yet  ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(
                      height: 0.02 * height,
                    ),
                    const Text(
                      'You will receive a notification if there is something on your account.',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 16),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    newNotification.isEmpty
                        ? const SizedBox()
                        : Container(
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: Padding(
                              padding: EdgeInsets.all(0.03 * width),
                              child: const Text(
                                '  New',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6B7280),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 0.02 * height,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: newNotification.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                            left: 0.02 * width, right: 0.02 * width),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          newNotification[index]['img']!,
                                          height: 50,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              newNotification[index]['name']!,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              newNotification[index]['msg']!,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Colors.black45,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: RichText(
                                        text: TextSpan(
                                          text: '• ',
                                          style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.orange,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: newNotification[index]
                                                    ['time'],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                )),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0.02 * width, right: 0.02 * width),
                              child: const Divider(
                                height: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    oldNotficition.isEmpty
                        ? const SizedBox()
                        : Container(
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                '  Yesterday',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6B7280),
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: oldNotficition.length,
                        itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(0.02 * width),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                      radius: 0.07 * width,
                                      backgroundColor: const Color(0x9DC1F0F3),
                                      child: Icon(index % 2 != 0
                                          ? Icons.manage_search
                                          : Icons.email_outlined)),
                                  SizedBox(
                                    width: 0.02 * width,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 0.8 * width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              oldNotficition[index]['name']!,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                text: '• ',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: index % 2 == 0
                                                      ? Colors.orange
                                                      : Colors.black45,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: oldNotficition[
                                                          index]['time'],
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black45,
                                                        fontSize: 16,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 0.8 * width,
                                        child: Text(
                                          oldNotficition[index]['msg']!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )

                        ),
                  ],
                ),
              ),
      ),
    );
  }
}
