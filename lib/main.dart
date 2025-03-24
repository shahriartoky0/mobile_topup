import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/screens/topup/topup_payment_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: OrderPage(),
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
