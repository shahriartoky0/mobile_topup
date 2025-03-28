import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/base/components/cached_image.dart';
import 'package:untitled/views/base/widgets/order_card.dart';
import 'package:untitled/views/screens/accounts/account_home.dart';

import '../../../utilities/app_colors.dart';
import '../../base/widgets/home_order_card.dart';
import 'home_topup.dart';

class HomeLandingPage extends StatelessWidget {
  const HomeLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.put(HomePageController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const InAppbar(),
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            child: const CachedImage(
                              imageUrl:
                                  "https://imgs.search.brave.com/gqC0TFGd8Ea56ikbuQFo4DrptdJwsp33BOHENy1wtFM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/d29ybGRwcmVzc3Bo/b3RvLm9yZy9nZXRt/ZWRpYS81NGZhZDZi/OC05ODQ3LTQ1MzYt/OGMyOS04NTViODM5/YmU2ZDUvRXhoaWJp/dGlvbjIwMjRfQW1z/dGVyZGFtX0ROS19j/LU5hdGhhbGllLUhh/Z2Vuc3RlaW4uanBn/P21heHNpZGVzaXpl/PTkwMCZyZXNpemVt/b2RlPWZvcmNl",
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 50,
                          right: 50,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Top Up your frien Any time from any where",
                                style: textTheme(
                                  context,
                                ).headlineMedium!.copyWith(color: AppColors.white),
                              ),
                              Text(
                                "Top Up your frien Any time from any where",
                                style: textTheme(
                                  context,
                                ).headlineMedium!.copyWith(color: AppColors.white),
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                                ),
                                onPressed: () {
                                  // if (_formKey.currentState!.validate()) {}
                                },

                                child: Text(
                                  AppString.topUp.tr,
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              /// ========================== the top Up starts here =================== >
              const SizedBox(height: 12),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        homePageController.updateIndex(0);
                      },
                      // Default button text is 'Confirm'
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: AppColors.primaryColor),
                        ),
                        backgroundColor:
                            homePageController.selectedIndex.value == 0
                                ? AppColors.primaryColor
                                : AppColors.white,
                      ),
                      child: Text(
                        AppString.recentTopUp,
                        style: textTheme(context).labelMedium!.copyWith(
                          fontSize: 14,
                          color:
                              homePageController.selectedIndex.value == 0
                                  ? AppColors.green
                                  : AppColors.primaryColor,
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        homePageController.updateIndex(1);
                      },
                      // Default button text is 'Confirm'
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: AppColors.primaryColor),
                        ),
                        backgroundColor:
                            homePageController.selectedIndex.value == 1
                                ? AppColors.primaryColor
                                : AppColors.white,
                      ),
                      child: Text(
                        AppString.scheduleTopUp,
                        style: textTheme(context).labelMedium!.copyWith(
                          fontSize: 14,
                          color:
                              homePageController.selectedIndex.value == 1
                                  ? AppColors.green
                                  : AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              /// ===========================================>  Body ========================================>
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                child: Obx(
                  () =>
                      homePageController.selectedIndex.value == 0
                          ?
                          //     /// If there is no history ( The list is empty ) =================>
                          //     Column(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       children: [
                          //         SizedBox(height: 24),
                          //         Text(AppString.youHaveNoTopUpHistory.tr),
                          //         SizedBox(height: 12),
                          //         Text(AppString.saveTimeAndMoney.tr,style: textTheme(context).displayMedium!.copyWith(fontSize: 16),textAlign: TextAlign.center,),
                          //         SizedBox(height: 12),
                          //         ElevatedButton(
                          //           style: ElevatedButton.styleFrom(
                          //             backgroundColor: AppColors.primaryColor,
                          //             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                          //           ),
                          //           onPressed: () {
                          //             // if (_formKey.currentState!.validate()) {}
                          //           },
                          //
                          //           child: Text(
                          //             AppString.topUp.tr,
                          //             style: Theme.of(context).textTheme.labelMedium,
                          //           ),
                          //         ),
                          //       ],
                          //     )
                          // ////============================== <==
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return HomeOrderCard(
                                onTapCard: () {
                                  Get.to(const HomeTopUp());
                                },
                                imageUrl:
                                    "https://imgs.search.brave.com/zsMQceD5H5ajD95FdwVitlycR9K7rBjaxiMCS-EBA1A/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/bG9nby53aW5lL2Ev/bG9nby9BaXJ0ZWxf/VWdhbmRhL0FpcnRl/bF9VZ2FuZGEtTG9n/by53aW5lLnN2Zw",
                                serviceName: 'Airtel',
                                userName: 'Motin Mia',
                                plan: '50GB+600Mins',
                                phoneNumber: '+8801600000000',
                                price: '200',
                                duration: '20 Days',
                                showButton: true,
                                buttonPressed: () {},
                                buttonText: AppString.sendAgain.tr,
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 12);
                            },
                          )
                          : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return OrderCard(
                                onTapCard: () {
                                  Get.to(const HomeTopUp());
                                },
                                imageUrl:
                                    "https://imgs.search.brave.com/zsMQceD5H5ajD95FdwVitlycR9K7rBjaxiMCS-EBA1A/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/bG9nby53aW5lL2Ev/bG9nby9BaXJ0ZWxf/VWdhbmRhL0FpcnRl/bF9VZ2FuZGEtTG9n/by53aW5lLnN2Zw",
                                serviceName: 'Airtel',
                                userName: 'Motin Mia',
                                plan: '50GB+600Mins',
                                phoneNumber: '+8801600000000',
                                price: '200',
                                duration: '20 Days',
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 16);
                            },
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}


