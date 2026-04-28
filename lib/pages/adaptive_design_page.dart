import 'package:flutter/material.dart';
import 'package:responsive_example/pages/desktop_layout.dart';
import 'package:responsive_example/pages/mobile_layout.dart';
import 'package:responsive_example/pages/tablet_layout.dart';

class AdaptiveDesignPage extends StatelessWidget {
  const AdaptiveDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          print(constraints.maxWidth);
          print(constraints.maxHeight);
          if (constraints.maxWidth < 600 || constraints.maxHeight < 600) {
            return MobileLayout();
          } else if (constraints.maxWidth < 900) {
            return TabletLayout();
          } else {
            return DesktopLayout();
          }
        },
      ),
    );
  }
}
