import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:get/get.dart';

import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/components/custom_toast.dart';
import 'package:untitled/views/base/widgets/textUnderlne.dart';

import '../../base/components/custom_text_field.dart';
import '../../base/widgets/app_custom_modal.dart';
import '../../base/widgets/container_text_field.dart';



class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _resetPassTEController = TextEditingController();
  final TextEditingController _confirmPassTeController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(32, 108, 32, 0) ,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.resetPassword.tr,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 14 ),

                  Text(
                    AppString.enterANewPassword.tr,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 32  ),
                  Text(
                    AppString.enterPassword.tr,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 14 ),
                  AppCustomContainerField(
                    containerChild: MyTextFormFieldWithIcon(
                      isPassword: true,
                      formHintText: AppString.enterPassword,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                      ),
                      controller: _resetPassTEController,
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
                  SizedBox(height: 14 ),
                  AppCustomContainerField(
                    containerChild: MyTextFormFieldWithIcon(
                      isPassword: true,
                      formHintText: AppString.confirmPassword,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                       ),
                      controller: _confirmPassTeController,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '${AppString.pleaseEnterYour} Password again !!';
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 32 ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        clearingTextField();
                        if (_resetPassTEController.text.trim() !=
                            _confirmPassTeController.text.trim()) {
                          CustomToast().showToast(
                            context: context,
                            message: AppString.passwordsDoNotMatch,
                            isError: true,
                          );
                          return;
                        }
                        // TODO: password Reset logic
                        // if (_formKey.currentState!.validate()) {}
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24) ,
                            ), // Curved top border
                          ),
                          builder: (BuildContext context) {
                            return AppCustomModal();
                          },
                        ).whenComplete(() {
                          // This callback is called when the modal is dismissed
                          FocusScope.of(context).unfocus();
                        });

                      },
                      child: Text(
                        AppString.resetPassword.tr,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
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

  void clearingTextField() {
    _resetPassTEController.clear();
    _confirmPassTeController.clear();
  }

  @override
  void dispose() {
    _confirmPassTeController.dispose();
    _resetPassTEController.dispose();
    super.dispose();
  }
}
