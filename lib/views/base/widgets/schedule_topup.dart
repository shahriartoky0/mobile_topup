import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_theme.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';

class ScheduleTopUp extends StatelessWidget {
  const ScheduleTopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final ScheduleTopUpController controller = Get.put(
      ScheduleTopUpController(),
    ); // Access the controller

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppString.scheduleTopUp.tr,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Text(AppString.packageAutoTopUpInfo.tr, style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 16),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TopUpOption(
                label: '7 Day',
                isSelected: controller.selectedDay.value == '7 Day',
                // Compare with the controller value
                onPressed: () {
                  controller.selectPackage('7 Day'); // Update the selected package
                },
              ),
              TopUpOption(
                label: '14 Day',
                isSelected: controller.selectedDay.value == '14 Day',
                // Compare with the controller value
                onPressed: () {
                  controller.selectPackage('14 Day'); // Update the selected package
                },
              ),
              TopUpOption(
                label: '30 Day',
                isSelected: controller.selectedDay.value == '30 Day',
                // Compare with the controller value
                onPressed: () {
                  controller.selectPackage('30 Day'); // Update the selected package
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 36),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.red),

              onPressed: () {
                // Cancel action, close the bottom sheet
                Get.back();
              },
              child: Text(
                AppString.cancel.tr,
                style: textTheme(context).displayMedium?.copyWith(color: AppColors.red),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(backgroundColor: AppColors.primaryColor),
              onPressed: () {
                // Confirm action, print the selected day
                print("Selected Package: ${controller.selectedDay.value}");
                Get.back(); // Close the bottom sheet
              },
              child: Text(
                AppString.confirm.tr,
                style: textTheme(context).displayMedium!.copyWith(color: AppColors.green),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TopUpOption extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isSelected;

  const TopUpOption({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.green : Colors.grey),
          boxShadow: [
            BoxShadow(offset: const Offset(0, 4), color: isSelected ? Colors.green : Colors.grey),
          ],
          color: isSelected ? AppColors.green.withValues(alpha: 0.1) : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: textTheme.labelMedium!.copyWith(
            color: isSelected ? Colors.white : Colors.black, // Change text color when selected
          ),
        ),
      ),
    );
  }
}

class ScheduleTopUpController extends GetxController {
  // Observable variable to track the selected package
  RxString selectedDay = '30 Day'.obs;

  // Method to update the selected package
  void selectPackage(String day) {
    selectedDay.value = day;
  }
}
