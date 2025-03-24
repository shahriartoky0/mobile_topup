import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_images.dart';
import 'package:untitled/utilities/app_strings.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_theme.dart';
import '../../base/widgets/order_card.dart';
import '../../base/widgets/order_total.dart';
import '../../base/widgets/payment_method.dart';
import '../../base/widgets/promo_code.dart';
import '../../base/widgets/schedule_topup.dart';

class UcPaymentDetails extends StatelessWidget {
  const UcPaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _promoCodeController = TextEditingController();
    final TextEditingController _playerIdCodeController = TextEditingController();

    return Scaffold(
      // bottomNavigationBar: OrderTotal(showButton: true, buttonText: AppString.confirm.tr, onPressed: () {}),
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Your Order"),
                  const SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.yellow),
                      color: AppColors.yellowish.withValues(alpha: 0.5),
                    ),
                    child: Row(
                      children: [
                        Image.asset(AppImages.ucCashImage, scale: 3),
                        SizedBox(width: 5),
                        Text(
                          "400 UC",
                          style: textTheme(context).bodyMedium!.copyWith(fontSize: 24),
                        ),
                        Spacer(),
                        Text("8 USD"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  ///  ================================= Promo code ========================>
                  PromoCodeInput(
                    labelText: AppString.promoCode,
                    // The label for the input field
                    hintText: AppString.promoCode,
                    // The hint inside the TextFormField
                    controller: _promoCodeController, // Controller to manage the input text
                  ),
                  const SizedBox(height: 8),
                  PromoCodeInput(
                    labelText: AppString.playerID,
                    // The label for the input field
                    hintText: AppString.enterTheId,
                    // The hint inside the TextFormField
                    controller: _playerIdCodeController,
                    isPlayerId: true,
                  ),

                  const SizedBox(height: 20),
                  const PaymentMethod(),
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
                        labelStyle: textTheme(
                          context,
                        ).headlineMedium!.copyWith(color: Colors.green),
                        valueStyle: textTheme(
                          context,
                        ).headlineMedium!.copyWith(color: Colors.green),
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

class PromoCodeInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool isPlayerId;

  const PromoCodeInput({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.isPlayerId = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.yellow),
        color: AppColors.yellowish.withValues(
          alpha: 0.3,
        ), // Use a predefined color or replace with AppColors.yellowish
      ),
      child: Row(
        children: [
          Text(
            labelText,
            style: textTheme.bodyMedium!.copyWith(color: Colors.black.withValues(alpha: 0.6)),
          ),
          isPlayerId ? SizedBox(width: 90) : SizedBox(width: 55),
          // Add some space between the text and input field
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: hintText,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
