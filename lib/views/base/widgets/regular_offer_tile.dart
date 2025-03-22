import 'package:flutter/material.dart';
import 'package:untitled/utilities/app_colors.dart';

class RegularOfferTile extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final VoidCallback? onTap;
  final bool isSelected;

  const RegularOfferTile({
    super.key,
    required this.leading,
    required this.trailing,
    this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [leading, trailing],
        ),
      ),
    );
  }
}
