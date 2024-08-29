import 'package:get/get.dart';
import 'package:joistic/features/company_details/data/models/company_list_model.dart';
import 'package:joistic/features/company_details/domain/use_cases/fetch_company_list_use_case.dart';

class CompanyDetailsController extends GetxController with StateMixin<List<CompanyListModel>> {
  final FetchCompanyListUseCase companyListUseCase;

  CompanyDetailsController({required this.companyListUseCase});

  List<CompanyListModel> companiesList = [];
  List<CompanyListModel> filteredCompaniesList = [];

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
  }

  Future<void> fetchCompanies() async {
    change([], status: RxStatus.loading());
    try {
      List<dynamic> companies = await companyListUseCase.execute();

      companiesList.clear();

      if (companies.isNotEmpty) {
        companiesList = companies as List<CompanyListModel>;
        change(companies, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    } catch (e) {
      e.printError();
      change([], status: RxStatus.error('Failed to load companies'));
    }
  }

  Future<void> removeFilter() async {
    change(companiesList, status: RxStatus.success());
  }

  Future<void> filterCompanyList(String value) async {
    if (value.isEmpty) {
      change(companiesList, status: RxStatus.success());
    } else {
      filteredCompaniesList = companiesList.where((company) => company.title.toLowerCase().contains(value.toLowerCase())).toList();

      if (filteredCompaniesList.isNotEmpty) {
        change(filteredCompaniesList, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    }
  }

  Future<void> applyJob(String companyId) async {
    bool alreadyApplied = false;

    await Future.delayed(Duration(seconds: 2));

    companiesList = companiesList.map((element) {
      if (element.companyId == companyId) {
        if (element.isApplied) {
          alreadyApplied = true;
          return element;
        } else {
          return element = element.copyWith(isApplied: true);
        }
      }
      return element;
    }).toList();

    change(companiesList, status: RxStatus.success());
    Get.back();

    if (alreadyApplied) {
      Get.snackbar('OOPS!', 'Already Applied for this Job');
    } else {
      Get.snackbar('Success', ' Job Applied Sucessfully!');
    }
  }
}
