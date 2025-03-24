import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/screens/market/market_country.dart';
import 'package:untitled/views/screens/market/market_dashboard.dart';
import 'package:untitled/views/screens/market/uc_package_page.dart';
import 'package:untitled/views/screens/market/uc_payment_details.dart';
import 'package:untitled/views/screens/topup/topup_payment_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MarketCountry(),
      theme: AppTheme.defaultThemeData,
      initialBinding: ControllerBinder(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ControllerBinder extends Bindings {
  @override
  void dependencies() {}
}
