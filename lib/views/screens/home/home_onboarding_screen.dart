import 'package:country/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_images.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/screens/mainbottom_nav.dart';
import 'package:untitled/views/screens/topup/topup_landing.dart';

import '../../../controller/top_up_country_search_controller.dart';

class HomeOnBoardingPage extends StatelessWidget {
  const HomeOnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TopUpLandingController controller = Get.find<TopUpLandingController>();
    final Country country = controller.filteredCountries[2];
    final TextTheme appTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppString.handcraftedInAfghanistan,
              style: appTextTheme.headlineMedium!.copyWith(color: AppColors.white),
            ),
            const SizedBox(width: 8),
            Text(country.flagEmoji),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Esra Logo (Green text)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Get.offAll(const MainBottomNavScreen());
                  },
                  icon: Text(
                    AppString.skip.tr,
                    style: appTextTheme.headlineMedium!.copyWith(color: AppColors.green),
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.onboardingImage),
                      const SizedBox(height: 16),
                      Text(
                        AppString.welcomeToEsra.tr,
                        style: appTextTheme.headlineMedium!.copyWith(color: AppColors.green),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppString.oneStopSolution.tr,
                        style: appTextTheme.headlineMedium!.copyWith(color: AppColors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 36),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.green),
                          onPressed: () {
                            Get.offAll(const TopUpLanding(fromOnBoarding: true));
                          },

                          child: Text(
                            AppString.next.tr,
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium!.copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
