import 'package:firebase_auth/firebase_auth.dart';
import 'package:joistic/features/auth/data/repository/firebase_auth_service.dart';

class AuthRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthRepository({required this.firebaseAuthService});

  Future<User?> loginWithEmail(String email, String password) async {
    return await firebaseAuthService.signInWithEmail(email, password);
  }

  Future<User?> loginWithGoogle() async {
    return await firebaseAuthService.signInWithGoogle();
  }
}
