import 'package:amit_final_project_1/api_helper/api_fun.dart';
import 'package:amit_final_project_1/api_helper/profile_api.dart';
import 'package:amit_final_project_1/model/profille_model.dart';

import 'package:get/get.dart';

import '../api_helper/all_job_api.dart';
import '../model/all_job_model.dart';

class HomeController extends GetxController{
  AlljobModel jobres = AlljobModel();
  AllJobApi api = AllJobApi();
  ProfileModel  profileModel = ProfileModel();
  ProfileApi profileApi = ProfileApi();
  bool isLoading = false;
  int dataleanth = 0;
  int pageNumber = 0;
  List<Data?> jobData = [];
  @override
  void onInit() async{
    isLoading = true;
    update();
    jobres= (await api.allJobApi())!;
    profileModel = (await profileApi.getProfile())!;

    jobData = jobres.data!;
    dataleanth = jobData.length;

    isLoading = false;
    print('000000000000000000000000000000000000000000000000000000000000000');
    print(jobData[1]?.id);
    print('000000000000000000000000000000000000000000000000000000000000000');
    print(profileModel.data!.name!);


    update();
    // TODO: implement onInit
    super.onInit();
  }
void addPageNumber({required int index}){
    pageNumber = index;
   update();
    print(pageNumber);
}
bool searchIsLoading = false ;

ApiFun apifun = ApiFun();
  AlljobModel searchData = AlljobModel();
  String searchName = '';
  List<Data?> search = [];

  //   Search function
Future searchApi({required String jobName})async{
  searchIsLoading = true ;
   update();
   searchName= jobName;
  searchData = (await  apifun.searchJob(jobName: jobName))!;
  search = searchData.data!;
  searchIsLoading = false ;
  update();
}

  Future filterApi({required String jobTitle,required String location})async{
    searchIsLoading = true ;
    update();

    searchData = (await  apifun.filterApi(jobTitle:jobTitle ,location:location ))!;
    search = searchData.data!;
    searchIsLoading = false ;
    update();
  }

List recentSearch = [];

void addToRecentSearch({required String search }){
  if (search.isNotEmpty) {
    if(!recentSearch.contains(search)){
      recentSearch.insert(0,search);
    }else{
      recentSearch.remove(search);
      recentSearch.insert(0,search);}

  }
  update();
}
void removeFromRecentSearch({required int index}){
  recentSearch.removeAt(index);
  update();
}

List popularSearches = ['UI/UX Designer','Project Manager','Product Designer','UX Designer','Front-End Developer','flutter'];
  List<String> items = [
    '5K - 10K',
    '10K - 15K',
    '15K - 20K',
    '20K - 25K',
  ];

  List <String>jobTypeFilterList = [
    'Full Time',
    'Remote',
    'Contract',
    'Part Time',
    'Onsite',
    'Internship',
  ];
  List<bool> jobTypeFilter = List.filled(6, false);

}