import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/widgets/textUnderlne.dart';

import 'package:untitled/views/screens/auth/verify_mail.dart';

import '../../base/components/custom_text_field.dart';
import '../../base/widgets/app_custom_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

final TextEditingController _forgotPasswordTEController =
    TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.forgotPassword.tr,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 14.h),
              Text(
                AppString.pleaseEnterYourEmailAddressToResetPassword.tr,
                style: Theme.of(
                  context,
                ).textTheme.displayMedium!.copyWith(fontSize: 13.sp),
                textAlign: TextAlign.start,
              ),

              SizedBox(height: 24.h),
              Text(
                AppString.yourEmail.tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 14.h),
              AppCustomContainerField(
                containerChild: MyTextFormFieldWithIcon(
                  controller: _forgotPasswordTEController,
                  validator: (value) {
                    return isEmailValid(value);
                  },
                  formHintText: AppString.enterEmail.tr,
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),

              SizedBox(height: 32.h),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    /// TODO: OTP logic
                    // // if (_formKey.currentState!.validate()) {}
                    Get.to(() => VerifyMailScreen());
                  },
                  child: Text(
                    AppString.sendOTP.tr,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? isEmailValid(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    ).hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void clearTextFields() {
    _forgotPasswordTEController.clear();
  }

  @override
  void dispose() {
    _forgotPasswordTEController.dispose();

    super.dispose();
  }
}
