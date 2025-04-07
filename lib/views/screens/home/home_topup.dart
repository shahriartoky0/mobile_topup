import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_colors.dart';
import 'package:untitled/utilities/app_strings.dart';

import '../../base/components/slide_animation.dart';
import '../../base/widgets/order_card.dart';
import '../../base/widgets/order_total.dart';
import '../../base/widgets/schedule_topup.dart';

class HomeTopUp extends StatelessWidget {
  const HomeTopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    // Show the ScheduleTopUp dialog when navigating to the page
    Future.delayed(Duration.zero, () {
      _showScheduleTopUpDialog(context);
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Header with back button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    /// TODO : delete Logic
                  },
                ),
              ],
            ),
            // Scrollable content
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // OrderCard widget
                      OrderCard(
                        imageUrl:
                            "https://imgs.search.brave.com/zsMQceD5H5ajD95FdwVitlycR9K7rBjaxiMCS-EBA1A/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/bG9nby53aW5lL2Ev/bG9nby9BaXJ0ZWxf/VWdhbmRhL0FpcnRl/bF9VZ2FuZGEtTG9n/by53aW5lLnN2Zw",
                        serviceName: 'Airtel',
                        userName: 'Motin Mia',
                        plan: '50GB+600Mins',
                        phoneNumber: '+8801600000000',
                        price: '200',
                        duration: '20 Days',
                      ),
                      SizedBox(height: 24),
                      // ScheduleTopUp(),

                      // Add any more widgets if needed
                    ],
                  ),
                ),
              ),
            ),
            // OrderTotal always stays at the bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: OrderTotal(
                showButton: true,
                buttonText: 'Confirm',
                onPressed: () {
                  debugPrint('Confirm button pressed');
                },
                orderItems: <OrderItem>[
                  OrderItem(label: AppString.subTotal.tr, value: '9.52 USD'),
                  OrderItem(label: AppString.fee.tr, value: '1.00 USD'),
                  OrderItem(
                    label: AppString.promoCodeDiscount.tr,
                    value: '1.00 USD',
                    labelStyle: textTheme.headlineMedium!.copyWith(color: Colors.green),
                    valueStyle: textTheme.headlineMedium!.copyWith(color: Colors.green),
                  ),
                ],
                endingLabel: AppString.yourTotal.tr,
                endingValue: '9.52 USD',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show the ScheduleTopUp dialog when navigating to the page
  void _showScheduleTopUpDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the modal to be height-responsive
      backgroundColor: Colors.transparent, // Make the background transparent to match the dialog's look
      builder: (BuildContext context) {
        return SlideInAnimation(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: Get.back,
                      icon: const Icon(Icons.clear, color: Colors.red),
                    ),
                  ],
                ),
                const ScheduleTopUp(), // Dialog content
              ],
            ),
          ),
        );
      },
    );
  }
}
