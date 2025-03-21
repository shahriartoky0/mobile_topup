import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../utilities/app_theme.dart';

class TopUpDashboard extends StatelessWidget {
  const TopUpDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textThemeApp = Theme.of(context).textTheme;
    final SubscriptionTabController controller = Get.put(
      SubscriptionTabController(),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            //// ============================= Button ===================>
            SubscriptionToggle(),
            SizedBox(height: 18),
            GetX<SubscriptionTabController>(
              builder: (controller) {
                return controller.isSelected.value
                    ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(children: [SizedBox(height: 18)]);
                      },
                      itemCount: 3,
                    )
                    : Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.appBarColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryColor,
                            blurRadius: 1,
                            offset: Offset(0, 6),
                          ),
                        ],
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date",
                            style: Theme.of(context).textTheme.displayMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Wednesday, February 19, 09.00 pm",
                            style: textThemeApp.displayLarge,
                          ),
                          // CustomPaint(
                          //   size: Size(double.infinity, 30.h),
                          //   painter: DottedLinePainter(),
                          // ),
                          Text(
                            "Location",
                            style: Theme.of(context).textTheme.displayMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text("Somewhere", style: textThemeApp.displayLarge),
                          // CustomPaint(
                          //   size: Size(double.infinity, 30.h),
                          //   painter: DottedLinePainter(),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Event Cost ",
                                style: textThemeApp.displayLarge,
                              ),
                              Text("\$200", style: textThemeApp.displayLarge),
                            ],
                          ),
                          // CustomPaint(
                          //   size: Size(double.infinity, 30.h),
                          //   painter: DottedLinePainter(),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "One Time Ticket",
                                style: textThemeApp.displayLarge,
                              ),
                              Text("\$20", style: textThemeApp.displayLarge),
                            ],
                          ),
                          // CustomPaint(
                          //   size: Size(double.infinity, 30.h),
                          //   painter: DottedLinePainter(),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total", style: textThemeApp.displayLarge),
                              Text("\$220", style: textThemeApp.displayLarge),
                            ],
                          ),
                        ],
                      ),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionTabController extends GetxController {
  RxBool isSelected = true.obs;
}

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
                            : AppColors.appBarColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                  child: Center(
                    child: Text(
                      AppString.searchCountry,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            controller.isSelected.value
                                ? Colors.white
                                : AppColors.primaryColor,
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
                            : AppColors.appBarColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                  child: Center(
                    child: Text(
                      AppString.pleaseEnterPhoneNumber,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            controller.isSelected.value
                                ? AppColors.primaryColor
                                : AppColors.white,
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
