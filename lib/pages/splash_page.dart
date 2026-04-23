import 'package:auth_flow/core/config/di.dart';
import 'package:auth_flow/main.dart';
import 'package:auth_flow/pages/home_page.dart';
import 'package:auth_flow/pages/login_page.dart';
import 'package:auth_flow/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      print("============================== initstate");
      print(getIt.get<SharedPreferences>().getString("token"));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return getIt.get<SharedPreferences>().getString("token") == null
                ? LoginPage()
                : HomePage();
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/images/app_logo.png")),
    );
  }
}
