// core/binding/initial_binding.dart
import 'package:get/get.dart';
import 'package:joistic/core/constants/app_constants.dart';
import 'package:joistic/core/network/api_client.dart';
import 'package:joistic/features/auth/data/repository/auth_repo.dart';
import 'package:joistic/features/auth/data/repository/firebase_auth_service.dart';
import 'package:joistic/features/auth/domain/controllers/login_controller.dart';
import 'package:joistic/features/auth/domain/use_cases/login_use_case.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppConstants>(() => AppConstants(), fenix: true);
    Get.lazyPut<ApiClient>(() => ApiClient(baseUrl: 'https://jsonplaceholder.typicode.com/albums/1/photos'), fenix: true);

    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthService());
    Get.lazyPut<AuthRepository>(() => AuthRepository(firebaseAuthService: Get.find()));
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(authRepository: Get.find()));
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
