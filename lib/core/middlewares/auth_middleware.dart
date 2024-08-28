import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:joistic/core/services/shared_preference.dart';
import 'package:joistic/routes/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  final SharedPreferencesService _sharedPreferencesService = Get.find<SharedPreferencesService>();

  @override
  RouteSettings? redirect(String? route) {
    String? token = _sharedPreferencesService.getUserToken();

    if (token != null && token.isNotEmpty) {
      return const RouteSettings(name: Routes.COMPANY_DETAILS);
    }
    return super.redirect(route);
  }
}
