import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic/core/constants/app_colors.dart';
import 'package:joistic/core/constants/app_constants.dart';
import 'package:joistic/core/constants/app_strings.dart';
import 'package:joistic/core/widgets/card_widget.dart';
import 'package:joistic/core/widgets/shimmer.dart';
import 'package:joistic/core/widgets/shimmer_card.dart';
import 'package:joistic/core/widgets/text_widget.dart';
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
                      : Container(
                          margin: EdgeInsets.only(top: AppConstants.appBarHeight),
                          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      AppStrings.menu_image,
                                      width: 35,
                                      height: 50,
                                    ),
                                    CustomCard(
                                      width: 60,
                                      height: 40,
                                      padding: 8,
                                      child: Image.asset(
                                        AppStrings.search_image,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 15),
                                child: CustomText(
                                  text: AppStrings.titleText,
                                  fontWeight: FontWeight.w700,
                                  size: 40,
                                ),
                              ),
                              Expanded(
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final company = controller.state?[index];
                                      return CustomCard(
                                        height: Get.width * 0.22,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: Get.width * 0.15,
                                              margin: EdgeInsets.only(right: 15),
                                              padding: EdgeInsets.all(15),
                                              decoration: BoxDecoration(color: AppColors.whiteLite, shape: BoxShape.circle),
                                              child: CachedNetworkImage(
                                                imageUrl: company!.logo,
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
                                                    size: 20,
                                                  ),
                                                  CustomText(
                                                    text: company.description,
                                                    fontWeight: FontWeight.w300,
                                                    color: AppColors.light_black,
                                                    size: 16,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              margin: EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color(0xFF645EFA).withOpacity(0.8),
                                                  width: 13.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) => SizedBox(
                                          height: Get.height * 0.04,
                                        ),
                                    itemCount: controller.state!.length),
                              ),
                            ],
                          ),
                        ),
            ),
          ),
        ),
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
