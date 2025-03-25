import 'package:flutter/material.dart';
import 'package:untitled/utilities/app_theme.dart';
import '../../../utilities/app_colors.dart';

class OrderTotal extends StatelessWidget {
  final bool showButton;
  final String buttonText;
  final String endingLabel;
  final String endingValue;
  final VoidCallback onPressed;
  final List<OrderItem> orderItems; // List to hold dynamic text items

  const OrderTotal({
    super.key,
    required this.showButton,
    required this.buttonText,
    required this.onPressed,
    required this.orderItems,
    required this.endingLabel,
    required this.endingValue,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme appTextTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(color: AppColors.primaryColor.withValues(alpha:  0.2)),
        const SizedBox(height: 10),

        // Display dynamic order items (label + value)
        ...orderItems.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.label,
                  style:
                      item.labelStyle ?? textTheme(context).headlineMedium,
                ),
                Text(
                  item.value,
                  style:
                      item.valueStyle ?? textTheme(context).headlineMedium,
                ),
              ],
            ),
          );
        }).toList(),

        const SizedBox(height: 10),
        Divider(color: AppColors.primaryColor.withValues(alpha:  0.2)),
        const SizedBox(height: 10),

        // Display total amount
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(endingLabel, style: appTextTheme.headlineMedium),
            Text(endingValue, style: appTextTheme.headlineMedium),
          ],
        ),
        const SizedBox(height: 30),

        // Show the button if required
        if (showButton)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(buttonText, style: Theme.of(context).textTheme.labelMedium),
            ),
          ),
      ],
    );
  }
}

// A model class to represent each dynamic text row
class OrderItem {
  final String label;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  OrderItem({required this.label, required this.value, this.labelStyle, this.valueStyle});
}
