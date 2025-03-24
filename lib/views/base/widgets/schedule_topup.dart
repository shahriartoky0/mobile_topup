import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';

class ScheduleTopUp extends StatelessWidget {
  const ScheduleTopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(AppString.scheduleTopUp.tr, style: textTheme.bodyMedium!.copyWith(fontSize: 16)),
        const SizedBox(height: 10),
        Text(AppString.packageAutoTopUpInfo.tr, style: textTheme.displayMedium),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TopUpOption(label: '7 Day', onPressed: () {}),
            TopUpOption(label: '14 Day', onPressed: () {}),
            TopUpOption(label: '30 Day', onPressed: () {}),
          ],
        ),
      ],
    );
  }
}

class TopUpOption extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const TopUpOption({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: [const BoxShadow(offset: Offset(0, 4), color: AppColors.green)],
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(label, style: textTheme.labelMedium),
      ),
    );
  }
}
