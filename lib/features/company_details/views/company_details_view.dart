import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic/core/constants/app_colors.dart';
import 'package:joistic/core/constants/app_constants.dart';
import 'package:joistic/core/widgets/card_widget.dart';
import 'package:joistic/core/widgets/shimmer.dart';
import 'package:joistic/core/widgets/shimmer_card.dart';
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
                          child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                              itemBuilder: (context, index) {
                                final company = controller.state?[index];
                                return CustomCard(
                                  height: Get.width * 0.25,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: Get.width * 0.20,
                                        margin: EdgeInsets.only(right: 15),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  company!.logo,
                                                ),
                                                fit: BoxFit.cover)),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: Get.height * 0.05,
                                  ),
                              itemCount: /* controller.state!.length */ 6)),
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
