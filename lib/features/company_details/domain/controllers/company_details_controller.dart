import 'dart:developer';

import 'package:get/get.dart';
import 'package:joistic/features/company_details/data/models/company_list_model.dart';
import 'package:joistic/features/company_details/domain/use_cases/fetch_company_list_use_case.dart';

class CompanyDetailsController extends GetxController with StateMixin<List<CompanyListModel>> {
  final FetchCompanyListUseCase companyListUseCase;

  CompanyDetailsController({required this.companyListUseCase});

  // List<dynamic> companies

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
  }

  Future<void> fetchCompanies() async {
    change([], status: RxStatus.loading());
    try {
      List<dynamic> companies = await companyListUseCase.execute();

      if (companies.isNotEmpty) {
        change(companies as List<CompanyListModel>, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    } catch (e) {
      e.printError();
      change([], status: RxStatus.error('Failed to load companies'));
    }
  }

  Future<void> filterCompanyList(String value) async {}
}
