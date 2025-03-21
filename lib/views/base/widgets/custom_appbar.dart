import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_colors.dart';

class CustomAppbar extends StatelessWidget {
  final String headingText;

  const CustomAppbar({super.key, required this.headingText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60 ,
      decoration: BoxDecoration(color: AppColors.appBarColor),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_outlined),
          ),
          Text(headingText, style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }
}
