import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_strings.dart';
import '../../base/widgets/order_card.dart';
import '../../base/widgets/order_total.dart';
import '../../base/widgets/payment_method.dart';
import '../../base/widgets/promo_code.dart';
import '../../base/widgets/schedule_topup.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // bottomNavigationBar: OrderTotal(showButton: true, buttonText: AppString.confirm.tr, onPressed: () {}),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 10),
                IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(AppString.yourOrder),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  const PromoCode(),
                  const SizedBox(height: 20),
                  const PaymentMethod(),
                  const SizedBox(height: 20),
                  const ScheduleTopUp(),
                  const SizedBox(height: 20),
                  OrderTotal(
                    showButton: true,
                    buttonText: 'Confirm',
                    onPressed: () {
                      debugPrint('Confirm button pressed');
                    },
                    orderItems: <OrderItem>[
                      OrderItem(label: AppString.subTotal, value: '9.52 USD'),
                      OrderItem(label: AppString.fee, value: '1.00 USD'),
                      OrderItem(
                        label: AppString.promoCodeDiscount,
                        value: '1.00 USD',
                        labelStyle: textTheme.headlineMedium!.copyWith(color: Colors.green),
                        valueStyle: textTheme.headlineMedium!.copyWith(color: Colors.green),
                      ),
                    ],
                    endingLabel: AppString.yourTotal,
                    endingValue: '9.52 USD',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
