import 'package:get/get.dart';
import 'package:joistic/core/middlewares/auth_middleware.dart';
import 'package:joistic/features/auth/views/login_view.dart';
import 'package:joistic/features/company_details/bindings/company_details_binding.dart';
import 'package:joistic/features/company_details/views/company_details_view.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.COMPANY_DETAILS, page: () => CompanyDetailsView(), binding: CompanyDetailsBinding()),
  ];
}

class Routes {
  static const String LOGIN = '/login';
  static const String COMPANY_DETAILS = '/company_details';
}
