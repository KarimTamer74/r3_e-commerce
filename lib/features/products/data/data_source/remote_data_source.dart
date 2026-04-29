// features/products/data/data_source/remote_data_source.dart
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:first_app/features/products/data/models/product_model.dart';

class RemoteDataSource {
  final Dio dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get(
        'https://api.escuelajs.co/api/v1/products',
      );
      return (response.data as List)
          .map((element) => ProductModel.fromJson(element))
          .toList();
    } on DioException catch (e) {
      String errMessage = e.response?.data['message'] ?? 'Failure';
      throw Exception(errMessage);
    } on Exception catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List> getCategoryData() async {
    final response = await dio.get(
      'https://api.escuelajs.co/api/v1/categorierfrees',
    );
    log(response.toString());
    return response.data;
  }

  Future<void> deleteProduct(int id) async {
    try {
      final Response response = await dio.delete(
        'https://api.escuelajs.co/api/v1/products/${id}',
      );
      log("Response: ${response.data}, Status Code: ${response.statusCode}");
    } on DioException catch (e) {
      log(e.response?.data['message'].toString() ?? 'Failue');
    } on Exception catch (e) {
      log("Error: ${e}");
    }
  }
}
