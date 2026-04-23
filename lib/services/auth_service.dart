import 'package:auth_flow/core/config/di.dart';
import 'package:auth_flow/main.dart';
import 'package:auth_flow/models/request_models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Dio dio = Dio();
  void signUp() {}
  Future<bool> login({required LoginModel loginInfo}) async {
    try {
      Response response = await dio.post(
        "https://dummyjson.com/auth/login",
        data: loginInfo.toMap(),
      );
      if (response.statusCode == 200) {
        // storage.setString("token", response.data["accessToken"]);
        getIt.get<SharedPreferences>().setString(
          "token",
          response.data["accessToken"],
        );
        print(response.data["accessToken"]);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  void signout() {}
}
