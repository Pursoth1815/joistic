import 'package:get/get.dart';
import 'package:joistic/features/company_details/data/repository/company_list_repo.dart';
import 'package:joistic/features/company_details/domain/controllers/company_details_controller.dart';
import 'package:joistic/features/company_details/domain/use_cases/fetch_company_list_use_case.dart';

class CompanyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyListRepo>(() => CompanyListRepo(apiServices: Get.find()));
    Get.lazyPut<FetchCompanyListUseCase>(() => FetchCompanyListUseCase(companyListRepo: Get.find()));
    Get.lazyPut<CompanyDetailsController>(() => CompanyDetailsController(companyListUseCase: Get.find()));
  }
}
