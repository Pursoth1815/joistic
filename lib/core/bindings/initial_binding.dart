// core/binding/initial_binding.dart
import 'package:get/get.dart';
import 'package:joistic/core/network/api_client.dart';
import 'package:joistic/core/services/shared_preference.dart';
import 'package:joistic/features/auth/data/repository/auth_repo.dart';
import 'package:joistic/features/auth/data/repository/firebase_auth_service.dart';
import 'package:joistic/features/auth/domain/controllers/login_controller.dart';
import 'package:joistic/features/auth/domain/use_cases/login_use_case.dart';

class InitialBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    final sharedPreferencesService = SharedPreferencesService();
    sharedPreferencesService.init().then((_) {
      Get.put<SharedPreferencesService>(sharedPreferencesService, permanent: true);
    });

    Get.lazyPut<ApiClient>(() => ApiClient(baseUrl: 'https://jsonplaceholder.typicode.com/albums/1/photos'), fenix: true);

    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthService());
    Get.lazyPut<AuthRepository>(() => AuthRepository(firebaseAuthService: Get.find()));
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(authRepository: Get.find()));
    Get.lazyPut<LoginController>(() => LoginController(loginUseCase: Get.find(), sharedPreferencesService: Get.find()));
  }
}
