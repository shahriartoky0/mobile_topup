import 'package:flutter/material.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/views/base/components/cached_image.dart';

import '../../../utilities/app_images.dart';
import '../../../utilities/app_theme.dart';

class OrderCard extends StatelessWidget {
  final String serviceName;
  final String userName;
  final String plan;
  final String phoneNumber;
  final String price;
  final String duration;
  final String? buttonText;
  final VoidCallback? buttonPressed;
  final bool showButton;
  final bool blueColor;
  final bool showMenuIcon;
  final String imageUrl;
  final VoidCallback? onTapCard;

  const OrderCard({
    Key? key,
    required this.serviceName,
    required this.userName,
    required this.plan,
    required this.phoneNumber,
    required this.price,
    required this.duration,
    this.buttonText,
    this.buttonPressed,
    this.showButton = false,
    required this.imageUrl,
    this.showMenuIcon = false,
    this.blueColor = false,
    this.onTapCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme appTextTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTapCard,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal:  16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent, width: 1),
          borderRadius: BorderRadius.circular(12),
          color: blueColor ? AppColors.primaryColor.withValues(alpha: 0.2) : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedImage(fit: BoxFit.contain, imageUrl: imageUrl, width: 70),
                if (showMenuIcon)
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu, color: Colors.grey.shade600))
                else
                  SizedBox.shrink(),
              ],
            ),
            // Replace with actual logo path
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text(userName), Text(plan, style: appTextTheme.displayMedium)],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(phoneNumber, style: appTextTheme.displayMedium),
                Row(
                  children: <Widget>[
                    Text('\$ $price', style: appTextTheme.displayMedium),
                    const SizedBox(width: 8),
                    Icon(Icons.access_time_outlined, color: Colors.black.withValues(alpha: 0.5)),
                    const SizedBox(width: 2),
                    Text(duration, style: appTextTheme.displayMedium),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 8),
            if (showButton) // Conditionally show the button based on the showButton variable
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: buttonPressed,
                    // Default button text is 'Confirm'
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      buttonText ?? 'done',
                      style: textTheme(context).labelMedium!.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
