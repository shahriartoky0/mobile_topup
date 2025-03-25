import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/views/base/components/cached_image.dart';

import '../../../utilities/app_colors.dart';

class CarouselController extends GetxController {
  var currentIndex = 0.obs; // Observable variable to track the current index

  // Method to update the index
  void updateIndex(int index) {
    currentIndex.value = index;
  }
}

class ImageCarousel extends StatelessWidget {
  final CarouselController _controller = Get.put(CarouselController());

  final List<String> imgList;
  final double height;
  final double indicatorWidth;
  final double indicatorHeight;
  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;

  ImageCarousel({
    Key? key,
    required this.imgList,
    this.height = 300.0,
    this.indicatorWidth = 20.0,
    this.indicatorHeight = 10.0,
    this.activeIndicatorColor = Colors.black,
    this.inactiveIndicatorColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageView.builder to display images
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          height: height,
          child: PageView.builder(
            itemCount: imgList.length,
            onPageChanged: (index) {
              _controller.updateIndex(index); // Update index when page changes
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(24),

                child: Container(
                  decoration: BoxDecoration(color: Colors.black),
                  child: CachedImage(imageUrl: imgList[index], fit: BoxFit.fill),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8),
        // Page indicator
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              imgList.length,
              (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width:
                    _controller.currentIndex.value == index
                        ? indicatorWidth
                        : indicatorWidth * 0.6,
                height: indicatorHeight,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color:
                      _controller.currentIndex.value == index
                          ? activeIndicatorColor
                          : inactiveIndicatorColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: AppColors.primaryColor),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
