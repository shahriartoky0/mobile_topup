import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_icons.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/base/components/network_svg_image%20.dart';
import 'package:untitled/views/screens/market/gift_through_app.dart';
import 'package:untitled/views/screens/market/uc_package_page.dart';

import '../../../utilities/app_colors.dart';
import '../../base/widgets/image_carousel.dart';

class MarketDashboard extends StatelessWidget {
  const MarketDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 10),
                IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
              ],
            ),
            ImageCarousel(
              imgList: const <String>[
                'https://s3-alpha-sig.figma.com/img/e550/3f67/f647d4fe42ca59269a274bd259473d9f?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=AguxyL8Ko~6mEJgGrGPXJ~PJzF7gAIUf7xxMtwIqdF6GOvcZ~k3XjGT8ppK1OEmvET737PFRy4iFvaTOxIUGTHlXWX5zU-IE~dn7mwUTzIHDv5BiQzSnuIQSPynAWf~xhXGRNqRdu-FtBuijcigIYY3ysEWq2-Uw-dfce77AcbNwqe6qeUMKtR5EdfQ4MpgLFjsxU2JD2hWbSSWesOZTNxW2ioN2giFGY-kcT9aBmwmw9QvJWxO04Zsj32L7OqrjCyWdXvGaidAHqg1WwsK1AOkqlcDDBRTWKsdoFWLCrLNtZUqQxNqT8mUMbkkPmzeAPf8hjvYbum8BL5nhaj0sHw__',
                'https://s3-alpha-sig.figma.com/img/b650/8ed5/4f690e6db8a8bdaa481bb9405607ae04?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=J0On17Fjxv98LLrSCfG5Lc4ZjHUv4icqtfTy4hc5TnATDWcH6R7lFrOSd2qz5ivop~BB36JWIftcUumlirAF~SkImZT3BjKdsZeo0gzY2nc-lHUi1XCnO5ugbM0qp-r7jSuo-4E4u8EkjrVF4lJGDjEJBv3Q~HwNo-Iv9fDukSksFhAxjZPiaORhWTF~71gfd~2TBcBVmkTdP7Jr2-Ho5lSM6nrXsfIgsnZOoe0LqsbLz~I6t9waE3UfGulLSbkKmRMXd8ee4uPUYsXgjyr6Z2rv8CimyTKS~Yt1s6CR1gWXDevM2egE01S8Zuegte1DLJxHYcJbOupQh4cUJ-S-Gw__',
                'https://s3-alpha-sig.figma.com/img/e550/3f67/f647d4fe42ca59269a274bd259473d9f?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=AguxyL8Ko~6mEJgGrGPXJ~PJzF7gAIUf7xxMtwIqdF6GOvcZ~k3XjGT8ppK1OEmvET737PFRy4iFvaTOxIUGTHlXWX5zU-IE~dn7mwUTzIHDv5BiQzSnuIQSPynAWf~xhXGRNqRdu-FtBuijcigIYY3ysEWq2-Uw-dfce77AcbNwqe6qeUMKtR5EdfQ4MpgLFjsxU2JD2hWbSSWesOZTNxW2ioN2giFGY-kcT9aBmwmw9QvJWxO04Zsj32L7OqrjCyWdXvGaidAHqg1WwsK1AOkqlcDDBRTWKsdoFWLCrLNtZUqQxNqT8mUMbkkPmzeAPf8hjvYbum8BL5nhaj0sHw__',
                'https://s3-alpha-sig.figma.com/img/b650/8ed5/4f690e6db8a8bdaa481bb9405607ae04?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=J0On17Fjxv98LLrSCfG5Lc4ZjHUv4icqtfTy4hc5TnATDWcH6R7lFrOSd2qz5ivop~BB36JWIftcUumlirAF~SkImZT3BjKdsZeo0gzY2nc-lHUi1XCnO5ugbM0qp-r7jSuo-4E4u8EkjrVF4lJGDjEJBv3Q~HwNo-Iv9fDukSksFhAxjZPiaORhWTF~71gfd~2TBcBVmkTdP7Jr2-Ho5lSM6nrXsfIgsnZOoe0LqsbLz~I6t9waE3UfGulLSbkKmRMXd8ee4uPUYsXgjyr6Z2rv8CimyTKS~Yt1s6CR1gWXDevM2egE01S8Zuegte1DLJxHYcJbOupQh4cUJ-S-Gw__',
              ],
              height: 250.0,
              indicatorWidth: 20,
              indicatorHeight: 10,
              activeIndicatorColor: Colors.grey.shade300,
              inactiveIndicatorColor: Colors.cyan,
            ),
            const SizedBox(height: 16),
            giftContainer(
              context: context,
              imagePath: AppIcons.giftIcon,
              text: AppString.giftCard.tr,
              onPressed: () {
                Get.to(const GiftThroughApp());
              },
            ),
            const SizedBox(height: 8),
            giftContainer(
              context: context,
              imagePath: AppIcons.pubgIcon,
              text: "PUBG Mobile UC",
              onPressed: () {
                Get.to(const UCPackageSelection());
              },
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector giftContainer({
    required BuildContext context,
    required String imagePath,
    required String text,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),

        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
          child: Row(
            spacing: 20,
            children: <Widget>[
              const SizedBox(width: 1),
              AssetSvgImage(assetName: imagePath, width: 50, height: 50, color: AppColors.green),
              Text(text, style: textTheme(context).bodyMedium!.copyWith(color: AppColors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
