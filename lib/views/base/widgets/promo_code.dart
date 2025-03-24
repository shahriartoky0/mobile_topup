import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../utilities/app_theme.dart';

class PromoCode extends StatelessWidget {
  const PromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primaryColor.withValues(alpha: 0.1),
          ),
          child: TextFormField(
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return '${AppString.pleaseEnterYour.tr} Password !!';
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              hintText: AppString.enterPromoCode.tr,
              hintStyle: textTheme(context).displayMedium,
              border: const OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(AppString.apply.tr, style: textTheme(context).labelMedium),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}