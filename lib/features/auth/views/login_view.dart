import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic/core/constants/app_colors.dart';
import 'package:joistic/core/constants/app_constants.dart';
import 'package:joistic/core/constants/app_strings.dart';
import 'package:joistic/core/widgets/button.dart';
import 'package:joistic/core/widgets/text_view.dart';
import 'package:joistic/core/widgets/text_widget.dart';
import 'package:joistic/features/auth/domain/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        margin: EdgeInsets.only(top: AppConstants.appBarHeight + 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: CustomText(
                text: "Sign In",
                fontWeight: FontWeight.bold,
                size: Get.width * 0.18,
                color: AppColors.blue,
              ),
            ),
            Spacer(),
            CustomTextField(
              width: Get.width * 0.75,
              height: 50,
              hintText: "E-mail",
              controller: loginController.email,
            ),
            Spacer(),
            CustomTextField(
              width: Get.width * 0.75,
              height: 50,
              hintText: "Password",
              isPasswordField: true,
              controller: loginController.password,
            ),
            Spacer(
              flex: 3,
            ),
            CustomButton(
              text: "Log in".toUpperCase(),
              width: Get.width * 0.75,
              color: AppColors.blue,
              onPressed: () async => loginController.login(loginController.email.text, loginController.password.text),
            ),
            Spacer(
              flex: 3,
            ),
            CustomText(
              text: "or login with",
              color: AppColors.light_black,
              fontWeight: FontWeight.normal,
            ),
            Spacer(),
            CustomButton(
              text: "Google".toUpperCase(),
              width: Get.width * 0.75,
              color: AppColors.white,
              shadowColor: AppColors.blackLite.withOpacity(0.05),
              textColor: AppColors.blue,
              onPressed: () async => loginController.login('', '', loginWithGoogle: true),
              icon: Image.asset(
                AppStrings.google_image,
                width: 30,
                height: 30,
              ),
            ),
            Spacer(
              flex: 8,
            )
          ],
        ),
      ),
    );
  }
}
