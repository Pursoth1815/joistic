import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic/core/constants/app_colors.dart';
import 'package:joistic/core/constants/app_constants.dart';
import 'package:joistic/core/constants/app_strings.dart';
import 'package:joistic/core/widgets/animated_search_bar.dart';
import 'package:joistic/core/widgets/button.dart';
import 'package:joistic/core/widgets/card_widget.dart';
import 'package:joistic/core/widgets/shimmer.dart';
import 'package:joistic/core/widgets/shimmer_card.dart';
import 'package:joistic/core/widgets/text_widget.dart';
import 'package:joistic/features/company_details/data/models/company_list_model.dart';
import 'package:joistic/features/company_details/domain/controllers/company_details_controller.dart';

class CompanyDetailsView extends GetView<CompanyDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: AppConstants.screenWidth,
        height: AppConstants.screenHeight,
        color: AppColors.whiteLite,
        child: Shimmer(
          child: GetBuilder<CompanyDetailsController>(
            builder: (controller) => Container(
              child: controller.status.isLoading
                  ? _loaderWidget()
                  : controller.status.isEmpty
                      ? Center(child: Text('No companies available'))
                      : _bodyWidget(controller),
            ),
          ),
        ),
      ),
    );
  }

  Container _bodyWidget(CompanyDetailsController controller) {
    return Container(
      margin: EdgeInsets.only(top: AppConstants.appBarHeight),
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
      child: Column(
        children: [
          _navbarFunctionality(controller),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 15),
            child: CustomText(
              text: AppStrings.titleText,
              fontWeight: FontWeight.w700,
              size: 30,
            ),
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final company = controller.state?[index];
                  return _companyListTile(context, company!);
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: Get.height * 0.04,
                    ),
                itemCount: controller.state!.length),
          ),
        ],
      ),
    );
  }

  InkWell _companyListTile(BuildContext context, CompanyListModel company) {
    return InkWell(
      onTap: () => _showCustomBottomSheet(context, company),
      child: CustomCard(
        height: Get.width * 0.22,
        child: Row(
          children: [
            Container(
              width: Get.width * 0.15,
              margin: EdgeInsets.only(right: 15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(color: AppColors.whiteLite, shape: BoxShape.circle),
              child: CachedNetworkImage(
                imageUrl: company.logo,
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: company.title,
                    fontWeight: FontWeight.w500,
                    size: 16,
                  ),
                  CustomText(
                    text: company.description,
                    fontWeight: FontWeight.w300,
                    color: AppColors.light_black,
                    size: 14,
                  ),
                ],
              ),
            ),
            Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.purple.withOpacity(0.8),
                  width: 8.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _navbarFunctionality(CompanyDetailsController controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppStrings.menu_image,
            width: 30,
            height: 50,
          ),
          AnimatedSearchBox(/* onTextChanged: (p0) => controller.fil */)
        ],
      ),
    );
  }

  Future<dynamic> _showCustomBottomSheet(BuildContext context, CompanyListModel model) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.45,
            padding: EdgeInsets.only(top: (Get.width * 0.3) / 3 + 10, left: Get.width * 0.1, right: Get.width * 0.1, bottom: Get.width * 0.05),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: CustomText(
                    text: model.title,
                    fontWeight: FontWeight.bold,
                    size: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: CustomText(
                    text: model.description,
                    fontWeight: FontWeight.w300,
                    color: AppColors.black.withOpacity(0.5),
                    maxLines: 2,
                    size: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 5),
                  child: CustomText(
                    text: AppStrings.position,
                    fontWeight: FontWeight.normal,
                    color: AppColors.blackLite.withOpacity(0.5),
                    size: 16,
                  ),
                ),
                Container(
                  child: CustomText(
                    text: AppStrings.job_position,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackLite,
                    size: 18,
                  ),
                ),
                Spacer(),
                CustomButton(
                  width: Get.width * 0.85,
                  borderRadius: 15,
                  letterSpacing: 3,
                  text: 'applay now'.toUpperCase(),
                  onPressed: () {
                    print('Button Pressed!');
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: -(Get.width * 0.3) / 2,
            left: (Get.width * 0.3) / 2,
            child: Container(
              width: Get.width * 0.3,
              height: Get.width * 0.3,
              decoration: BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
              padding: EdgeInsetsDirectional.all(8),
              alignment: Alignment.center,
              child: Container(
                width: Get.width * 0.23,
                padding: EdgeInsets.all(23),
                decoration: BoxDecoration(color: AppColors.whiteLite, shape: BoxShape.circle),
                child: CachedNetworkImage(
                  imageUrl: model.logo,
                  placeholder: (context, url) => Center(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _loaderWidget() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) => ShimmerCard(),
      separatorBuilder: (context, index) => SizedBox(
        height: 15,
      ),
      itemCount: 6,
    );
  }
}
