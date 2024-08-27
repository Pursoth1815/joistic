import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:joistic/core/constants/app_strings.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      String error_message = "";
      if (e.code == 'wrong-password') {
        error_message = AppStrings.wrongPassword;
      } else if (e.code == "user-not-found") {
        error_message = AppStrings.user_not_found;
      } else if (e.code == 'invalid-email') {
        error_message = AppStrings.email_invalid;
      } else if (e.code == 'invalid-credential') {
        error_message = AppStrings.invalid_credential;
      } else {
        error_message = AppStrings.error;
      }
      print(e);
      print(e.code);

      Get.snackbar('Error', error_message);
    } catch (e) {
      print("Error in signIn: $e");
      return null;
    }
    return null;
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }
}
