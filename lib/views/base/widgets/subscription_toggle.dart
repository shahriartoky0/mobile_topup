import 'package:flutter/cupertino.dart' show Center;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/subscription_tab_controller.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';

class SubscriptionToggle extends StatelessWidget {
  // Get the controller outside the widget to avoid re-initialization on rebuild
  final SubscriptionTabController controller =
      Get.find<SubscriptionTabController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Obx(() {
              return InkWell(
                onTap: () {
                  controller.isSelected.value = true; // Set to true
                },
                child: Container(
                  height: 57,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:
                        controller.isSelected.value
                            ? AppColors.primaryColor
                            : AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                  child: Center(
                    child: Text(
                      AppString.topUp.tr,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            controller.isSelected.value
                                ? AppColors.green
                                : AppColors.black,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          Flexible(
            flex: 1,
            child: Obx(() {
              return InkWell(
                onTap: () {
                  controller.isSelected.value = false;
                },
                child: Container(
                  width: double.infinity,
                  height: 57,
                  decoration: BoxDecoration(
                    color:
                        !controller.isSelected.value
                            ? AppColors.primaryColor
                            : AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                  child: Center(
                    child: Text(
                      AppString.plans,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            controller.isSelected.value
                                ? AppColors.black
                                : AppColors.green,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
