import 'package:get/get.dart';
import 'package:joistic/features/auth/domain/views/login_view.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    // GetPage(name: COMPANY_DETAILS, page: () => ListingPage()),
  ];
}

class Routes {
  static const String LOGIN = '/login';
  static const String COMPANY_DETAILS = '/company_details';
}
