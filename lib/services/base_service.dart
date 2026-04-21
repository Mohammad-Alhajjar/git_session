import 'package:dio/dio.dart';

abstract class BaseService<T> {
  Dio dio = Dio();
  late Response response;
  final String baseUrlProducts = "https://dummyjson.com";
  final String baseUrlLaptop =
      "https://69ce61b133a09f831b7d66ea.mockapi.io/api/v1";
  Future<List<T>?> getAll();
  Future<T?> getOne({required int itemId});
  Future<bool> create({required T newItem});
  Future<bool> update({required T updateItem});
  Future<bool> delete({required int deleteId});
}
