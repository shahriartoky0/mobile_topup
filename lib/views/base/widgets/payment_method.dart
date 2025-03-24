import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/views/base/widgets/payment_option.dart';

import '../../../utilities/app_strings.dart';
import '../../screens/topup/topup_payment_details.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  bool isCardSelected = true;
  bool isApplePaySelected = false;
  int? selectedPaymentMethod = 0; // 0 for Card, 1 for Apple Pay

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppString.howWouldYouLikeToPay.tr,
          style: textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Column(
          children: <Widget>[
            PaymentOption(
              label: 'Card',
              icon: Icons.credit_card,
              selected: selectedPaymentMethod == 0,
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 0;
                });
              },
            ),

            const SizedBox(height: 8),
            PaymentOption(
              label: 'Apple Pay',
              icon: Icons.apple,
              selected: selectedPaymentMethod == 1,
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 1;
                });
              },
              isApplePay: true, // Additional information for Apple Pay
            ),
          ],
        ),
      ],
    );
  }
}
