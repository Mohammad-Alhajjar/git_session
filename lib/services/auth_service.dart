import 'package:auth_flow/models/request_models/login_model.dart';
import 'package:dio/dio.dart';

String? token;

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
        print(response.data["accessToken"]);
        token = response.data["accessToken"];
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
