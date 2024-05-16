import 'package:amit_final_project_1/main.dart';
import 'package:dio/dio.dart';

import '../model/all_job_model.dart';
import 'endpoints.dart';

class AllJobApi{
Dio dio = Dio();
Future<AlljobModel?> allJobApi() async{
try{
  dio.options.headers['content-Type'] = 'application/json';
  dio.options.headers["authorization"] = "Bearer ${sharedPreferences.read('token')}";
 final  response = await dio.get('${EndPoint.baseUrl}${EndPoint.allJob}',);
  AlljobModel alljobModel = AlljobModel.fromJson(response.data);
print(response.statusCode);
print(response.data);
return alljobModel;
}catch (e){
print(e);
// return Data(
//   name: '',
//   updatedAt: '',
//   location: '',
//   id: 0,
//   createdAt: '',
//   image: '',
//   aboutComp:  '',
//   compEmail:  '',
//   compName: '',
//   compWebsite: '',
//   expired: 0,
//   favorites: 0,
//   jobDescription: '',
//   jobLevel: '',
//   jobSkill: '',
//   jobTimeType: '',
//   jobType: '',
//   salary: '',
// );
}
}
}