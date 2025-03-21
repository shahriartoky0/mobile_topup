import 'package:flutter/material.dart';
 import 'package:untitled/utilities/app_colors.dart';

class AppCustomContainerField extends StatelessWidget {
  const AppCustomContainerField({super.key, this.containerChild});

  final Widget? containerChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.textFieldShade,
        borderRadius: BorderRadius.circular(32 ),
        border: Border.all(color: AppColors.textFieldBorderColor, width: 0.1 ),
      ),
      child: containerChild,
    );
  }
}
