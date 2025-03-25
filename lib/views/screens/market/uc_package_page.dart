import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/views/screens/market/uc_payment_details.dart';

import '../../../utilities/app_images.dart';

class UCCard extends StatelessWidget {
  final String ucAmount;
  final String price;
  final VoidCallback onPressed;

  const UCCard({Key? key, required this.ucAmount, required this.price, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150, // Adjust width to fit the design
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(AppImages.ucImage), // Image of UC
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.ucCashImage, width: 30, height: 30),
                Text(
                  ucAmount,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '$price USD',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class UCPackageSelection extends StatelessWidget {
  const UCPackageSelection({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for UC packages
    final List<Map<String, String>> ucPackages = <Map<String, String>>[
      <String, String>{
        'ucAmount': '300 UC',
        'price': '5.6',
        'imageUrl': 'https://example.com/uc_image.png',
      },
      <String, String>{'ucAmount': '400 UC', 'price': '8'},
      <String, String>{'ucAmount': '500 UC', 'price': '5.6'},
      <String, String>{'ucAmount': '700 UC', 'price': '5.6'},
      <String, String>{'ucAmount': '1000 UC', 'price': '10'},
      <String, String>{'ucAmount': '1200 UC', 'price': '11'},
      <String, String>{'ucAmount': '1200 UC', 'price': '11'},
      <String, String>{'ucAmount': '1200 UC', 'price': '11'},
      <String, String>{'ucAmount': '1200 UC', 'price': '11'},
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 16.0, // Horizontal spacing between items
                  runSpacing: 16.0, // Vertical spacing between items
                  children:
                      ucPackages.map((Map<String, String> ucPackage) {
                        return UCCard(
                          ucAmount: ucPackage['ucAmount']!,
                          price: ucPackage['price']!,
                          onPressed: () {
                            debugPrint("Clikck hoy SHohan");
                            Get.to(UcPaymentDetails());
                          },
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
