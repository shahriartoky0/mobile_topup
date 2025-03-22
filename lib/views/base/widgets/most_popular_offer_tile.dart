import 'package:flutter/material.dart';

import '../../../utilities/app_colors.dart';

class MostPopularOfferTile extends StatelessWidget {
  final List<Widget> children;
  final Widget trailing;
  final VoidCallback? onTap;
  final bool isSelected;

  MostPopularOfferTile({
    required this.children,
    required this.trailing,
    this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue, // Replace with AppColors.primaryColor
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          color:
              isSelected
                  ? AppColors.primaryColor.withValues(alpha: 0.1)
                  : Colors.transparent,
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),

              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: Colors.blue, // Replace with AppColors.primaryColor
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(children: children),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
