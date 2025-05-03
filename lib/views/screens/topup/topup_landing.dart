import 'dart:developer';

import 'package:country/src/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/base/widgets/custom_appbar.dart';
import 'package:untitled/views/screens/home/home_landing_page.dart';
import 'package:untitled/views/screens/mainbottom_nav.dart';
import 'package:untitled/views/screens/topup/topup_dashboard.dart';
import '../../../controller/top_up_country_search_controller.dart';
import '../../../utilities/app_colors.dart';
import '../../base/components/custom_text_field.dart';

class TopUpLanding extends StatelessWidget {
  final bool showText;
  final bool fromOnBoarding;

  const TopUpLanding({super.key, this.showText = true, this.fromOnBoarding = false});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller via Get.put()
    final TopUpLandingController controller = Get.find<TopUpLandingController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              CustomAppbar(
                headingText: '',
                leadingWidget: IconButton(
                  onPressed: () {
                    if (fromOnBoarding) {
                      Get.to(const MainBottomNavScreen());
                      return;
                    }
                    // Get.offAll(MainBottomNavScreen());
                    Get.back();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (showText)
                      Center(child: Text(AppString.whereAreYouSendingTo.tr))
                    else
                      const SizedBox.shrink(),
                    const SizedBox(height: 16),
                    // Password Field (if still needed)
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.textFieldBorderColor, width: 1),
                      ),
                      child: MyTextFormFieldWithIcon(
                        formHintText: AppString.searchCountry.tr,
                        controller: controller.searchController,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return '${AppString.pleaseEnterYour} Password !!';
                          }
                          return null;
                        },
                        onChanged: (String value) {
                          // Update search results via the controller.
                          controller.updateSearch(value);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Popular Countries
                    Text(AppString.popularCountries.tr, style: textTheme(context).headlineMedium),
                    const SizedBox(height: 8),
                    Row(spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              controller.allCountries[2].flagEmoji,
                              style: const TextStyle(fontSize: 25),
                            ),
                            Text(
                              controller.allCountries[2].alpha3,
                              style: textTheme(context).headlineMedium,
                            ),
                          ],
                        ), Column(
                          children: <Widget>[
                            Text(
                              controller.allCountries[177].flagEmoji,
                              style: const TextStyle(fontSize: 25),
                            ),
                            Text(
                              controller.allCountries[177].alpha3,
                              style: textTheme(context).headlineMedium,
                            ),
                          ],
                        ), Column(
                          children: <Widget>[
                            Text(
                              controller.allCountries[192].flagEmoji,
                              style: const TextStyle(fontSize: 25),
                            ),
                            Text(
                              controller.allCountries[192].alpha3,
                              style: textTheme(context).headlineMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(AppString.allCountries.tr, style: textTheme(context).headlineMedium),
                    // Reactive list of filtered countries.
                    Obx(
                      () => ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.filteredCountries.length,
                        separatorBuilder:
                            (BuildContext context, int index) => Divider(
                              color: AppColors.primaryColor.withValues(alpha: 0.2),
                              thickness: 1,
                            ),
                        itemBuilder: (BuildContext context, int index) {
                          final Country country = controller.filteredCountries[index];
                          return InkWell(
                            onTap: () {
                              controller.selectCountry(index);
                              // log(controller.selectedIndex.toString());
                              // log(index.toString());
                              Get.to(TopUpDashboard());
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              child: Row(
                                children: <Widget>[
                                  Obx(() {
                                    return Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.white,
                                        border: Border.all(color: AppColors.primaryColor, width: 2),
                                        boxShadow: <BoxShadow>[
                                          if (controller.selectedIndex.value == index) BoxShadow(
                                                offset: const Offset(2, 2),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                color: AppColors.primaryColor.withValues(
                                                  alpha: 0.5,
                                                ),
                                              ) else const BoxShadow(color: Colors.transparent),
                                        ],
                                      ),

                                      child: Center(
                                        child: Text(
                                          country.flagEmoji ?? '',
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    );
                                  }),
                                  const SizedBox(width: 12),
                                  // Display the country's short name.
                                  Expanded(
                                    child: Text(
                                      '${country.isoShortName}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
