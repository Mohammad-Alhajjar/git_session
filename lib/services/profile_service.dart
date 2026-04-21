import 'package:auth_flow/models/response_models/profile_model.dart';
import 'package:auth_flow/services/auth_service.dart';
import 'package:dio/dio.dart';

class ProfileService {
  Future<ProfileModel?> getProfile() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        "https://dummyjson.com/auth/me",
        options: Options(headers: {
          "Authorization" : "Bearer $token"
        }),
      );
      if (response.statusCode == 200) {
        ProfileModel profile = ProfileModel.fromMap(response.data);
        return profile;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
