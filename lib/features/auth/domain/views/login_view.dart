import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic/features/auth/domain/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            loginController.login('username', 'password');
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
