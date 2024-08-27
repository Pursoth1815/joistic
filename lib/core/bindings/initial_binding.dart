// core/binding/initial_binding.dart
import 'package:get/get.dart';
import 'package:joistic/features/auth/domain/controllers/login_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
