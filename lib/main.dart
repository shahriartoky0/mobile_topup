import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/screens/History/history_homePage.dart';
import 'package:untitled/views/screens/accounts/account_home.dart';
import 'package:untitled/views/screens/accounts/account_profile.dart';
import 'package:untitled/views/screens/auth/phone_number_sign_in.dart';
import 'package:untitled/views/screens/auth/sign_in_page.dart';
import 'package:untitled/views/screens/home/home_landing_page.dart';
import 'package:untitled/views/screens/home/home_onboarding_screen.dart';
import 'package:untitled/views/screens/home/home_topup.dart';
import 'package:untitled/views/screens/mainbottom_nav.dart';
import 'package:untitled/views/screens/market/gift_offer.dart';
import 'package:untitled/views/screens/market/gift_through_app.dart';
import 'package:untitled/views/screens/market/market_country.dart';
import 'package:untitled/views/screens/market/market_dashboard.dart';
import 'package:untitled/views/screens/market/uc_package_page.dart';
import 'package:untitled/views/screens/market/uc_payment_details.dart';
import 'package:untitled/views/screens/topup/topup_dashboard.dart';
import 'package:untitled/views/screens/topup/topup_landing.dart';
import 'package:untitled/views/screens/topup/topup_number.dart';
import 'package:untitled/views/screens/topup/topup_payment_details.dart';

import 'controller/top_up_country_search_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeOnBoardingPage(),
      theme: AppTheme.defaultThemeData,
      initialBinding: ControllerBinder(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(TopUpLandingController());
  }
}
