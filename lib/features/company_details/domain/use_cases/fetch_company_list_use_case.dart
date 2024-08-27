import 'package:joistic/features/company_details/data/repository/company_list_repo.dart';

class FetchCompanyListUseCase {
  final CompanyListRepo companyListRepo;

  FetchCompanyListUseCase({required this.companyListRepo});

  Future<dynamic> execute() async {
    return companyListRepo.fetchList();
  }
}
