import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/base/components/cached_image.dart';
import 'package:untitled/views/screens/topup/payment_details.dart';

import '../../../controller/subscription_tab_controller.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../base/widgets/most_popular_offer_tile.dart';
import '../../base/widgets/regular_offer_tile.dart';

class GiftOffer extends StatelessWidget {
  const GiftOffer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> offers = <Map<String, dynamic>>[
      <String, dynamic>{
        "type": "most_popular",
        "info": "4.5 USD",
        "price": "400 BDT",
        "isSelected": false,
      },
      <String, dynamic>{
        "type": "regular_offer",
        "info": "1000 BDT",
        "price": "860 USD",
        "isSelected": false,
      },
      <String, dynamic>{
        "type": "regular_offer",
        "info": "2000 BDT",
        "price": "120 USD",
        "isSelected": false,
      },
      // Add more regular offers as needed
    ];
    final List<Map<String, dynamic>> plans = <Map<String, dynamic>>[
      <String, dynamic>{
        "type": "most_popular",
        "info": "50GB+600Mins",
        "price": "4.5 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      <String, dynamic>{
        "type": "regular_offer",
        "info": "40GB+500Mins",
        "price": "11.49 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      <String, dynamic>{
        "type": "regular_offer",
        "info": "30GB+400Mins",
        "price": "5.99 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      <String, dynamic>{
        "type": "regular_offer",
        "info": "20GB+300Mins",
        "price": "3.99 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      <String, dynamic>{
        "type": "regular_offer",
        "info": "10GB+200Mins",
        "price": "2.99 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      <String, dynamic>{
        "type": "regular_offer",
        "info": "50GB+100Mins",
        "price": "2.00 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      <String, dynamic>{
        "type": "regular_offer",
        "info": "50GB+100Mins",
        "price": "2.00 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
      <String, dynamic>{
        "type": "regular_offer",
        "info": "50GB+100Mins",
        "price": "2.00 USD",
        "valid_for": "30 days",
        "isSelected": false,
      },
    ];
    final SubscriptionTabController controller = Get.put(SubscriptionTabController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),

          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: const CachedImage(
                    imageUrl:
                        "https://imgs.search.brave.com/JwpIa28H4JmOm3p7RqVhLrmJenKy96tfI4mHrkS8ybU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y25ldC5jb20vYS9p/bWcvcmVzaXplLzFh/MmFlZmQ0NWYzYzA2/YTdmN2FmNWUxOWVi/ZDAyNDEyYzdiZGVl/ODcvaHViLzIwMTYv/MDYvMjEvNjBmYmEz/NTktZTVlMy00NTlk/LWJlMjEtZjdmZDU0/NDI4NTFlL3ZpYmVy/LWlvcy5wbmc_YXV0/bz13ZWJwJndpZHRo/PTc2OA",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text("Viber"),
              Text(
                "Weather it’s for a celebration, milestone or just as a small thanks, send a digital gift card with esra and let them chose",
                style: textTheme(context).displayMedium,
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: plans.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> offer = plans[index];
                  return Obx(() {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child:
                          offer['type'] == 'most_popular'
                              ? MostPopularOfferTile(
                                onTap: () {
                                  controller.updateSelectedTopUpTile(index);
                                  Get.to(const PaymentDetailsPage());
                                },
                                isSelected: controller.selectedTopUpIndex.value == index,
                                trailing: Text(offer['price'] ?? ""),
                                children: <Widget>[
                                  Text(offer['info']),
                                  const SizedBox(height: 3),
                                  Text(
                                    AppString.mostPopular.tr,
                                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              )
                              : RegularOfferTile(
                                onTap: () {
                                  controller.updateSelectedTopUpTile(index);
                                  Get.to(const PaymentDetailsPage());
                                },
                                isSelected: controller.selectedTopUpIndex.value == index,
                                leading: Text(offer['info'] ?? ""),
                                trailing: Text(offer['price']),
                              ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
