// features/auth/data/data_source/auth_remote_data_source.dart
import 'dart:developer';

import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  final Dio dio = Dio();
  Future<void> login({required String email, required String pass}) async {
    try {
      final Response response = await dio.post(
        'https://api.escuelajs.co/api/v1/auth/login',
        data: {"email": email, "password": pass},
      );
      log("Response: $response");
    } on DioException catch (e) {
      log("Error Dio: ${e.response?.data['message']}");
      throw Exception('${e.response?.data['message']}');
    } on Exception catch (e) {
      log("Error: $e");
      throw Exception('Error');
    }
  }
}
