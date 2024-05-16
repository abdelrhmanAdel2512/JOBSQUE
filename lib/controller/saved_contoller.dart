import 'package:get/get.dart';

import '../api_helper/saved_api.dart';
import '../model/add_saved_model.dart';
import '../model/all_job_model.dart';
import '../model/delete_saved_model.dart';
import '../model/show_savae_jobs.dart';

class SavedController extends GetxController {



  AddSavedModel addSavedModel = AddSavedModel();
  SavedApi savedApi = SavedApi();

  // List jobIdList = [];

  Future<void> addToSave({required String jobId}) async {
    addSavedModel = (await savedApi.addToSaveApi(jobId: jobId))!;
    // jobIdList.clear();
    showSaved();
    update();
  }

  ShowSavedJobs showSavedJobs = ShowSavedJobs();
  bool isLoading = false;

  Future<void> showSaved() async {
    isLoading = true;
    update();
    showSavedJobs = (await savedApi.showSavedApi())!;
    // for(int i =0 ; i < showSavedJobs.data!.length ;  i++){
    //   jobIdList.add(showSavedJobs.data![i].jobId);
    // }
    update();
    isLoading = false;
    update();
  }

  // @override
  Future onInit() async {
    // TODO: implement onInit
    isLoading = true;
    update();
    showSavedJobs = (await savedApi.showSavedApi())!;
    update();
    isLoading = false;
    update();
    super.onInit();
  }

  DelFavJobModel delFavJobModel = DelFavJobModel();
  Future<void> deleteSaved ({required String id})async{
   await savedApi.delFavJob(jobID: id);
   showSaved();
   update();
  }

}
