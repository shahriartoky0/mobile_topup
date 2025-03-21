import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilities/app_colors.dart';

class AppTextUnderline extends StatelessWidget {
  const AppTextUnderline({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.w,
      child: Divider(
        thickness: 8.r,
        color: AppColors.primaryColor,
        height: 12.h,
      ),
    );
  }
}
