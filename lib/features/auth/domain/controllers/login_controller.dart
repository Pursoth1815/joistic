import 'package:get/get.dart';
import 'package:joistic/features/auth/data/model/auth_model.dart';
import 'package:joistic/features/auth/domain/use_cases/login_use_case.dart';
import 'package:joistic/routes/app_routes.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase = Get.find();
  final Rx<User?> user = Rx<User?>(null);

  Future<void> login(String username, String password) async {
    user.value = await loginUseCase.execute(username, password);
    if (user.value != null) {
      Get.offNamed(Routes.COMPANY_DETAILS);
    } else {
      Get.snackbar('Error', 'Login failed');
    }
  }
}
