import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic/core/constants/app_colors.dart';
import 'package:joistic/core/constants/app_constants.dart';
import 'package:joistic/features/company_details/domain/controllers/company_details_controller.dart';

class CompanyDetailsView extends GetView<CompanyDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Listings'),
      ),
      body: Container(
          width: AppConstants.screenWidth,
          height: AppConstants.screenHeight,
          color: AppColors.whiteLite,
          child: controller.status == RxStatus.loading()
              ? Center(child: CircularProgressIndicator())
              : controller.state!.isEmpty
                  ? Center(child: Text('No companies available'))
                  : ListView.builder(
                      itemCount: controller.state?.length,
                      itemBuilder: (context, index) {
                        final company = controller.state?[index];
                        return ListTile(
                          title: Text(company!.title),
                          subtitle: Text(company.description),
                        );
                      },
                    )),
    );
  }
}
