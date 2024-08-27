import 'package:joistic/features/auth/data/model/auth_model.dart';
import 'package:joistic/features/auth/data/repository/auth_repo.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<User?> execute(String username, String password) async {
    return await authRepository.login(username, password);
  }
}
