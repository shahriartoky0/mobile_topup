import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/base/widgets/custom_appbar.dart';

import '../../base/components/custom_text_field.dart';
import '../../base/widgets/container_text_field.dart';

class TopUpNumberScreen extends StatelessWidget {
  const TopUpNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _phoneTEController = TextEditingController();
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            AppString.confirm.tr,
            style: textTheme(context).labelMedium,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Get.back(),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(12),
                    ),
                    onPressed: () {},
                    child: Text(
                      AppString.contacts.tr,
                      style: textTheme(context).labelMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(AppString.pleaseEnterPhoneNumber),
              Text(AppString.youWantToTopUp),
              SizedBox(height: 12),

              /// Phone Number field
              AppCustomContainerField(
                containerChild: MyTextFormFieldWithIcon(
                  formHintText: AppString.phoneNumberHintText.tr,
                  keyBoardType: TextInputType.number,
                  prefixIcon: Icon(CupertinoIcons.phone),
                  controller: _phoneTEController,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return '${AppString.pleaseEnterYour} ${AppString.phoneNumber.tr} !!';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
