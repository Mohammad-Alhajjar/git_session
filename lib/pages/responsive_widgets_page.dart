import 'package:flutter/material.dart';

class ResponsiveWidgetsPage extends StatelessWidget {
  const ResponsiveWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.maxFinite,
              height: 200,
              color: Colors.green,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: FittedBox(child: Icon(Icons.abc)),
                  ),
                ),
              ),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 2,
            child: Container(
              width: double.maxFinite,
              height: 200,
              color: Colors.blue,
              child: FractionallySizedBox(
                alignment: AlignmentGeometry.topLeft,
                widthFactor: 0.8,
                heightFactor: 0.5,
                child: Container(width: 200, height: 200, color: Colors.green),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: screenWidth / 2,
              height: 300,
              color: Colors.yellow,
              child: Center(child: Text("$screenWidth")),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 200,
              color: Colors.red,
              child: Center(child: Text("$screenHeight")),
            ),
          ),
        ],
      ),
    );
  }
}
