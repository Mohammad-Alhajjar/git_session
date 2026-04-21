import 'package:rest/models/laptop_model.dart';
import 'package:rest/services/base_service.dart';

class LaptopService extends BaseService<LaptopModel> {
  final String laptopResource = 'laptop';
  @override
  Future<List<LaptopModel>?> getAll() async {
    try {
      response = await dio.get("$baseUrlLaptop/$laptopResource");
      List<LaptopModel> laptops = [];
      for (var i = 0; i < response.data.length; i++) {
        LaptopModel laptop = LaptopModel.fromMap(response.data[i]);
        laptops.add(laptop);
      }
      return laptops;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<LaptopModel?> getOne({required int itemId}) async {
    try {
      response = await dio.get("$baseUrlLaptop/$laptopResource/$itemId");
      LaptopModel laptop = LaptopModel.fromMap(response.data);
      return laptop;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> create({required LaptopModel newItem}) async {
    try {
      response = await dio.post(
        "$baseUrlLaptop/$laptopResource",
        data: newItem.toMap(),
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> update({required LaptopModel updateItem}) async {
    try {
      response = await dio.put(
        "$baseUrlLaptop/$laptopResource/${updateItem.id}",
        data: updateItem.toMap(),
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> delete({required int deleteId}) async {
    try {
      response = await dio.delete("$baseUrlLaptop/$laptopResource/$deleteId");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
