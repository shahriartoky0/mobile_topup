import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_colors.dart';

class CustomAppbar extends StatelessWidget {
  final String headingText;
  final Widget? leadingWidget;

  const CustomAppbar({Key? key, required this.headingText, this.leadingWidget})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a default back button.
    final Widget defaultLeading = IconButton(
      icon: const Icon(Icons.arrow_back_outlined),
      onPressed: () => Get.back(),
    );

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // decoration: BoxDecoration(color: AppColors.tra),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Use the provided leading widget, or fallback to default.
          leadingWidget ?? defaultLeading,
          const SizedBox(width: 16),
          // Centered heading text.
          Expanded(
            child: Text(
              headingText,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          // Optional placeholder to balance the layout.
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
