import 'package:flutter/material.dart';
import 'package:rest/services/laptop_service.dart';

class OneLaptopPage extends StatelessWidget {
  const OneLaptopPage({super.key, required this.laptopId});
  final int laptopId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("one laptop page"),
        actions: [
          InkWell(
            onTap: () {
              // Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: LaptopService().getOne(itemId: laptopId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListTile(
                leading: SizedBox(
                  width: 100,
                  child: Image.network(
                    snapshot.data!.image!,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.warning);
                    },
                  ),
                ),
                title: Text(snapshot.data!.name!),
                subtitle: Text(snapshot.data!.color!),
                trailing: CircleAvatar(
                  child: Text(snapshot.data!.price.toString()),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Text("Erroe, fialed to get one laptop");
            }
          },
        ),
      ),
    );
  }
}
