import 'package:rest/models/product_model.dart';
import 'package:rest/services/base_service.dart';

class ProductService extends BaseService<ProductModel> {
  final String productResourse = "products";

  @override
  Future<bool> create({required ProductModel newItem}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete({required int deleteId}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>?> getAll() async {
    try {
      response = await dio.get("$baseUrlProducts/$productResourse");
      if (response.statusCode == 200) {
        List<ProductModel> products = List.generate(response.data.length, (
          int index,
        ) {
          return ProductModel.fromMap(response.data[index]);
        });
        return products;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<ProductModel?> getOne({required int itemId}) {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  @override
  Future<bool> update({required ProductModel updateItem}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
