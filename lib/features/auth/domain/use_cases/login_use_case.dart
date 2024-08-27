import 'package:firebase_auth/firebase_auth.dart';
import 'package:joistic/features/auth/data/repository/auth_repo.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<User?> execute(String username, String password, bool loginWithGoogle) async {
    return loginWithGoogle ? await authRepository.loginWithGoogle() : await authRepository.loginWithEmail(username, password);
  }
}
