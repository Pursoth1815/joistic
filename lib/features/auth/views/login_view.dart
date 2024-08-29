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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                loginController.login('ruvser003@gmail.com', 'password123');
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                loginController.login('', '', loginWithGoogle: true);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
