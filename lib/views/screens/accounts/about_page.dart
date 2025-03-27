import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_theme.dart';

import '../../../utilities/app_colors.dart';
import '../../base/components/cached_image.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
                ],
              ),
              SizedBox(height: 24),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: AppColors.primaryColor, // Border color
                        width: 2, // Border width
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: const CachedImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://s3-alpha-sig.figma.com/img/2ef2/f860/e62ddbe0b472613ba7ac12672408ae2f?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=N0x2WoTJ9btHaJ40oGCmRNk7P4VxValuOXJkBkPU4qwwJqW-lP4yaR~yYs6Pn2lHs20voEM8~98vKq1puyT7JXrWMsmf3hYNwoWVcoEQtU-vj9u3Sd8t5tGWeLHzwA7pgwrJscmaXpdbono2rwdVtZvq0NJvU7LoGgyW~vtJj2EbiAPmKMpmjHvhd2hJu9pZTZueWuTLx69yg2MIIk15VGrS5lp6HZFN94RHSp19mu0X9HAC~KO5V9XNyX60KqmhIQd4aoUp7JhZZZiCPc~c6HIhPrB1tchPEpZ7-n8OnpWJ-n982FObrsmXD2Mdv941RL9-HCT-FvwcGoHyinZl7g__",
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(AppString.about.tr),
                  SizedBox(height: 12),
                  Text(AppString.demoData, style: textTheme(context).displayMedium),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
