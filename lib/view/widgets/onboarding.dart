import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/route_name.dart';

class PageIndicators extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  const PageIndicators({super.key, required this.pageCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
            (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: _buildIndicator(index),
        ),
      ),
    );
  }
  Widget _buildIndicator(int index) {
    return Container(
      width: index == currentPage ? 12 : 9,
      height: index == currentPage ? 12 : 9,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == currentPage ? ColorsM.mainColor : Colors.grey,
        border: Border.all(
          color: ColorsM.mainColor,
          width: 1,
        ),
      ),
    );
  }
}
class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const OnboardingPage(
      {super.key, required this.title, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
        ),
        const SizedBox(height: 20),
        // TitleWidget(),
        title == 'title1'
            ? Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: RichText(
            textAlign: TextAlign.left,
            text: const TextSpan(
              text: 'Find a job, and ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Color(0xff111827),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'start building ',
                  style: TextStyle(
                    fontSize: 32,
                    color: ColorsM.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'your career from now on',
                  style: TextStyle(
                    fontSize: 32,
                    color: Color(0xff111827),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
        //  Hundreds of jobs are waiting for you to join together
            : title == 'title2'
            ? Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: RichText(
            textAlign: TextAlign.left,
            text: const TextSpan(
              text: 'Hundreds of jobs are waiting for you to',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Color(0xff111827),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' join together',
                  style: TextStyle(
                    fontSize: 32,
                    color: ColorsM.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
        // Get the best choice for the job you've always dreamed of
            : title == 'title3'
            ? Padding(
          padding:
          const EdgeInsets.only(left: 15.0, right: 15.0),
          child: RichText(
            textAlign: TextAlign.left,
            text: const TextSpan(
              text: 'Get the best ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Color(0xff111827),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'choice for the job ',
                  style: TextStyle(
                    fontSize: 32,
                    color: ColorsM.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "you've always dreamed of",
                  style: TextStyle(
                    fontSize: 32,
                    color: Color(0xff111827),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
            : const Text(''),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0) ,
          child: Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

Widget topWidget(double hight, double width,BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 0.04 * hight,
            width: 0.3 * width,
            child: Image.asset('assets/images/Logo.png')),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(onTap: () {Get.toNamed(Routes.createAccountScreen1);}, child: const Text('skip')),
      )
    ],
  );
}

