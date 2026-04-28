import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key, required this.hasBorder});
  final bool hasBorder;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<Map<String, dynamic>> listTilesData = [
    {'icon': Icons.person, "title": "Profile", "onTap": () {}},
    {'icon': Icons.chat, "title": "Chats", "onTap": () {}},
    {'icon': Icons.settings, "title": "Settings", "onTap": () {}},
    {'icon': Icons.notifications, "title": "Notification", "onTap": () {}},
    {'icon': Icons.logout, "title": "Logout", "onTap": () {}},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: widget.hasBorder
          ? null
          : RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.zero),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(100),
              child: CircleAvatar(
                child: Image.network(
                  "https://img.freepik.com/premium-vector/woman-avatar-profile-icon-vector-illustration_874723-207.jpg?w=360",
                ),
              ),
            ),
            accountName: Text("Lelas"),
            accountEmail: Text("lelas@gmail.com"),
          ),
          SizedBox(height: 10),
          ...List.generate(listTilesData.length, (index) {
            return ListTile(
              leading: Icon(listTilesData[index]["icon"]),
              title: Text(listTilesData[index]["title"]),
              onTap: listTilesData[index]["onTap"],
            );
          }),
        ],
      ),
    );
  }
}
