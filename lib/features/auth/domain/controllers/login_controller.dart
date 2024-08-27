import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:joistic/core/services/shared_preference.dart';
import 'package:joistic/features/auth/domain/use_cases/login_use_case.dart';
import 'package:joistic/routes/app_routes.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  final SharedPreferencesService sharedPreferencesService;
  final Rx<User?> user = Rx<User?>(null);

  LoginController({required this.loginUseCase, required this.sharedPreferencesService});

  Future<void> login(String username, String password, {bool loginWithGoogle = false}) async {
    try {
      User? loggedInUser = await loginUseCase.execute(username, password, loginWithGoogle);
      log('user.value: ${loggedInUser}');

      if (loggedInUser != null) {
        await sharedPreferencesService.setString('user_token', loggedInUser.uid);
        Get.offNamed(Routes.COMPANY_DETAILS);
      }
    } catch (e) {
      e.printError();
    }
  }
}
