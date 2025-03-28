import 'package:flutter/material.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_theme.dart';
import '../components/cached_image.dart';

class HomeOrderCard extends StatelessWidget {
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

  const HomeOrderCard({
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
        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 16.0),
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
              children: <Widget>[
                CachedImage(fit: BoxFit.contain, imageUrl: imageUrl, width: 70),
                Text(plan, style: appTextTheme.displayMedium),
              ],
            ),
            // Replace with actual logo path

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(userName),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(phoneNumber, style: appTextTheme.displayMedium),
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
          ],
        ),
      ),
    );
  }
}