import 'package:amit_final_project_1/view/appbar/app_bar.dart';
import 'package:amit_final_project_1/view/screens/Login_and_security_screens/change_password_screen.dart';
import 'package:amit_final_project_1/view/screens/Login_and_security_screens/email_address_screen.dart';
import 'package:amit_final_project_1/view/screens/Login_and_security_screens/phone_number_screen.dart';
import 'package:amit_final_project_1/view/screens/Login_and_security_screens/two_step_verfication_3.dart';
import 'package:amit_final_project_1/view/screens/Login_and_security_screens/two_step_verification.dart';
import 'package:amit_final_project_1/view/screens/Login_and_security_screens/two_step_verification_2.dart';
import 'package:amit_final_project_1/view/screens/apply_screens/applied_screen.dart';
import 'package:amit_final_project_1/view/screens/apply_screens/apply_job_screen.dart';
import 'package:amit_final_project_1/view/screens/apply_screens/apply_succssfull_screen.dart';
import 'package:amit_final_project_1/view/screens/apply_screens/reApplied_screen.dart';
import 'package:amit_final_project_1/view/screens/complete_profile_screens/complete_profile_screen.dart';
import 'package:amit_final_project_1/view/screens/complete_profile_screens/education_screen.dart';
import 'package:amit_final_project_1/view/screens/complete_profile_screens/experience_screen.dart';
import 'package:amit_final_project_1/view/screens/complete_profile_screens/upload_Portfolio.dart';
import 'package:amit_final_project_1/view/screens/edite_profile.dart';
import 'package:amit_final_project_1/view/screens/help_center_screen.dart';
import 'package:amit_final_project_1/view/screens/language_screen.dart';
import 'package:amit_final_project_1/view/screens/messages_screens/chat_screen.dart';
import 'package:amit_final_project_1/view/screens/create%20account_login/CreateSuccessScreen.dart';
import 'package:amit_final_project_1/view/screens/create%20account_login/check_email_screen.dart';
import 'package:amit_final_project_1/view/screens/create%20account_login/countries_screen.dart';
import 'package:amit_final_project_1/view/screens/create%20account_login/create_account_job_screen.dart';
import 'package:amit_final_project_1/view/screens/create%20account_login/create_account_screen_1.dart';
import 'package:amit_final_project_1/view/screens/create%20account_login/create_new_pawword_screen.dart';
import 'package:amit_final_project_1/view/screens/create%20account_login/login_screen.dart';
import 'package:amit_final_project_1/view/screens/create%20account_login/password_change_succes.dart';
import 'package:amit_final_project_1/view/screens/create%20account_login/reset_password.dart';
import 'package:amit_final_project_1/view/screens/home_screen.dart';
import 'package:amit_final_project_1/view/screens/job_detail_screen.dart';
import 'package:amit_final_project_1/view/screens/Login_and_security_screens/login_and_security_screen.dart';
import 'package:amit_final_project_1/view/screens/messages_screens/messages_screen.dart';
import 'package:amit_final_project_1/view/screens/notification_screen.dart';
import 'package:amit_final_project_1/view/screens/notification_settings_screen.dart';
import 'package:amit_final_project_1/view/screens/onboarding.dart';
import 'package:amit_final_project_1/view/screens/complete_profile_screens/personal_details_screen.dart';
import 'package:amit_final_project_1/view/screens/profile_screen.dart';
import 'package:amit_final_project_1/view/screens/prtofolio_Screen2.dart';
import 'package:amit_final_project_1/view/screens/saved_screen.dart';
import 'package:amit_final_project_1/view/screens/privacy_policy_screen.dart';
import 'package:amit_final_project_1/view/screens/search_screens/search_screen.dart';
import 'package:amit_final_project_1/view/screens/search_screens/searched_job_screen.dart';
import 'package:amit_final_project_1/view/screens/terms_condotions_screen.dart';
import 'package:amit_final_project_1/view/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'constants/route_name.dart';
final sharedPreferences =  GetStorage();
main() async{
  WidgetsFlutterBinding.ensureInitialized();
await GetStorage.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,

      initialRoute:Routes.splachScreen,
      getPages: [
        GetPage(name: Routes.splachScreen, page: ()=>const SplashScreen()),
        GetPage(name: Routes.onboardingScreen, page: ()=>const OnboardingScreen()),
        GetPage(name: Routes.createAccountScreen1, page: ()=> CreateAccountScreen1()),
        GetPage(name: Routes.CreateAccountJobScreen, page: ()=> const CreateAccountJobScreen()),
        GetPage(name: Routes.countriesScreen, page: ()=> CountriesScreen()),
        GetPage(name: Routes.createSuccessScreen, page: ()=> const CreateSuccessScreen()),
        GetPage(name: Routes.loginScreen, page: ()=>  LoginScreen()),
        GetPage(name: Routes.resetPassword, page: ()=>  ResetPassword()),
        GetPage(name: Routes.passwordChangeSucces, page: ()=> const PasswordChangeSucces()),
        GetPage(name: Routes.checkEmailScreen, page: ()=> const CheckEmailScreen()),
        GetPage(name: Routes.createNewPassword, page: ()=>  CreateNewPassword()),
        GetPage(name: Routes.appbar, page: ()=>  Appbar()),
        GetPage(name: Routes.homeScreen, page: ()=>  HomeScreen()),
        GetPage(name: Routes.messageScreen, page: ()=>  MessageScreen()),
        GetPage(name: Routes.savedScreen, page: ()=>  SavedScreen()),
        GetPage(name: Routes.profileScreen, page: ()=>  ProfileScreen()),
        GetPage(name: Routes.appliedScreen, page: ()=>  AppliedScreen()),
        GetPage(name: Routes.searchScreen, page: ()=>  SearchScreen()),
        GetPage(name: Routes.searchedJobScreen, page: ()=>  SearchedJobScreen()),
        GetPage(name: Routes.jobDetailScreen, page: ()=>  JobDetailScreen()),
        GetPage(name: Routes.applyJobScreen, page: ()=>  ApplyJobScreen()),
        GetPage(name: Routes.applySuccessful, page: ()=>   ApplySuccessful()),
        GetPage(name: Routes.chatScreen, page: ()=>  ChatScreen()),
        GetPage(name: Routes.loginAndSecurityScreen, page: ()=>  LoginAndSecurityScreen()),
        GetPage(name: Routes.twoStepVerification, page: ()=>  TwoStepVerification()),
        GetPage(name: Routes.emailAddressScreen, page: ()=>  EmailAddressScreen()),
        GetPage(name: Routes.changePasswordScreen, page: ()=>  ChangePasswordScreen()),
        GetPage(name: Routes.phoneNumberScreen, page: ()=>  PhoneNumberScreen()),
        GetPage(name: Routes.twoStepVerification2Screen, page: ()=>  TowStepVerification2Screen()),
        GetPage(name: Routes.twoStepVerification3Screen, page: ()=>  TowStepVerification3Screen()),
        GetPage(name: Routes.privacyPolicyScreen, page: ()=>  PrivacyPolicyScreen()),
        GetPage(name: Routes.helpCenterScreen, page: ()=>  HelpCenterScreen()),
        GetPage(name: Routes.termsAndConditionsScreen, page: ()=>  TermsAndConditionsScreen()),
        GetPage(name: Routes.completeProfileScreen, page: ()=>  CompleteProfileScreen()),
        GetPage(name: Routes.educationScreen, page: ()=>  EducationScreen()),
        GetPage(name: Routes.experienceScreen, page: ()=>  ExperienceScreen()),
        GetPage(name: Routes.notificationScreen, page: ()=>  NotificationScreen()),
        GetPage(name: Routes.reAppliedScreen, page: ()=>  ReAppliedScreen()),
        GetPage(name: Routes.notificationSittingScreen, page: ()=>  NotificationSittingScreen()),
        GetPage(name: Routes.editProfile, page: ()=>  EditProfile()),
        GetPage(name: Routes.languageScreen, page: ()=>  LanguageScreen()),
        GetPage(name: Routes.personalDetailsScreen, page: ()=>  PersonalDetailsScreen()),
        GetPage(name: Routes.uploadPortfolio, page: ()=>  UploadPortfolio()),
        GetPage(name: Routes.uploadPortfolio2, page: ()=>  UploadPortfolio2()),


      ],
    );
  }
}
