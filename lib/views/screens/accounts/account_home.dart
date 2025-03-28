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

import '../../base/widgets/app_custom_modal.dart';
import '../auth/sign_in_page.dart';
import 'account_profile.dart';
import 'account_settings.dart';
import 'help_page.dart';

class AccountHome extends StatelessWidget {
  const AccountHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const InAppbar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                        onPressed: () {
                          Get.to(const AccountSettings());
                          // if (_formKey.currentState!.validate()) {}
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
                    const SizedBox(height: 48),
                    const Divider(),
                    const SizedBox(width: 30),
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
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppString.helloGoodEvening,
                    style: textTheme(context).displayMedium!.copyWith(color: AppColors.white),
                  ),
                  const SizedBox(height: 5),
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
