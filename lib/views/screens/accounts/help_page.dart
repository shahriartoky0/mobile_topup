import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_images.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/base/widgets/textUnderlne.dart';

import '../../base/components/custom_text_field.dart';
import '../../base/widgets/container_text_field.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final PageController _pageController = PageController();
  RxInt numberOp = 0.obs;

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameTEController = TextEditingController();

    return Scaffold(
      floatingActionButton: Container(
        width: double.infinity,
        height: 80,
        decoration: const BoxDecoration(color: AppColors.cyan),
        child: Column(
          children: <Widget>[
            const Spacer(),
            Text(AppString.ifYouHaveAnyQuestion.tr, style: textTheme(context).displayMedium),
            Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(AppImages.whatsappGif, scale: 2),
                Text(AppString.customerService.tr),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 10),
                IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _pageController.jumpToPage(0); // Switch to FAQ page
                      },
                      child: Text(AppString.faq.tr, style: textTheme(context).headlineMedium),
                    ),

                    Obx(
                      () =>
                          numberOp.value == 0
                              ? const AppTextUnderline(width: 30)
                              : const SizedBox.shrink(),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                // Adds space between FAQ and Contact Us
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _pageController.jumpToPage(1);
                      },
                      child: Text(AppString.contactUs.tr, style: textTheme(context).headlineMedium),
                    ),

                    Obx(
                      () =>
                          numberOp.value == 1
                              ? const AppTextUnderline(width: 75)
                              : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 2, // Number of pages you want to show
                onPageChanged: (int index) {
                  numberOp.value = index; // Update the underline state when the page changes
                },
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? const FAQPage() // Replace with your actual FAQ page widget
                      : ListView(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                        physics: const ClampingScrollPhysics(),
                        children: <Widget>[
                          const SizedBox(height: 14),
                          AppCustomContainerField(
                            containerChild: MyTextFormFieldWithIcon(
                              formHintText: AppString.firstName,
                              keyBoardType: TextInputType.phone,
                              controller: nameTEController,
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return '${AppString.pleaseEnterYour.tr} ${AppString.email}!!';
                                }
                                return null;
                              },
                              onChanged: (String value) {
                                print("Name Input: $value");
                              },
                            ),
                          ),
                          const SizedBox(height: 14),
                          AppCustomContainerField(
                            containerChild: MyTextFormFieldWithIcon(
                              formHintText: AppString.lastName,
                              keyBoardType: TextInputType.phone,
                              controller: nameTEController,
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return '${AppString.pleaseEnterYour} ${AppString.email}!!';
                                }
                                return null;
                              },
                              onChanged: (String value) {
                                print("Name Input: $value");
                              },
                            ),
                          ),
                          const SizedBox(height: 14),
                          AppCustomContainerField(
                            containerChild: MyTextFormFieldWithIcon(
                              formHintText: AppString.email,
                              keyBoardType: TextInputType.phone,
                              controller: nameTEController,
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return '${AppString.pleaseEnterYour} ${AppString.email}!!';
                                }
                                return null;
                              },
                              onChanged: (String value) {
                                print("Name Input: $value");
                              },
                            ),
                          ),
                          const SizedBox(height: 14),
                          AppCustomContainerField(
                            containerChild: MyTextFormFieldWithIcon(
                              formHintText: AppString.subject,
                              keyBoardType: TextInputType.phone,
                              controller: nameTEController,
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return '${AppString.pleaseEnterYour} ${AppString.email}!!';
                                }
                                return null;
                              },
                              onChanged: (String value) {
                                print("Name Input: $value");
                              },
                            ),
                          ),
                          const SizedBox(height: 14),
                          Container(
                            child: TextFormField(
                              controller: nameTEController,
                              maxLines: 5,
                              decoration: const InputDecoration(hintText: AppString.message),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: AppColors.primaryColor),
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                /// TODO: OTP logic
                              },
                              child: Text(
                                AppString.send.tr,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ),
                        ],
                      );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of questions and answers (this will be fetched from the API)
    final List<Map<String, String>> faqList = <Map<String, String>>[
      <String, String>{
        "question": "01. Search For Answers",
        "answer":
            "Lorem Ipsum Is Not Simply Random Text. It Has Roots In A Piece Of Classical Latin Literature From 45 BC. Making It Over 2000 Years Old. Richard McClintock, Contrary To Popular Belief, Lorem Ipsum Is Not Simply Random Text. It Has Roots In A Piece Of Classical Latin Literature From 45 BC. Making It Over 2000 Years Old. Richard McClintock.",
      },
      <String, String>{
        "question": "02. Lorem Ipsum Is Not Simply Random Text.",
        "answer":
            "Lorem Ipsum Is Not Simply Random Text. It Has Roots In A Piece Of Classical Latin Literature From 45 BC. Making It Over 2000 Years Old. Richard McClintock.",
      },
      <String, String>{
        "question": "03. Lorem Ipsum Is Not Simply Random Text.",
        "answer":
            "Lorem Ipsum Is Not Simply Random Text. It Has Roots In A Piece Of Classical Latin Literature From 45 BC. Making It Over 2000 Years Old. Richard McClintock.",
      },
      <String, String>{
        "question": "03. Lorem Ipsum Is Not Simply Random Text.",
        "answer":
            "Lorem Ipsum Is Not Simply Random Text. It Has Roots In A Piece Of Classical Latin Literature From 45 BC. Making It Over 2000 Years Old. Richard McClintock.",
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: faqList.length,
                itemBuilder: (BuildContext context, int index) {
                  return FAQItem(
                    question: faqList[index]["question"]!,
                    answer: faqList[index]["answer"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 4, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      widget.question,
                      style: Theme.of(
                        context,
                      ).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.keyboard_double_arrow_up : Icons.keyboard_double_arrow_down,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Text(widget.answer, style: Theme.of(context).textTheme.displayMedium),
            ),
        ],
      ),
    );
  }
}
