import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_theme.dart';

import 'package:untitled/views/screens/auth/forgot_password_page.dart';
import 'package:untitled/views/screens/auth/sign_up_page.dart';
import 'package:untitled/views/screens/mainbottom_nav.dart';

import '../../../utilities/app_colors.dart';
import '../../base/components/custom_text_field.dart';
import '../../base/widgets/container_text_field.dart';
import '../topup/topup_payment_details.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailTEController = TextEditingController();

  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(32, 108, 32, 0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppString.signInToYourAccount.tr, style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 14),
                  Text(
                    AppString.welcomeBackPleaseEnterYourDetails.tr,
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 32),
                  Text(AppString.yourNumber.tr),
                  const SizedBox(height: 14),
                  AppCustomContainerField(
                    containerChild: MyTextFormFieldWithIcon(
                      formHintText: AppString.phoneNumberHintText.tr,
                      keyBoardType: TextInputType.phone,

                      prefixIcon: const Icon(CupertinoIcons.phone),
                      controller: _emailTEController,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '${AppString.pleaseEnterYour} ${AppString.email}!!';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        print("Email Input: $value");
                      },
                    ),
                  ),

                  const SizedBox(height: 16),
                  Text(AppString.password.tr, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 14),
                  AppCustomContainerField(
                    containerChild: MyTextFormFieldWithIcon(
                      isPassword: true,
                      formHintText: AppString.enterPassword,
                      prefixIcon: const Icon(Icons.lock_outline),
                      controller: _passwordTEController,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '${AppString.pleaseEnterYour} Password !!';
                        }
                        return null;
                      },

                      onChanged: (value) {
                        print("Email Input: $value");
                      },
                    ),
                  ),

                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(const ForgotPasswordScreen());
                        },
                        child: Text(
                          AppString.forgotPassword.tr,
                          style: const TextStyle(color: AppColors.primaryColor),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO:signIn logic
                        // if (_formKey.currentState!.validate()) {}
                        FocusScope.of(context).unfocus();
                        clearingTextField();
                        Get.offAll(const PaymentDetailsPage(fromSignIn: true));
                      },
                      child: Text(
                        AppString.signIn.tr,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppString.dontHaveAnAccount.tr,
                          style: textTheme(context).displayMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(const SignUpPage());
                          },
                          child: Text(
                            AppString.signUp.tr,
                            style: const TextStyle(color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // validate Email Address
  String? isEmailValid(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void clearingTextField() {
    _emailTEController.clear();
    _passwordTEController.clear();
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
