import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/base/widgets/custom_appbar.dart';
import '../../../controller/top_up_country_search_controller.dart';
import '../../../utilities/app_colors.dart';
import '../../base/components/custom_text_field.dart';

class TopUpLanding extends StatelessWidget {
  final bool showText;

  const TopUpLanding({super.key, this.showText = true});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller via Get.put()
    final TopUpLandingController controller = Get.put(TopUpLandingController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomAppbar(
                headingText: '',
                leadingWidget: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        onChanged: (value) {
                          // Update search results via the controller.
                          controller.updateSearch(value);
                        },
                      ),
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
                            (context, index) => Divider(
                              color: AppColors.primaryColor.withValues(alpha: 0.2),
                              thickness: 1,
                            ),
                        itemBuilder: (context, index) {
                          final country = controller.filteredCountries[index];
                          return InkWell(
                            onTap: () {
                              controller.selectCountry(index);
                              log(controller.selectedIndex.toString());
                              log(index.toString());
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              child: Row(
                                children: [
                                  Obx(() {
                                    return Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.white,
                                        border: Border.all(color: AppColors.primaryColor, width: 2),
                                        boxShadow: [
                                          controller.selectedIndex.value == index
                                              ? BoxShadow(
                                                offset: Offset(2, 2),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                color: AppColors.primaryColor.withValues(
                                                  alpha: 0.5,
                                                ),
                                              )
                                              : BoxShadow(color: Colors.transparent),
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
                                      country.isoShortName,
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
