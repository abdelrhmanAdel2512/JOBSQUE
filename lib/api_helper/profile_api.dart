import 'package:dio/dio.dart';

import '../main.dart';
import '../model/profille_model.dart';
import 'endpoints.dart';

class ProfileApi {
  Dio dio = Dio();
  Future<ProfileModel?> getProfile()async{
    try{
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer ${sharedPreferences.read('token')}";
      final  response = await dio.get('${EndPoint.baseUrl}${EndPoint.profile}',);
      ProfileModel profileModel = ProfileModel.fromJson(response.data);
      sharedPreferences.write('userName',profileModel.data!.name! );
      print(response.statusCode);
      print(response.data);
      return profileModel;
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
    return null;
  }
  }
