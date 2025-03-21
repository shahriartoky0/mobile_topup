import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:get/get.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/views/screens/auth/sign_in_page.dart';

import '../../../utilities/app_strings.dart';
import '../../base/components/custom_text_field.dart';
import '../../base/components/reusable_date_picker_field.dart';
import '../../base/widgets/app_custom_textfield.dart';
import '../../base/widgets/custom_appbar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _dateTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppbar(headingText: ''),
              Container(
                margin: EdgeInsets.fromLTRB(32, 32, 32, 0) ,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.signUpToYourAccount.tr,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 14 ),
                      Text(
                        AppString.welcomeBackPleaseEnterYourDetails.tr,
                        style: Theme.of(context).textTheme.displayMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 32 ),
                      Text(
                        AppString.name.tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 14 ),
                      AppCustomContainerField(
                        containerChild: MyTextFormFieldWithIcon(
                          formHintText: AppString.firstName.tr,

                          controller: _firstNameTEController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return '${AppString.pleaseEnterYour} ${AppString.firstName.tr} !!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 16 ),
                      AppCustomContainerField(
                        containerChild: MyTextFormFieldWithIcon(
                          formHintText: AppString.lastName.tr,

                          controller: _lastNameTEController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return '${AppString.pleaseEnterYour} ${AppString.lastName.tr} !!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 16 ),

                      /// =================== Date of birth =======>
                      Text(
                        AppString.dateOfBirth.tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 14 ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16 ),
                          border: Border.all(
                            color: AppColors.textFieldBorderColor,
                            width: 1,
                          ),
                        ),
                        child: AppCustomContainerField(
                          containerChild: ReusableDatePickerField(
                            hintText: AppString.date.tr,
                            controller: _dateTEController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a date!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 16 ),
                      Text(
                        AppString.yourEmail.tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 14 ),

                      MyTextFormFieldWithIcon(
                        formHintText: AppString.enterYourEmail.tr,
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: AppColors.primaryColor,
                        ),
                        controller: _emailTEController,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return '${AppString.pleaseEnterYour} ${AppString.yourEmail}!!';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16 ),
                      Text(
                        AppString.phoneNumber.tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 14 ),
                      AppCustomContainerField(
                        containerChild: MyTextFormFieldWithIcon(
                          formHintText: AppString.phoneNumber.tr,
                          keyBoardType: TextInputType.number,

                          controller: _phoneTEController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return '${AppString.pleaseEnterYour}${AppString.phoneNumber} !!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 16 ),
                      Text(
                        AppString.password.tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 14 ),
                      AppCustomContainerField(
                        containerChild: MyTextFormFieldWithIcon(
                          isPassword: true,
                          formHintText: AppString.enterPassword.tr,
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            color: AppColors.primaryColor,
                          ),
                          controller: _passwordTEController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return '${AppString.pleaseEnterYour} Password !!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 16 ),
                      Text(
                        AppString.confirmPassword.tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 16 ),
                      AppCustomContainerField(
                        containerChild: MyTextFormFieldWithIcon(
                          isPassword: true,
                          formHintText: AppString.confirmPassword.tr,
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            color: AppColors.primaryColor,
                          ),
                          controller: _confirmPasswordTEController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return '${AppString.pleaseEnterYour.tr} Password again !!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 32 ),
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isChecked = newValue ?? false;
                              });
                            },
                            checkColor: AppColors.white,
                            focusColor: AppColors.white,
                            activeColor: AppColors.primaryColor,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isChecked = !_isChecked;
                                });
                              },
                              child: Text(
                                AppString
                                    .byCreatingAnAccountIAcceptTheTermsConditions.tr,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32 ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _isChecked
                                    ? AppColors.primaryColor
                                    : AppColors.primaryColor.withValues(
                                      alpha: .5,
                                    ),
                          ),
                          onPressed: () {
                            FocusScope.of(context).unfocus();

                            if (_isChecked) {
                              setState(() {
                                clearTextFields(); // Clear fields inside setState to trigger UI refresh
                              });

                              // TODO: Sign up logic
                              // if (_formKey.currentState!.validate()) {}
                            }
                          },
                          child: Text(
                            AppString.signUp.tr,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 32 ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(AppString.alreadyHaveAnAccount.tr),
                            TextButton(
                              onPressed: () {
                                Get.to(SignInPage());
                              },
                              child: Text(
                                AppString.signIn.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clearTextFields() {
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _dateTEController.clear();
    _emailTEController.clear();

    _phoneTEController.clear();

    _passwordTEController.clear();

    _confirmPasswordTEController.clear();
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _dateTEController.dispose();
    _emailTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
