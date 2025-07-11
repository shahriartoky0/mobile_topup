import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/screens/auth/forgot_password_page.dart';
import 'package:untitled/views/screens/auth/sign_in_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SignInPage( ),
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
