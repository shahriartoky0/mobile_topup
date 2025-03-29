import 'package:country/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_icons.dart';
import 'package:untitled/views/base/components/network_svg_image%20.dart';
import 'package:untitled/views/screens/History/history_homePage.dart';
import 'package:untitled/views/screens/accounts/account_home.dart';
import 'package:untitled/views/screens/topup/topup_landing.dart';

import 'home/home_landing_page.dart';
import 'market/market_dashboard.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = <Widget>[
    const HomeLandingPage(),
    HistoryHomePage(),
    const MarketDashboard(),
    const AccountHome(),
  ];

  final List<AssetSvgImage> _icons = <AssetSvgImage>[
    AssetSvgImage(assetName: AppIcons.appNavHome),
    AssetSvgImage(assetName: AppIcons.appNavHistory),
    AssetSvgImage(assetName: AppIcons.appNavMarket),
    AssetSvgImage(assetName: AppIcons.appNavProfile),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25, bottom: 0),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(const TopUpLanding());
          },
          child: AssetSvgImage(assetName: AppIcons.appNetworkIcon, width: 20,height: 20,),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), // This makes the button fully circular
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemCount: _screens.length,
        itemBuilder: (BuildContext context, int index) {
          return _screens[index];
        },
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BottomAppBar(
            padding: const EdgeInsets.only(top: 1),
            notchMargin: -.5,
            shape: const CircularNotchedRectangle(),
            // This creates the notch for the FAB
            color: AppColors.green,
            elevation: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),

              child: BottomAppBar(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                notchMargin: 0,
                shape: const CircularNotchedRectangle(),
                color: AppColors.appBarColor,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List<GestureDetector>.generate(_icons.length, (int index) {
                      return GestureDetector(
                        onTap: () {
                          _pageController.jumpToPage(index);
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Row(
                          children: [
                            if (index == 2) SizedBox(width: 76),

                            Container(
                              padding: const EdgeInsets.all(10),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                boxShadow:
                                    _selectedIndex == index
                                        ? <BoxShadow>[
                                          BoxShadow(
                                            color: AppColors.primaryColor.withValues(alpha: 0.2),
                                            // Shadow color
                                            offset: const Offset(0, 4),
                                            // Shadow position
                                            blurRadius: 8, // Blur radius
                                          ),
                                        ]
                                        : <BoxShadow>[],
                                shape: BoxShape.circle,

                                // To keep the shape circular (if you want)
                              ),
                              child: _icons[index],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
