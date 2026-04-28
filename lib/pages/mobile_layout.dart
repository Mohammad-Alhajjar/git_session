import 'package:flutter/material.dart';
import 'package:responsive_example/widgets/card_item.dart';

import '../widgets/app_drawer.dart';
import '../widgets/list_item.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Scaffold(
              drawer: AppDrawer(
                hasBorder: true,
              ),
              // endDrawer: ,
              appBar: AppBar(title: Text("Home Page")),
              backgroundColor: Colors.amber,
              body: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return CardItem(hasMargin: false);
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        return ListItem();
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.green,
              body: Center(child: Text("mobile, lanscape")),
            );
          }
        },
      ),
    );
  }
}
