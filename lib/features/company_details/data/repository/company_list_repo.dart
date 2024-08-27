import 'package:get/get.dart';
import 'package:joistic/core/network/api_client.dart';
import 'package:joistic/features/company_details/data/models/company_list_model.dart';

class CompanyListRepo {
  final ApiClient apiServices;

  CompanyListRepo({required this.apiServices});

  Future<dynamic> fetchList() async {
    try {
      dynamic responce = await apiServices.get();
      if (responce != null) {
        List<dynamic> res = responce;

        if (res.isNotEmpty) {
          List<CompanyListModel> model = res.map((element) => CompanyListModel.fromJson(element)).toList();

          return model;
        } else {
          return [];
        }
      }
    } catch (e) {
      e.printError();
    }
  }
}
