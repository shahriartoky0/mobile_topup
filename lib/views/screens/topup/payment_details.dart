import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/screens/mainbottom_nav.dart';
import '../../base/components/slide_animation.dart';
import '../../base/widgets/order_card.dart';
import '../../base/widgets/order_total.dart';
import '../../base/widgets/payment_method.dart';
import '../../base/widgets/promo_code.dart';
import '../../base/widgets/schedule_topup.dart';

class PaymentDetailsPage extends StatelessWidget {
  final bool fromSignIn;
  final bool fromLoginOTP;

  const PaymentDetailsPage({super.key, this.fromSignIn = false, this.fromLoginOTP = false});

  @override
  Widget build(BuildContext context) {
    final ScheduleTopUpController controller = Get.put(
      ScheduleTopUpController(),
    ); // Access the controller

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    if (fromSignIn) {
                      Get.offAll(const MainBottomNavScreen());
                      return;
                    }
                    if (fromLoginOTP) {
                      Get.offAll(const MainBottomNavScreen());
                      return;
                    }
                    Get.back();
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0 ,vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(AppString.yourOrder.tr),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
                  const PromoCode(),
                  const SizedBox(height: 16),
                  const PaymentMethod(),
                  const SizedBox(height: 16),
                  OrderTotal(
                    showButton: true,
                    buttonText: 'Confirm',
                    onPressed: () {
                      debugPrint('Confirm button pressed');
                      _showScheduleTopUpDialog(context);
                    },
                    orderItems: <OrderItem>[
                      OrderItem(label: AppString.subTotal.tr, value: '9.52 USD'),
                      OrderItem(label: AppString.fee.tr, value: '1.00 USD'),
                      OrderItem(
                        label: AppString.promoCodeDiscount.tr,
                        value: '1.00 USD',
                        labelStyle: Theme.of(
                          context,
                        ).textTheme.headlineMedium!.copyWith(color: Colors.green),
                        valueStyle: Theme.of(
                          context,
                        ).textTheme.headlineMedium!.copyWith(color: Colors.green),
                      ),
                    ],
                    endingLabel: AppString.yourTotal.tr,
                    endingValue: '9.52 USD',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show the ScheduleTopUp bottom modal sheet when navigating to the page
  void _showScheduleTopUpDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // Allows the modal to be height-responsive
      backgroundColor: Colors.transparent,
      // Make the background transparent to match the dialog's look
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
