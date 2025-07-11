import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_colors.dart';

import '../../../utilities/app_strings.dart';
import '../../screens/auth/sign_in_page.dart';

class AppCustomModal extends StatelessWidget {
  const AppCustomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24).r),
        border: Border(
          top: BorderSide(
            color: AppColors.primaryColor.withValues(
              alpha: 0.6,
            ), // Color only on top
            width: 5, // Border thickness
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h), // Spacer
            Container(
              height: 6.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: AppColors.modalHandleColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            SizedBox(height: 32.h),

            CircleAvatar(
              radius: 66.r,
              backgroundColor: AppColors.primaryColor.withValues(alpha: .05),
              child: CircleAvatar(
                radius: 48.r,
                backgroundColor: AppColors.primaryColor,
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: AppColors.white,
                  child: const Icon(
                    Icons.check,
                    size: 26,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              AppString.passwordChanged.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 10.h),
            Text(
              AppString
                  .returnToTheLoginPageToEnterYourAccountWithYourNewPassword.tr,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => SignInPage());
                },
                child: Text(
                  AppString.backToSignIn.tr,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
