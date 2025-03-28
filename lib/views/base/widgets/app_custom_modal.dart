import 'package:flutter/material.dart';
 import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/views/screens/auth/phone_number_sign_in.dart';

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
        borderRadius: BorderRadius.vertical(top: Radius.circular(24) ),
        border: Border(
          top: BorderSide(
            color: AppColors.green.withValues(
              alpha: 0.6,
            ), // Color only on top
            width: 5, // Border thickness
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48  ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8 ), // Spacer
            Container(
              height: 6 ,
              width: 50 ,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(10 ),
              ),
            ),
            SizedBox(height: 32 ),

            CircleAvatar(
              radius: 66 ,
              backgroundColor: AppColors.primaryColor.withValues(alpha: .05),
              child: CircleAvatar(
                radius: 48 ,
                backgroundColor: AppColors.primaryColor,
                child: CircleAvatar(
                  radius: 18 ,
                  backgroundColor: AppColors.green,
                  child: const Icon(
                    Icons.check,
                    size: 26,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32 ),
            Text(
              AppString.passwordChanged.tr,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10 ),
            Text(
              AppString
                  .returnToTheLoginPageToEnterYourAccountWithYourNewPassword.tr,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32 ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => PhoneNumberSignIn());
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
