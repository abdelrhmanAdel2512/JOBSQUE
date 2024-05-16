import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../api_helper/api_fun.dart';
import '../model/apply_model.dart';

class AppliedController extends GetxController {
  int currentPage = 0;


  void addCurrentPage() {
    if(currentPage  < 2 )
    currentPage++;
    update();
  }void subCurrentPage() {
    if(currentPage  > 0 )
      currentPage--;
    update();
  }

  dynamic typeOfWork = '';

  void setTypeOfWork({required type}) {
    typeOfWork = type;
    update();
  }

  List typeOfWorkList = [
    'Senior UX Designer',
    'Senior UI Designer',
    'Graphic Designer',
    'Front-End Developer'
  ];


  dynamic file;
  String? fileName;

  int? fileSize;

  Future<void> filePacker() async {
    dynamic result1 = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result1 != null) {
      file = File(result1.files.single.path.toString());
      fileName = result1.files.single.name;
      fileSize = result1.files.single.size;
      update();
      print('000000000000000000000000000000000000000000000000000000000000');
      print(result1.files.single.size);
    } else {
      // User canceled the picker
    }
  }

  dynamic file2;
  String? fileName2;

  int? fileSize2;

  Future<void> filePacker2() async {
    dynamic result2 = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result2 != null) {
      file2 = File(result2.files.single.path.toString());
      fileName2 = result2.files.single.name;
      fileSize2 = result2.files.single.size;
      update();
      print('000000000000000000000000000000000000000000000000000000000000');
      print(result2.files.single.size);
    } else {
      // User canceled the picker
    }
  }
  bool isApplyed = false ;
  bool isLoading = false;
  bool status = false;
  ApiFun api = ApiFun();
  ApplyModel applyModel = ApplyModel();
ApplyData applyData = ApplyData();
  Future applyApi(
      {required File cvFile,
        required String name,
        required String email,
        required String mobile,
        required String workType,
        required File otherFile,
        required int jobsId,
        }) async {
    isLoading = true;
    update();
    applyModel = (await api.applyApi(
        cvFile: cvFile,
        name: name,
        email: email,
        mobile: mobile,
        workType: workType,
        otherFile: otherFile,
        jobsId: jobsId,
        ))!;

    applyData = applyModel.data!;
    status = applyModel.status!;
   isLoading = false;
   update();
  }
}
