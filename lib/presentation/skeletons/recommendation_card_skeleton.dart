import 'package:flutter/material.dart';
import 'package:greentick_assignment/constants/colors.dart';
import 'package:greentick_assignment/utils/utility.dart';
import 'package:shimmer/shimmer.dart';

class RecommendationCardSkeleton extends StatelessWidget {
  final double? height;
  final double radius;

  const RecommendationCardSkeleton({
    Key? key,
    this.height = 0.22,
    this.radius = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      key: const Key('progressShimmer'),
      baseColor: ColorsBase.light300Grey,
      highlightColor: ColorsBase.light100Grey,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 30.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CommonSkeletonContainer(0.4, 0.02, 0),
                const Spacer(),
                const CommonSkeletonContainer(0.15, 0.02, 0),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: [
                  CommonSkeletonContainer(0.75, height!, 14),
                  const SizedBox(width: 15),
                  CommonSkeletonContainer(0.75, height!, 14),
                  const SizedBox(width: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CommonSkeletonContainer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const CommonSkeletonContainer(this.width, this.height, this.radius);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context) * width,
      height: getHeight(context) * height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: ColorsBase.white,
      ),
    );
  }
}
