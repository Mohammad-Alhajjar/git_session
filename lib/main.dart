import 'package:flutter/material.dart';
import 'package:responsive_example/pages/adaptive_design_page.dart';
import 'package:responsive_example/pages/responsive_widgets_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AdaptiveDesignPage(),
    );
  }
}
