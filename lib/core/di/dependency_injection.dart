import 'package:get/get.dart';
import 'package:joistic/core/constants/app_constants.dart';
import 'package:joistic/core/network/api_client.dart';
import 'package:joistic/features/auth/data/repository/auth_repo.dart';
import 'package:joistic/features/auth/domain/use_cases/login_use_case.dart';
// import 'package:my_app/features/listing/data/repositories/listing_repository.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<AppConstants>(() => AppConstants(), fenix: true);
    Get.lazyPut<ApiClient>(() => ApiClient(baseUrl: 'https://jsonplaceholder.typicode.com/albums/1/photos'), fenix: true);

    Get.lazyPut<AuthRepository>(() => AuthRepository(apiClient: Get.find()));
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(authRepository: Get.find()));
  }
}
