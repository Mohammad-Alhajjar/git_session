import 'package:auth_flow/core/config/di.dart';
import 'package:auth_flow/main.dart';
import 'package:auth_flow/models/response_models/profile_model.dart';
import 'package:auth_flow/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  Future<ProfileModel?> getProfile() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        "https://dummyjson.com/auth/me",
        options: Options(
          headers: {"Authorization": "Bearer ${getIt.get<SharedPreferences>().getString("token")}"},
        ),
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
