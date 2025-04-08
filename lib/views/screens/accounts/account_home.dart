import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_icons.dart';
import 'package:untitled/utilities/app_images.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/base/components/network_svg_image%20.dart';
import 'package:untitled/views/screens/accounts/about_page.dart';
import 'package:untitled/views/screens/accounts/privacy_page.dart';
import 'package:untitled/views/screens/auth/phone_number_sign_in.dart';

import '../topup/topup_landing.dart';
import 'account_profile.dart';
import 'account_settings.dart';
import 'help_page.dart';

class AccountHome extends StatelessWidget {
  const AccountHome({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLanguageNotificationEnabled = false.obs;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const InAppbar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                        onPressed: () {
                          Get.to(HelpPage()); // if (_formKey.currentState!.validate()) {}
                        },

                        child: Text(
                          AppString.getHelp.tr,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: () {
                        Get.to(const AccountProfile());
                      },
                      child: Row(
                        spacing: 10,
                        children: <Widget>[
                          AssetSvgImage(assetName: AppIcons.appSettingsIcon, width: 50, height: 50),
                          Text(
                            AppString.accountSettings.tr,
                            style: textTheme(
                              context,
                            ).displayMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        Get.to(const AboutPage());
                      },
                      child: Row(
                        spacing: 10,
                        children: <Widget>[
                          AssetSvgImage(assetName: AppIcons.appAboutIcon, width: 50, height: 50),
                          Text(
                            AppString.about.tr,
                            style: textTheme(
                              context,
                            ).displayMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        Get.to(const TopUpLanding(showText: false));
                      },
                      child: Row(
                        spacing: 10,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(child: Icon(Icons.language, color: AppColors.green)),
                          ),
                          Text(
                            AppString.language.tr,
                            style: textTheme(
                              context,
                            ).displayMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Schedule TopUp
                    InkWell(
                      onTap: () {
                        /// Schedule topup page
                      },
                      child: Row(
                        spacing: 10,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.cell_tower_outlined,
                                color: AppColors.green,
                              ),
                            ),
                          ),                          Text(
                            AppString.scheduleTopUp.tr,
                            style: textTheme(
                              context,
                            ).displayMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        Get.to(const TopUpLanding(showText: false));
                      },
                      child: Row(
                        spacing: 10,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.notifications_none_outlined,
                                color: AppColors.green,
                              ),
                            ),
                          ),

                          Text(
                            AppString.notification.tr,
                            style: textTheme(
                              context,
                            ).displayMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
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
                    ),
                    const SizedBox(height: 36),
                    const Divider(),
                    const SizedBox(width: 16),
                    ListTile(
                      onTap: () {
                        Get.to(PrivacyPage(heading: AppString.termsAndConditions.tr));
                      },
                      title: Text(
                        AppString.termsAndConditions.tr,
                        style: textTheme(
                          context,
                        ).displayMedium!.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(PrivacyPage(heading: AppString.privacyPolicy.tr));
                      },
                      title: Text(
                        AppString.privacyPolicy.tr,
                        style: textTheme(
                          context,
                        ).displayMedium!.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 80),
              TextButton(
                onPressed: () {
                  Get.to(PhoneNumberSignIn());
                },
                child: Text(
                  AppString.signOut.tr,
                  style: textTheme(context).displayMedium!.copyWith(
                    color: AppColors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class InAppbar extends StatelessWidget {
  const InAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 60),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const CircleAvatar(radius: 24, child: Icon(Icons.person, size: 48)),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppString.helloGoodEvening,
                    style: textTheme(context).displayMedium!.copyWith(color: AppColors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Abdul Karim",
                    style: textTheme(context).bodyMedium!.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Row(
            //   children: <Widget>[
            //     const SizedBox(width: 16),
            //     Text(
            //       AppString.myDetails.tr,
            //       style: textTheme(
            //         context,
            //       ).displayMedium!.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
            //       textAlign: TextAlign.center,
            //       overflow: TextOverflow.ellipsis,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
