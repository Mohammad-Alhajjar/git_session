import 'package:flutter/material.dart';
import 'package:validation_etc/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      //     SizedBox(width: 10),
      //     FloatingActionButton.extended(
      //       onPressed: () {},
      //       label: Text("Create"),
      //       icon: Icon(Icons.add),
      //     ),
      //   ],
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: emailFormKey,
                child: TextFormField(
                  validator: (value) {
                    final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{3}",
                    ).hasMatch(value!);
                    if (value.isEmpty) {
                      return "please fill the text filed";
                    } else if (!emailValid) {
                      return "please write a real email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Form(
                key: passwordFormKey,
                child: TextFormField(
                  validator: (value) {
                    if (value!.length < 6) {
                      return "please enter more than 6 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  bool isValidEmail =
                      emailFormKey.currentState?.validate() ?? false;

                  bool isValidPassword =
                      passwordFormKey.currentState?.validate() ?? false;
                  if (isValidEmail && isValidPassword) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  // fixedSize: Size(150, 40),
                  maximumSize: Size(400, 40),
                  // minimumSize: Size(200, 40),
                ),
                child: Text("Login Login"),
              ),
              SizedBox(height: 10),
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {},
                child: Text("Login"),
              ),
              SizedBox(height: 10),
              OutlinedButton(onPressed: () {}, child: Text("Login")),
              SizedBox(height: 10),
              TextButton(onPressed: () {}, child: Text("Login")),
              SizedBox(height: 10),
              IconButton(onPressed: () {}, icon: Icon(Icons.login)),
            ],
          ),
        ),
      ),
    );
  }
}
