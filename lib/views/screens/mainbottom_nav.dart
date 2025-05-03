// import 'package:country/country.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:untitled/utilities/app_colors.dart';
// import 'package:untitled/utilities/app_icons.dart';
// import 'package:untitled/views/screens/History/history_homePage.dart';
// import 'package:untitled/views/screens/accounts/account_home.dart';
// import 'package:untitled/views/screens/topup/topup_landing.dart';
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import '../base/components/network_svg_image .dart';
// import 'home/home_landing_page.dart';
// import 'market/market_dashboard.dart';
//
// class MainBottomNavScreen extends StatefulWidget {
//   const MainBottomNavScreen({super.key});
//
//   @override
//   State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
// }
//
// class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
//   int _selectedIndex = 0;
//   final PageController _pageController = PageController();
//
//   final List<Widget> _screens = <Widget>[
//     const HomeLandingPage(),
//     HistoryHomePage(),
//     const MarketDashboard(),
//     const AccountHome(),
//   ];
//
//   final List<IconData> _icons = <IconData>[
//     Icons.import_contacts,
//     Icons.import_contacts,
//     Icons.import_contacts,
//     Icons.import_contacts,
//   ];
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       floatingActionButton: SizedBox(
//         height: 75,
//         width: 75,
//         child: FloatingActionButton(
//
//           onPressed: () {
//             Get.to(const TopUpLanding());
//           },
//           child: AssetSvgImage(assetName: AppIcons.appNetworkIcon, width: 25, height: 25),
//           elevation: 0,
//           backgroundColor: AppColors.primaryColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(50), // This makes the button fully circular
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       body: PageView.builder(
//         controller: _pageController,
//         onPageChanged: (int index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         itemCount: _screens.length,
//         itemBuilder: (BuildContext context, int index) {
//           return _screens[index];
//         },
//       ),
//       bottomNavigationBar: AnimatedBottomNavigationBar(
//         notchMargin: 15,
//         borderColor: AppColors.green,
//         icons: _icons,
//         activeIndex: _selectedIndex,
//         activeColor: AppColors.primaryColor,
//         // splashColor: AppColors.primaryColor,
//         gapLocation: GapLocation.center,
//         notchSmoothness: NotchSmoothness.smoothEdge,
//         backgroundColor: AppColors.appBarColor,
//         elevation: 10,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//             _pageController.jumpToPage(index);
//           });
//         },
//       ),
//     );
//   }
// }
/// ========================== Here specific images can not be used and no padding or margin ===================>

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
  final List<AssetSvgImage> _selectedIcons = <AssetSvgImage>[
    AssetSvgImage(assetName: AppIcons.selectedHome),
    AssetSvgImage(assetName: AppIcons.selectedHistory),
    AssetSvgImage(assetName: AppIcons.selectedMarket),
    AssetSvgImage(assetName: AppIcons.selectedProfile),
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
        child: SizedBox(
          height: 75,
          width: 75,
          child: FloatingActionButton(
            onPressed: () {
              Get.to(const TopUpLanding());
            },
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50), // This makes the button fully circular
            ),
            child: AssetSvgImage(assetName: AppIcons.appNetworkIcon, width: 25, height: 25),
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
        height: 80,
        margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),

            child: BottomAppBar(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
              notchMargin: 0,
              shape: const CircularNotchedRectangle(),
              color: AppColors.appBarColor,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          SizedBox(height: 16,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (index == 0) SizedBox(width: 8),
                              if (index == 1) SizedBox(width: 10),
                              if (index == 2) SizedBox(width: Get.size.width /4),

                              Container(
                                padding: const EdgeInsets.all(2),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  boxShadow:
                                      _selectedIndex == index
                                          ? <BoxShadow>[
                                            BoxShadow(
                                              color: AppColors.primaryColor.withValues(alpha: 0.15),
                                              // Shadow color
                                              offset: const Offset(0, 4),
                                              // Shadow position
                                              blurRadius: 5, // Blur radius
                                            ),
                                          ]
                                          : <BoxShadow>[],
                                  shape: BoxShape.circle,

                                  // To keep the shape circular (if you want)
                                ),
                                child: _selectedIndex == index ? _selectedIcons[index] : _icons[index],
                              ),
                            ],
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
    );
  }
}
