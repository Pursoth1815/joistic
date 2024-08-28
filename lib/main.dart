import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:joistic/core/bindings/initial_binding.dart';
import 'package:joistic/core/constants/app_constants.dart';
import 'package:joistic/core/services/shared_preference.dart';
import 'package:joistic/firebase_options.dart';
import 'package:joistic/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeApp();
  runApp(const MainApp());
}

Future<void> _initializeApp() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final sharedPreferencesService = SharedPreferencesService();
    await sharedPreferencesService.init();
    Get.put<SharedPreferencesService>(sharedPreferencesService, permanent: true);

    InitialBinding().dependencies();
  } catch (e) {
    e.printError();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppConstants.init(context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN,
      theme: ThemeData(
        useMaterial3: false,
      ),
      getPages: AppRoutes.routes,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
        child: child!,
      ),
    );
  }
}
