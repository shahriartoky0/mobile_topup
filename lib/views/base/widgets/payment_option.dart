import 'package:flutter/material.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_images.dart';

class PaymentOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  final bool isApplePay;

  const PaymentOption({
    Key? key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
    this.isApplePay = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? AppColors.primaryColor : AppColors.grey.withValues(alpha: 0.5),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Checkbox(
                  value: selected,
                  onChanged: (bool? value) {},
                  activeColor: AppColors.primaryColor,
                ),
                Icon(icon, color: AppColors.primaryColor),
                const SizedBox(width: 10),
                Text(label, style: TextStyle(color: AppColors.grey.withValues(alpha: 0.8))),
              ],
            ),
            Row(
              children: <Widget>[
                if (isApplePay) Image.asset(AppImages.applePayLogoImage),
                if (!isApplePay) Image.asset(AppImages.masterCardLogoImage),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
