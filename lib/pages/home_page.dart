import 'package:auth_flow/core/config/di.dart';
import 'package:auth_flow/main.dart';
import 'package:auth_flow/pages/login_page.dart';
import 'package:auth_flow/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              bool isTokenRemoved = await getIt.get<SharedPreferences>().remove("token");
              if (isTokenRemoved) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Local Storage error")));
              }
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: ProfileService().getProfile(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListTile(
                leading: Image.network(
                  snapshot.data!.image!,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.warning);
                  },
                ),
                title: Text(snapshot.data!.firstName ?? ""),
                subtitle: Text(snapshot.data!.email ?? ""),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(child: Text("error"));
            }
          },
        ),
      ),
    );
  }
}
