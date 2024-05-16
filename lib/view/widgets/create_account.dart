import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controller/countries_controller.dart';
import '../../controller/create_account_controller.dart';
import '../../controller/create_account_job_conroller.dart';
import '../../generated/assets.dart';

class TextFieldCustom extends StatelessWidget {
  final IconData icon;
  final String type;
  final bool isPassword;
  final bool islogin;
  final TextEditingController controller;

 final  CreateAccountController getController = Get.find<CreateAccountController>();

  TextFieldCustom(
      {super.key,
      required this.icon,
      required this.type,
      required this.isPassword,
      required this.controller,
      required this.islogin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 8),
      child: TextFormField(
          controller: controller,
          keyboardType: type == 'User name'
              ? TextInputType.name
              : type == 'email'
                  ? TextInputType.emailAddress
                  : TextInputType.visiblePassword,
          autocorrect: !isPassword,
          obscureText: isPassword == false ? false : getController.obscureText,
          onChanged: (value) {
            if (isPassword && !islogin) getController.theControllerText = controller.text;
            getController.ColoChange();
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: getController.color)),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: isPassword && !islogin
                  ? OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: getController.color,
                        width: 2,
                      ),
                    )
                  : null,
              hintText: type,
              prefixIcon: Icon(
                icon,
                color: ColorsM.iconColor,
              ),
              suffixIcon: isPassword
                  ? InkWell(
                      onTap: () {
                        {
                          getController.changeobscureText();
                        }
                      },
                      child: getController.obscureText
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: ColorsM.iconColor,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: ColorsM.iconColor,
                            ),
                    )
                  : null)),
    );
  }
}

Widget mediaButton(String imageUrl, String name) {
  double height = Get.height;
  double width = Get.width;
  return Container(
    decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(10)),
    height: 0.06 * height,
    width: 0.4 * width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Image.asset(imageUrl),
        ),
        Text(name),
      ],
    ),
  );
}

Widget customAppBar() {
  double height = Get.height;
  double width = Get.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back)),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 0.04 * height,
            width: 0.3 * width,
            child: Image.asset('assets/images/Logo.png')),
      ),
    ],
  );
}

Widget jobChoose(
    {required IconData icon, required String name, required int index}) {
  Color color = ColorsM.CardColor;
  double height = Get.height;
  double width = Get.width;

  CreateAccountJobController getController =
      Get.put<CreateAccountJobController>(CreateAccountJobController(),
          permanent: true);

  return GetBuilder<CreateAccountJobController>(
    builder: <CreateAccountJobController>(controller) => InkWell(
      onTap: () {
        getController.changeColor(index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              width: 2,
              color: !getController.isOn[index]
                  ? ColorsM.ButtonColor
                  : ColorsM.mainColor),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Card(
            margin: const EdgeInsets.all(0),
            color: color,
            child: Container(
              color: getController.isOn[index]
                  ? const Color(0xffD6E4FF)
                  : const Color(0xffAFAFA),
              width: 0.4 * width,
              height: 0.18 * height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: !getController.isOn[index]
                                  ? ColorsM.ButtonColor
                                  : ColorsM.mainColor),
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundColor: color,
                        child: Icon(
                          icon,
                          color: !getController.isOn[index]
                              ? Colors.black
                              : ColorsM.mainColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 10),
                    child: Text(name),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget countriesSelecor(
    {required String title, required String image, required int isSelected}) {
  CountriesController controller = Get.find<CountriesController>();
  return FilterChip(
    label: Text(title),
    onSelected: (value) {
      controller.isSelect[isSelected] = !controller.isSelect[isSelected];
      controller.update();
    },
    avatar: Image.asset(image),
    selectedColor: const Color(0xffD6E4FF),
    backgroundColor: const Color(0xffE5E7EB),
    selected: controller.isSelect[isSelected],
    side: BorderSide(
        width: 1,
        color: controller.isSelected ? const Color(0xff3366FF) : const Color(0xffE5E7EB)),
    checkmarkColor: Colors.transparent,
  );
}


Widget mediaBar(){
  double width = Get.width;

  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      mediaButton(Assets.iconsGoogle, 'Google'),
      SizedBox(
        width: 0.05 * width,
      ),
      mediaButton(Assets.iconsFacebook, 'Facebook'),
    ],
  );
}



Widget textDivider({required String text}){


  double width = Get.width;
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 0.2 * width,
          child: const Divider(
            height: 10,
            color: Colors.black,
            thickness: 1,
            indent: 1,
            endIndent: 1,
          ),
        ),
        Text(text),
        SizedBox(
          width: 0.2 * width,
          child: const Divider(
            height: 10,
            color: Colors.black,
            thickness: 1,
            indent: 1,
            endIndent: 1,
          ),
        ),
      ],
    ),
  );
}

