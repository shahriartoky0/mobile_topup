import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/widgets/textUnderlne.dart';

import 'package:untitled/views/screens/auth/verify_phone.dart';

import '../../base/components/custom_text_field.dart';
import '../../base/widgets/container_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}


class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _forgotPasswordTEController =
  TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.forgotPassword.tr,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 14),
              Text(
                AppString.pleaseEnterYourNumberToResetPassword.tr,
                style: Theme.of(
                  context,
                ).textTheme.displayMedium!.copyWith(fontSize: 13),
                textAlign: TextAlign.start,
              ),

              SizedBox(height: 24),
              Text(
                AppString.yourNumber.tr,
               ),
              SizedBox(height: 14),
              AppCustomContainerField(
                containerChild: MyTextFormFieldWithIcon(
                  controller: _forgotPasswordTEController,
                  validator: (value) {
                    return isPhoneNumberValid(value);
                  },
                  formHintText: AppString.enterYourNumber.tr,
                  prefixIcon: Icon(
                    CupertinoIcons.phone,
                   ),
                ),
              ),

              SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    /// TODO: OTP logic
                    // // if (_formKey.currentState!.validate()) {}
                    Get.to(() => VerifyPhoneScreen());
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

  String? isPhoneNumberValid(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    } else if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
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
