import 'package:flutter/material.dart';
import 'package:rest/models/laptop_model.dart';
import 'package:rest/services/laptop_service.dart';
import 'package:rest/views/one_laptop_page.dart';

class LaptopsView extends StatefulWidget {
  const LaptopsView({super.key});

  @override
  State<LaptopsView> createState() => _LaptopsViewState();
}

class _LaptopsViewState extends State<LaptopsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool isCreated = await LaptopService().create(
            newItem: LaptopModel(
              name: "dell",
              color: "Silver",
              price: 1000,
              image:
                  "https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/page/franchise/latitude/compact-design/fy25/lati-compact-franchise-1920x1440-hero-perf.png",
            ),
          );
          if (isCreated) {
            setState(() {});
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("failed to create laptop"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("laptops page")),
      body: FutureBuilder(
        future: LaptopService().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<LaptopModel> laptops = snapshot.data!;
            return ListView.builder(
              itemCount: laptops.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: InkWell(
                    onTap: () {
                      print(laptops[index].id);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return OneLaptopPage(
                              laptopId: int.parse(laptops[index].id!),
                            );
                          },
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 100,
                      child: Image.network(
                        laptops[index].image!,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.warning);
                        },
                      ),
                    ),
                  ),
                  title: Text(laptops[index].name!),
                  subtitle: Text(
                    "${laptops[index].color} - ${laptops[index].price}",
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            bool isDeleted = await LaptopService().delete(
                              deleteId: int.parse(laptops[index].id!),
                            );
                            if (isDeleted) {
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("failed to delete laptop"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: Icon(Icons.delete),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () async {
                            bool isUpadted = await LaptopService().update(
                              updateItem: laptops[index].copyWith(
                                name: "Asus",
                              ),
                            );
                            if (isUpadted) {
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("failed to update laptop"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                  // trailing: Text("${laptops[index].price}"),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: LinearProgressIndicator());
          } else {
            return Center(child: Text("error"));
          }
        },
      ),
    );
  }
}
