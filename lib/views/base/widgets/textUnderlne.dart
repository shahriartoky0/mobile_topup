import 'package:flutter/material.dart';

import '../../../utilities/app_colors.dart';

class AppTextUnderline extends StatelessWidget {
  final double width;

  const AppTextUnderline({super.key, this.width = 56});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: const Divider(thickness: 8, color: AppColors.primaryColor, height: 12),
    );
  }
}
