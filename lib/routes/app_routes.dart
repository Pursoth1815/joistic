import 'package:get/get.dart';
import 'package:joistic/features/auth/domain/views/login_view.dart';
import 'package:joistic/features/company_details/views/company_details_view.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(name: Routes.COMPANY_DETAILS, page: () => CompanyDetailsView()),
  ];
}

class Routes {
  static const String LOGIN = '/login';
  static const String COMPANY_DETAILS = '/company_details';
}
