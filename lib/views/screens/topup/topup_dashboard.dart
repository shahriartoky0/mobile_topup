import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_images.dart';
import 'package:untitled/views/screens/auth/phone_number_sign_in.dart';
import 'package:untitled/views/screens/auth/sign_in_page.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../controller/subscription_tab_controller.dart';
import '../../base/widgets/most_popular_offer_tile.dart';
import '../../base/widgets/regular_offer_tile.dart';
import '../../base/widgets/subscription_toggle.dart';

class TopUpDashboard extends StatelessWidget {
  const TopUpDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textThemeApp = Theme.of(context).textTheme;
    final SubscriptionTabController controller = Get.put(SubscriptionTabController());

    // Demo JSON Data for Offers
    final List<Map<String, dynamic>> offers = [
      {"type": "most_popular", "info": "4.5 USD", "price": "400 BDT", "isSelected": false},
      {"type": "regular_offer", "info": "1000 BDT", "price": "860 USD", "isSelected": false},
      {"type": "regular_offer", "info": "2000 BDT", "price": "120 USD", "isSelected": false},
      // Add more regular offers as needed
    ];
    final List<Map<String, dynamic>> plans = [
      {
        "type": "most_popular",
        "info": "50GB+600Mins",
        "price": "4.5 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      {
        "type": "regular_offer",
        "info": "40GB+500Mins",
        "price": "11.49 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      {
        "type": "regular_offer",
        "info": "30GB+400Mins",
        "price": "5.99 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      {
        "type": "regular_offer",
        "info": "20GB+300Mins",
        "price": "3.99 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      {
        "type": "regular_offer",
        "info": "10GB+200Mins",
        "price": "2.99 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      {
        "type": "regular_offer",
        "info": "50GB+100Mins",
        "price": "2.00 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      {
        "type": "regular_offer",
        "info": "50GB+100Mins",
        "price": "2.00 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      {
        "type": "regular_offer",
        "info": "50GB+100Mins",
        "price": "2.00 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
                ],
              ),
              SizedBox(height: 16),

              /// ==================================== Before toggle button ================================
              Image.asset(AppImages.airtelLogo),
              Text(AppString.howMuchDoYouWantToTopUp.tr),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.flagDemo),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(AppString.phoneNumberHintText),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              SizedBox(height: 8),

              //// ============================= Button ===================>
              PlanningToggle(),
              GetX<SubscriptionTabController>(
                builder: (controller) {
                  if (controller.isSelected.value) {
                    /// Top Up packages ==========================>
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: offers.length,
                        itemBuilder: (context, index) {
                          final offer = offers[index];
                          return Obx(() {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child:
                                  offer['type'] == 'most_popular'
                                      ? MostPopularOfferTile(
                                        onTap: () {
                                          controller.updateSelectedTopUpTile(index);
                                          Get.to(PhoneNumberSignIn());
                                        },
                                        isSelected: controller.selectedTopUpIndex.value == index,
                                        trailing: Text(offer['price'] ?? ""),
                                        children: [
                                          Text(offer['info']),
                                          SizedBox(height: 3),
                                          Text(
                                            AppString.mostPopular.tr,
                                            style: Theme.of(context).textTheme.displayMedium!
                                                .copyWith(color: AppColors.primaryColor),
                                          ),
                                        ],
                                      )
                                      : RegularOfferTile(
                                        onTap: () {
                                          controller.updateSelectedTopUpTile(index);
                                          Get.to(PhoneNumberSignIn());
                                        },
                                        isSelected: controller.selectedTopUpIndex.value == index,
                                        leading: Text(offer['info'] ?? ""),
                                        trailing: Text(offer['price']),
                                      ),
                            );
                          });
                        },
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: plans.length,
                        itemBuilder: (context, index) {
                          final plan = plans[index];
                          return Obx(() {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child:
                                  plan['type'] == 'most_popular'
                                      ? MostPopularOfferTile(
                                        onTap: () {
                                          controller.updateSelectedPlanTile(index);
                                          log(controller.selectedTopUpIndex.toString());
                                          Get.to(SignInPage());
                                        },
                                        isSelected: controller.selectedPlansIndex.value == index,
                                        trailing: Text(plan['price'] ?? ""),
                                        children: [
                                          Text(plan['info'], style: textThemeApp.displayMedium),
                                          SizedBox(height: 3),
                                          Text(
                                            "Valid for ${plan['valid_for']}",
                                            style: textThemeApp.displayMedium,
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            AppString.mostPopular.tr,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.displayMedium!.copyWith(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      )
                                      : RegularOfferTile(
                                        onTap: () {
                                          controller.updateSelectedPlanTile(index);
                                          Get.to(SignInPage());
                                        },
                                        isSelected: controller.selectedPlansIndex.value == index,
                                        leading: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              plan['info'] ?? "",
                                              style: textThemeApp.displayMedium!.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "Valid for ${plan['valid_for']}",
                                              style: textThemeApp.displayMedium,
                                            ),
                                          ],
                                        ),
                                        trailing: Text(plan['price']),
                                      ),
                            );
                          });
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
