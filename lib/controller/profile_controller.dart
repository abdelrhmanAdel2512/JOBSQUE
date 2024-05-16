
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../API_helper/getUserPortfolioApi.dart';
import '../model/getUserPortfolioModel.dart';

class ProfileController extends GetxController{
  GetUserPortfolio gus = GetUserPortfolio();
  GetPortofoliosModel gusData =GetPortofoliosModel();
  bool isLoading = false;

  List<Map<String,dynamic>> generalSettings=[
    {
      'title': 'Edit Profile',
      'icon': Icons.person_outlined,
    },
    {'title': 'Portfolio',
      'icon': Icons.drive_folder_upload
    },
    {'title': 'Language',
      'icon': Icons.language
    },
    {'title': 'Notification',
      'icon': Icons.notifications_none_outlined
    },
    {'title': 'Login and security',
      'icon': Icons.lock_person_outlined
    },
  ];
  List otherSettings=[
    'Accessibility',
    'Help Center',
    'Terms & Conditions',
    'Privacy Policy',
  ];


  Future<void> getPortfolio()async {
    try {
      isLoading = true;
      update();

      gusData = await gus.getPortfolio();

      isLoading = false;
      update();

      // Check if gusData and its properties are not null before accessing them
      if (gusData != null &&
          gusData.data != null &&
          gusData.data!.profile != null) {
        String? profileName = gusData.data!.profile!.name;

        if (profileName != null) {
          // The profile name is not null, you can proceed with your logic
          // Example: print('Profile Name: $profileName');
        } else {
          // Handle the case where the profile name is null
          print('Profile name is null');
        }
      } else {
        // Handle the case where gusData or its properties are null
        print('gusData or its properties are null');
      }
    } catch (error) {
      // Handle exceptions that might occur during the asynchronous operation
      print('Error during initialization: $error');
    }

    super.onInit();

  }

  @override
  void onInit() async {
    try {
      isLoading = true;
      update();

      gusData = await gus.getPortfolio();

      isLoading = false;
      update();

      // Check if gusData and its properties are not null before accessing them
      if (gusData != null &&
          gusData.data != null &&
          gusData.data!.profile != null) {
        String? profileName = gusData.data!.profile!.name;

        if (profileName != null) {
          // The profile name is not null, you can proceed with your logic
          // Example: print('Profile Name: $profileName');
        } else {
          // Handle the case where the profile name is null
          print('Profile name is null');
        }
      } else {
        // Handle the case where gusData or its properties are null
        print('gusData or its properties are null');
      }
    } catch (error) {
      // Handle exceptions that might occur during the asynchronous operation
      print('Error during initialization: $error');
    }

    super.onInit();
  }

}