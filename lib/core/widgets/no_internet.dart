import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic/core/constants/app_strings.dart';
import 'package:joistic/core/widgets/text_widget.dart';

class NoInternetWidget extends StatelessWidget {
  final double imageWidthRatio;
  final double imageHeightRatio;
  final String imagePath;
  final String messageText;
  final double textSize;
  final FontWeight textFontWeight;

  const NoInternetWidget({
    Key? key,
    this.imageWidthRatio = 0.75,
    this.imageHeightRatio = 0.75,
    this.imagePath = AppStrings.no_internet_image,
    this.messageText = AppStrings.no_internet,
    this.textSize = 16,
    this.textFontWeight = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            imagePath,
            width: Get.width * imageWidthRatio,
            height: Get.width * imageHeightRatio,
          ),
          CustomText(
            text: messageText,
            fontWeight: textFontWeight,
            size: textSize,
          ),
        ],
      ),
    );
  }
}
