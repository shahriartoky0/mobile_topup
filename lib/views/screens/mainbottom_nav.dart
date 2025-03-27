import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_colors.dart';
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

  List<Widget> _screens = [HomeLandingPage(), HistoryHomePage(), MarketDashboard(), AccountHome()];

  List<IconData> _icons = [
    Icons.home_outlined,
    Icons.history,
    Icons.store_outlined,
    Icons.person_outline_outlined,
  ];

  List<IconData> _filledIcons = [Icons.home, Icons.history_outlined, Icons.store, Icons.person];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(TopUpLanding());
        },

        child: Icon(Icons.cell_tower_sharp, color: AppColors.green),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // This makes the button fully circular
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemCount: _screens.length,
        itemBuilder: (context, index) {
          return _screens[index];
        },
      ),
      bottomNavigationBar: Container(
        // margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          // border: Border(top: BorderSide(color: AppColors.green, width: 2)),
        ),
        child: BottomAppBar(
          padding: EdgeInsets.symmetric(horizontal: 2),
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          // This creates the notch for the FAB
          color: Colors.grey.withValues(alpha: 0.1),
          elevation: 10,
          child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_icons.length, (index) {
              return GestureDetector(
                onTap: () {
                  _pageController.jumpToPage(index);
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    _selectedIndex == index ? _filledIcons[index] : _icons[index],
                    color: AppColors.black,
                    size: 28,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
