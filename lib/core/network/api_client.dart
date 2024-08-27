import 'package:dio/dio.dart';

class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<Response<dynamic>> get({String endpoint = ''}) async {
    final dio = Dio();
    final url = '$baseUrl$endpoint';
    try {
      final response = await dio.get(url);
      return response;
    } on DioException catch (error) {
      throw Exception('Error occurred during GET request: $error');
    }
  }

  Future<Response<dynamic>> post(Map<String, dynamic> body, {String endpoint = ''}) async {
    final dio = Dio();
    final url = '$baseUrl$endpoint';
    try {
      final response = await dio.post(url, data: body);
      return response;
    } on DioException catch (error) {
      throw Exception('Error occurred during POST request: $error');
    }
  }
}
