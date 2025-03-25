import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/views/screens/accounts/help_page.dart';
import 'package:untitled/views/screens/topup/topup_landing.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    RxBool isLanguageNotificationEnabled = false.obs;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
                ],
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                  onPressed: () {
                    Get.to(HelpPage());
                    // if (_formKey.currentState!.validate()) {}
                  },

                  child: Text(AppString.getHelp.tr, style: Theme.of(context).textTheme.labelMedium),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Column(
                  children: <Widget>[
                    // Message Notification Row
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(TopUpLanding(showText: false));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppString.language,
                              style: Theme.of(
                                context,
                              ).textTheme.displayMedium!.copyWith(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.black.withValues(alpha: 0.7),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),

                    // Language Notification Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          AppString.notification,
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16),
                        ),
                        Obx(
                          () => Switch(
                            activeColor: AppColors.green,
                            inactiveThumbColor: AppColors.primaryColor,
                            value: isLanguageNotificationEnabled.value,
                            activeTrackColor: AppColors.primaryColor,
                            onChanged: (bool value) {
                              print(value);
                              isLanguageNotificationEnabled.value = value;
                            },
                          ),
                        ),
                      ],
                    ),

                    const Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
