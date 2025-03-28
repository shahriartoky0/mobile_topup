import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_strings.dart';

class PrivacyPage extends StatelessWidget {
  final String heading;

  const PrivacyPage({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
                  Text(heading),
                  const SizedBox(width: 30),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),

                child: Text(AppString.demoData, style: Theme.of(context).textTheme.displayMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
