import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_icons.dart';
import 'package:untitled/utilities/app_images.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/base/components/network_svg_image%20.dart';
import 'package:untitled/views/screens/accounts/about_page.dart';
import 'package:untitled/views/screens/history/individual_histoy.dart';

import '../../base/widgets/app_custom_modal.dart';
import '../../base/widgets/order_card.dart';
import '../accounts/account_home.dart';
import '../accounts/account_profile.dart';
import '../accounts/account_settings.dart';
import '../auth/sign_in_page.dart';

class HistoryHomePage extends StatelessWidget {
  HistoryHomePage({super.key});

  // Example list of orders
  final List<Map<String, String>> orders = [
    {
      "imageUrl":
          "https://imgs.search.brave.com/zsMQceD5H5ajD95FdwVitlycR9K7rBjaxiMCS-EBA1A/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/bG9nby53aW5lL2Ev/bG9nby9BaXJ0ZWxf/VWdhbmRhL0FpcnRl/bF9VZ2FuZGEtTG9n/by53aW5lLnN2Zw",
      "serviceName": 'Airtel',
      "userName": 'Motin Mia',
      "plan": '50GB+600Mins',
      "phoneNumber": '+8801600000000',
      "price": '200',
      "duration": '20 Days',
    },
    {
      "imageUrl":
          "https://imgs.search.brave.com/zsMQceD5H5ajD95FdwVitlycR9K7rBjaxiMCS-EBA1A/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/bG9nby53aW5lL2Ev/bG9nby9BaXJ0ZWxf/VWdhbmRhL0FpcnRl/bF9VZ2FuZGEtTG9n/by53aW5lLnN2Zw",
      "serviceName": 'GrameenPhone',
      "userName": 'Rahim Uddin',
      "plan": '30GB+400Mins',
      "phoneNumber": '+8801700000000',
      "price": '150',
      "duration": '15 Days',
    },
    // Add more orders here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: <Widget>[
            InAppbar(),
            // ListView.builder to dynamically create OrderCard widgets
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (BuildContext context, int index) {
                  var order = orders[index]; // Get the order at index
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                    child: InkWell(
                      onTap: () {
                        Get.to(IndividualHistoryPage());
                      },
                      child: OrderCard(
                        showMenuIcon: true,
                        blueColor: true,
                        imageUrl: order["imageUrl"]!,
                        serviceName: order["serviceName"]!,
                        userName: order["userName"]!,
                        plan: order["plan"]!,
                        phoneNumber: order["phoneNumber"]!,
                        price: order["price"]!,
                        duration: order["duration"]!,
                      ),
                    ),
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
