import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:joistic/core/services/shared_preference.dart';
import 'package:joistic/features/auth/domain/use_cases/login_use_case.dart';
import 'package:joistic/routes/app_routes.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  final SharedPreferencesService sharedPreferencesService;
  final Rx<User?> user = Rx<User?>(null);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginController({required this.loginUseCase, required this.sharedPreferencesService});

  Future<void> login(String username, String password_text, {bool loginWithGoogle = false}) async {
    Future.delayed(Duration(seconds: 1));
    try {
      final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

      if (!loginWithGoogle && (username.trim().isEmpty || password_text.trim().isEmpty)) {
        Get.snackbar("Error", "Email / Password should not be empty");
        return;
      } else if (!loginWithGoogle && !emailRegex.hasMatch(username)) {
        Get.snackbar("Error", "Email Pattern missmatch");
        return;
      } else {
        User? loggedInUser = await loginUseCase.execute(username, password_text, loginWithGoogle);

        if (loggedInUser != null) {
          await sharedPreferencesService.setUserToken(loggedInUser.uid);
          Get.offNamed(Routes.COMPANY_DETAILS);
        }
      }
    } catch (e) {
      e.printError();
    }
  }
}
