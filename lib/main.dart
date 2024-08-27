import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:joistic/core/bindings/initial_binding.dart';
import 'package:joistic/core/di/dependency_injection.dart';
import 'package:joistic/routes/app_routes.dart';

void main() {
  DependencyInjection.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
      initialRoute: Routes.LOGIN,
      getPages: AppRoutes.routes,
    );
  }
}
