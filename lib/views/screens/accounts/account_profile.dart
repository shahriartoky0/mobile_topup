import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_theme.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../base/components/cached_image.dart';
import '../../base/components/custom_text_field.dart';
import '../../base/widgets/container_text_field.dart';
import '../../base/widgets/show_upload_dialog.dart';

class AccountProfile extends StatelessWidget {
  const AccountProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameTEController = TextEditingController();
    final TextEditingController numberTEController = TextEditingController();
    nameTEController.text = "Abdul Karim";
    numberTEController.text = "+889569842236";
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: InkWell(
                  onTap: () {
                    showUploadPhotoDialog(context);
                  },
                  child: SizedBox(
                    height: 160,
                    child: Stack(
                      // alignment: Alignment.topRight,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 150,
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
                              imageUrl:
                                  "https://s3-alpha-sig.figma.com/img/2ef2/f860/e62ddbe0b472613ba7ac12672408ae2f?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=N0x2WoTJ9btHaJ40oGCmRNk7P4VxValuOXJkBkPU4qwwJqW-lP4yaR~yYs6Pn2lHs20voEM8~98vKq1puyT7JXrWMsmf3hYNwoWVcoEQtU-vj9u3Sd8t5tGWeLHzwA7pgwrJscmaXpdbono2rwdVtZvq0NJvU7LoGgyW~vtJj2EbiAPmKMpmjHvhd2hJu9pZTZueWuTLx69yg2MIIk15VGrS5lp6HZFN94RHSp19mu0X9HAC~KO5V9XNyX60KqmhIQd4aoUp7JhZZZiCPc~c6HIhPrB1tchPEpZ7-n8OnpWJ-n982FObrsmXD2Mdv941RL9-HCT-FvwcGoHyinZl7g__",
                            ),
                          ),
                        ),
                        // Edit icon inside a box, positioned at the bottom-right
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              /// show the dialog
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.edit, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Center(child: Text("Abdul Karim")),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppString.name.tr, style: textTheme(context).headlineMedium),
                    const SizedBox(height: 14),
                    AppCustomContainerField(
                      containerChild: MyTextFormFieldWithIcon(
                        formHintText: '',
                        keyBoardType: TextInputType.phone,

                        prefixIcon: const Icon(CupertinoIcons.person),
                        controller: nameTEController,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return '${AppString.pleaseEnterYour} ${AppString.email}!!';
                          }
                          return null;
                        },
                        onChanged: (String value) {
                         },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(AppString.yourNumber.tr, style: textTheme(context).headlineMedium),
                    const SizedBox(height: 14),
                    AppCustomContainerField(
                      containerChild: MyTextFormFieldWithIcon(
                        formHintText: AppString.phoneNumberHintText.tr,
                        keyBoardType: TextInputType.phone,

                        prefixIcon: const Icon(CupertinoIcons.phone),
                        controller: numberTEController,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return '${AppString.pleaseEnterYour} ${AppString.email}!!';
                          }
                          return null;
                        },
                        onChanged: (String value) {
                         },
                      ),
                    ),
                    const SizedBox(height: 36),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                        onPressed: () {},
                        child: Text(
                          AppString.save.tr,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
