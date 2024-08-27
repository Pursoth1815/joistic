import 'package:joistic/core/network/api_client.dart';
import 'package:joistic/features/auth/data/model/auth_model.dart';

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  Future<User?> login(String username, String password) async {
    final response = await apiClient.get();
    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    }
    return null;
  }
}
