import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({super.key});

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  bool isDark = false;
  String? selectedLang;
  DateTime? selectedDate;
  String? formattedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello Flutter",
              style: TextStyle(
                fontFamily: "Orbitron",
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
            ),
            Switch(
              activeThumbColor: Colors.amber,
              activeTrackColor: Colors.orange,
              inactiveTrackColor: Colors.grey,
              inactiveThumbColor: Colors.black,
              inactiveThumbImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/FullMoon2010.jpg/330px-FullMoon2010.jpg",
              ),
              activeThumbImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc1fT0QdG-Vj25ZcEfGo4z4ZHygyFotPpo2w&s",
              ),
              value: isDark,
              onChanged: (newValue) {
                isDark = newValue;
                setState(() {});
              },
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      icon: Icon(Icons.warning, size: 100, color: Colors.red),
                      title: Text("Warning"),
                      content: Text(
                        "Are you sure you want to delete this product?",
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Delete Item Done!")),
                            );
                            Navigator.pop(context);
                          },
                          child: Text("Yes"),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("No"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Alert Dialog"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: Text("Select Item"),
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            Text("item 1"),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            Text("Item 2"),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Simple Dialog"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Discount!", style: TextStyle(fontSize: 50)),
                          Text("Discount!", style: TextStyle(fontSize: 50)),
                          Text("Discount!", style: TextStyle(fontSize: 50)),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text("Custom Dialog"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AboutDialog(
                      applicationIcon: Icon(Icons.facebook),
                      applicationName: "Facebook",
                      applicationVersion: "2.0.1",
                      applicationLegalese: "Facebook Legalese",
                    );
                  },
                );
              },
              child: Text("About Dialog"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text("Fiters"),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Show Bottom Sheet"),
            ),
            SizedBox(height: 10),
            DropdownButton(
              isExpanded: true,

              hint: Text("select language"),
              value: selectedLang,
              items: [
                DropdownMenuItem(value: "en", child: Text("English")),
                DropdownMenuItem(value: "ar", child: Text("Arabic")),
                DropdownMenuItem(value: "fr", child: Text("French")),
              ],
              onChanged: (value) {
                print(value);
                selectedLang = value;
                setState(() {});
              },
            ),
            SizedBox(height: 10),
            ExpansionTile(
              initiallyExpanded: true,
              showTrailingIcon: false,
              title: Text("Asus Vivobook S15"),
              children: [
                Text("CPU: core i5 - 13500H"),
                Text("Color: Black"),
                Text("GPU: RTX 2080"),
              ],
            ),
            SizedBox(height: 10),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text("Settings"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            appBar: AppBar(),
                            body: Center(child: Text("Settings")),
                          ),
                        ),
                      );
                    },
                  ),
                  PopupMenuItem(child: Text("Logout")),
                ];
              },
            ),
            ElevatedButton(
              onPressed: () async {
                selectedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (selectedDate != null) {
                  print(selectedDate);
                  formattedDate = DateFormat.yMMMEd().format(selectedDate!);
                  setState(() {});
                }
              },
              child: Text("show date picker"),
            ),
            SizedBox(height: 10),
            if (selectedDate != null) Text("$formattedDate"),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: 10, minute: 50),
                );
                if (selectedTime != null) {
                  print(selectedTime);
                  print(DateFormat.Hm().format(DateTime.now()));
                }
              },
              child: Text("show time picker"),
            ),
          ],
        ),
      ),
    );
  }
}
