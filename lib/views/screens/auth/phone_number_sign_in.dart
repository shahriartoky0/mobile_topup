import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_icons.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/views/screens/auth/verify_phone.dart';
import 'package:untitled/views/screens/auth/sign_in_page.dart';

import '../../../utilities/app_theme.dart';
import '../../base/components/custom_text_field.dart';
import '../../base/components/network_svg_image .dart';
import '../../base/widgets/container_text_field.dart';
import 'otp_log_in.dart';

class PhoneNumberSignIn extends StatefulWidget {
  PhoneNumberSignIn({super.key});

  @override
  State<PhoneNumberSignIn> createState() => _PhoneNumberSignInState();
}

class _PhoneNumberSignInState extends State<PhoneNumberSignIn> {
  final TextEditingController _phoneTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(AppString.signInToYourAccount.tr, style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 14),
                  Text(
                    AppString.weWillTextYouACode.tr,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 50),

                  AppCustomContainerField(
                    containerChild: MyTextFormFieldWithIcon(
                      formHintText: AppString.phoneNumberHintText.tr,
                      keyBoardType: TextInputType.phone,
                      prefixIcon: const Icon(CupertinoIcons.phone),
                      controller: _phoneTEController,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '${AppString.pleaseEnterYour} ${AppString.phoneNumber}!!';
                        }
                        // You can add more phone number validation here if necessary
                        return null;
                      },
                      onChanged: (String value) {
                        print("Phone Input: $value");
                      },
                    ),
                  ),

                  const SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   FocusScope.of(context).unfocus();
                        //   clearingTextField();
                        // }
                          Get.to(const OtpLogin());
                      },
                      child: Text(
                        AppString.confirmPhoneNumber.tr,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(width: 100, child: Divider(color: AppColors.primaryColor)),
                      Text(AppString.orContinueWith.tr, style: textTheme(context).displayMedium),
                      const SizedBox(width: 100, child: Divider(color: AppColors.primaryColor)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.green),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.to(SignInPage());
                          },
                          icon: const Icon(Icons.email_outlined, color: AppColors.primaryColor),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.green),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: AssetSvgImage(
                            assetName: AppIcons.gmailIcon,
                            width: 25,
                            height: 25,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void clearingTextField() {
    _phoneTEController.clear();
  }

  @override
  void dispose() {
    _phoneTEController.dispose();
    super.dispose();
  }
}
