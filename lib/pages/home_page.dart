import 'package:auth_flow/services/profile_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
