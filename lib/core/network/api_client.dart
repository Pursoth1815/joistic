import 'package:dio/dio.dart';

class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<dynamic> get({String endpoint = ''}) async {
    final dio = Dio();
    final url = '$baseUrl$endpoint';
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on DioException catch (error) {
      throw Exception('Error occurred during GET request: $error');
    }
  }
}
