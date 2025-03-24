import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
    this.activeIndicatorColor = Colors.white,
    this.inactiveIndicatorColor = Colors.white54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // PageView.builder to display images
        Container(
          height: height,
          child: PageView.builder(
            itemCount: imgList.length,
            onPageChanged: (index) {
              _controller.updateIndex(index); // Update index when page changes
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  color: Colors.black,

                  image: DecorationImage(
                    image: NetworkImage(imgList[index]),
                    opacity: 0.7,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        // Page indicator
        Obx(() {
          return Positioned(
            bottom: 0,
            left: 50,

            child: Column(
              // mainAxisAlignment: MainAxisAlignment.e,
              children: [
                Text(
                  "Unlimited Access",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "bagel",
                  ),
                ),
                Text(
                  "All dinners every wednesday",
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 90),
                Row(
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
                        border: Border.all(color: AppColors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
