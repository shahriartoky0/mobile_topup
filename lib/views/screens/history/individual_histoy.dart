import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_strings.dart';
import '../../base/widgets/order_card.dart';
import '../../base/widgets/order_total.dart';
import '../../base/widgets/payment_method.dart';
import '../../base/widgets/promo_code.dart';
import '../../base/widgets/schedule_topup.dart';

class IndividualHistoryPage extends StatelessWidget {
  const IndividualHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Header with back button
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(AppString.yourOrder.tr),
                      const SizedBox(height: 20),
                      // OrderCard widget
                      const OrderCard(
                        imageUrl:
                        "https://imgs.search.brave.com/zsMQceD5H5ajD95FdwVitlycR9K7rBjaxiMCS-EBA1A/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/bG9nby53aW5lL2Ev/bG9nby9BaXJ0ZWxf/VWdhbmRhL0FpcnRl/bF9VZ2FuZGEtTG9n/by53aW5lLnN2Zw",
                        serviceName: 'Airtel',
                        userName: 'Motin Mia',
                        plan: '50GB+600Mins',
                        phoneNumber: '+8801600000000',
                        price: '200',
                        duration: '20 Days',
                      ),
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
}
