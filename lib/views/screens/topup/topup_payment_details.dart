import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_images.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/base/components/cached_image.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        title: Text('Your Order', style: textTheme.displayMedium),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              OrderCard(
                serviceName: 'Airtel',
                userName: 'Motin Mia',
                plan: '50GB+600Mins',
                phoneNumber: '+8801600000000',
                price: '200',
                duration: '20 Days',
              ),
              SizedBox(height: 20),
              PaymentMethod(),
              SizedBox(height: 20),
              ScheduleTopUp(),
              SizedBox(height: 20),
              PromoCode(),
              Spacer(),
              OrderTotal(),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String serviceName;
  final String userName;
  final String plan;
  final String phoneNumber;
  final String price;
  final String duration;

  const OrderCard({
    Key? key,
    required this.serviceName,
    required this.userName,
    required this.plan,
    required this.phoneNumber,
    required this.price,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppImages.airtelLogo,scale: 1.5,),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(userName),
              Text(plan, style: textTheme(context).displayMedium),
            ],
          ),

          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(phoneNumber, style: textTheme(context).displayMedium),
              Row(
                children: [
                  Text('\$ $price', style: textTheme(context).displayMedium),
                  SizedBox(width: 8),
                  Icon(
                    Icons.access_time_outlined,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                  SizedBox(width: 2),
                  Text(duration, style: textTheme(context).displayMedium),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  bool isCardSelected = true;
  bool isApplePaySelected = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('How Would You Like To Pay', style: textTheme.displayMedium),
        SizedBox(height: 10),
        Row(
          children: [
            PaymentOption(
              label: 'Card',
              isSelected: isCardSelected,
              onTap: () {
                setState(() {
                  isCardSelected = true;
                  isApplePaySelected = false;
                });
              },
              icon: Icons.credit_card,
            ),
            PaymentOption(
              label: 'Apple Pay',
              isSelected: isApplePaySelected,
              onTap: () {
                setState(() {
                  isApplePaySelected = true;
                  isCardSelected = false;
                });
              },
              icon: Icons.apple,
            ),
          ],
        ),
      ],
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;

  const PaymentOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : Colors.transparent,
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blueAccent),
            SizedBox(width: 8),
            Text(label, style: textTheme.displayMedium),
          ],
        ),
      ),
    );
  }
}

class ScheduleTopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Schedule Top-Up', style: textTheme.displayMedium),
        SizedBox(height: 10),
        Text(
          'This Package Will Be Auto Top-Up After Your Selected Time.',
          style: textTheme.displayMedium,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TopUpOption(label: '7 Day'),
            TopUpOption(label: '14 Day'),
            TopUpOption(label: '30 Day'),
          ],
        ),
      ],
    );
  }
}

class TopUpOption extends StatelessWidget {
  final String label;

  const TopUpOption({required this.label});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(label, style: textTheme.displayMedium),
      ),
    );
  }
}

class PromoCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter The Promo Code',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter Promo Code',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.check_circle),
            ),
          ),
        ),
      ],
    );
  }
}

class OrderTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sub Total: 9.52 USD', style: textTheme.displayMedium),
        SizedBox(height: 10),
        Text('Fee: 1.00 USD', style: textTheme.displayMedium),
        SizedBox(height: 10),
        Text('Promo Code Discount: -1.00 USD', style: textTheme.displayMedium),
        SizedBox(height: 10),
        Divider(),
        Text('Total: 9.52 USD', style: textTheme.displayMedium),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text('Confirm'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(GetMaterialApp(home: OrderPage()));
}
