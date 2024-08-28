import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic/core/constants/app_colors.dart';
import 'package:joistic/core/widgets/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  final double widthFactor;
  final double heightFactor;
  const ShimmerCard({super.key, this.widthFactor = 0.85, this.heightFactor = 0.15})
      : assert(
          (widthFactor >= 0.0 && widthFactor <= 1.0),
          'Width must be between 0.0 and 1.0 when provided',
        ),
        assert(
          (heightFactor >= 0.0 && heightFactor <= 1.0),
          'Height must be between 0.0 and 1.0 when provided',
        );
  @override
  Widget build(BuildContext context) {
    double cardWidth = widthFactor * Get.width;
    double cardHeight = heightFactor * Get.height;

    return Container(
      width: cardWidth,
      height: cardHeight,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          ShimmerLoading(
            isLoading: true,
            child: Container(
              width: Get.width * 0.20,
              margin: EdgeInsets.only(right: 30, left: 20),
              decoration: BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _shimmerTextLoader(Get.width * 0.35),
              _shimmerTextLoader(Get.width * 0.42),
            ],
          )
        ],
      ),
    );
  }

  ShimmerLoading _shimmerTextLoader(double width) {
    return ShimmerLoading(
      isLoading: true,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 2, 0, 2),
        child: SizedBox(
          width: width,
          height: Get.width * 0.025,
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}
