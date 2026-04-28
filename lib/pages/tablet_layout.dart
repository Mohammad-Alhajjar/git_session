import 'package:flutter/material.dart';
import 'package:responsive_example/widgets/app_drawer.dart';
import 'package:responsive_example/widgets/card_item.dart';
import 'package:responsive_example/widgets/list_item.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Scaffold(
              drawer: AppDrawer(hasBorder: true),
              appBar: MediaQuery.sizeOf(context).width > 900
                  ? null
                  : AppBar(title: Text("Home Page")),
              backgroundColor: Colors.amber,
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return CardItem(hasMargin: true);
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
