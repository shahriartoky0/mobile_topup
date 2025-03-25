import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_images.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/base/components/cached_image.dart';

import '../../../utilities/app_colors.dart';
import 'gift_offer.dart';

class GiftThroughApp extends StatelessWidget {
  const GiftThroughApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the list
    final List<Map<String, String>> giftItems = <Map<String, String>>[
      <String, String>{
        'imageUrl':
            "https://imgs.search.brave.com/IeGNAkPaIzrwGZR3AEl7NkR0WRCueFdkj0HaodM4cUg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy82/LzYwL1NreXBlX2xv/Z29fKDIwMTklRTIl/ODAlOTNwcmVzZW50/KS5zdmc",
        'title': "Gifts",
        'subtitle': "Help them stay in touch with viber calling credit",
      },
      // Add more items as needed
      <String, String>{
        'imageUrl':
            "https://imgs.search.brave.com/JwpIa28H4JmOm3p7RqVhLrmJenKy96tfI4mHrkS8ybU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y25ldC5jb20vYS9p/bWcvcmVzaXplLzFh/MmFlZmQ0NWYzYzA2/YTdmN2FmNWUxOWVi/ZDAyNDEyYzdiZGVl/ODcvaHViLzIwMTYv/MDYvMjEvNjBmYmEz/NTktZTVlMy00NTlk/LWJlMjEtZjdmZDU0/NDI4NTFlL3ZpYmVy/LWlvcy5wbmc_YXV0/bz13ZWJwJndpZHRo/PTc2OA",
        // Add your image URL here
        'title': "Voucher",
        'subtitle': "Send vouchers for special occasions",
      },
      <String, String>{
        'imageUrl':
            "https://imgs.search.brave.com/JwpIa28H4JmOm3p7RqVhLrmJenKy96tfI4mHrkS8ybU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y25ldC5jb20vYS9p/bWcvcmVzaXplLzFh/MmFlZmQ0NWYzYzA2/YTdmN2FmNWUxOWVi/ZDAyNDEyYzdiZGVl/ODcvaHViLzIwMTYv/MDYvMjEvNjBmYmEz/NTktZTVlMy00NTlk/LWJlMjEtZjdmZDU0/NDI4NTFlL3ZpYmVy/LWlvcy5wbmc_YXV0/bz13ZWJwJndpZHRo/PTc2OA",
        // Add your image URL here
        'title': "Voucher",
        'subtitle': "Send vouchers for special occasions",
      },
      <String, String>{
        'imageUrl':
            "https://imgs.search.brave.com/JwpIa28H4JmOm3p7RqVhLrmJenKy96tfI4mHrkS8ybU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y25ldC5jb20vYS9p/bWcvcmVzaXplLzFh/MmFlZmQ0NWYzYzA2/YTdmN2FmNWUxOWVi/ZDAyNDEyYzdiZGVl/ODcvaHViLzIwMTYv/MDYvMjEvNjBmYmEz/NTktZTVlMy00NTlk/LWJlMjEtZjdmZDU0/NDI4NTFlL3ZpYmVy/LWlvcy5wbmc_YXV0/bz13ZWJwJndpZHRo/PTc2OA",
        // Add your image URL here
        'title': "Voucher",
        'subtitle': "Send vouchers for special occasions",
      },
      <String, String>{
        'imageUrl':
            "https://imgs.search.brave.com/JwpIa28H4JmOm3p7RqVhLrmJenKy96tfI4mHrkS8ybU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y25ldC5jb20vYS9p/bWcvcmVzaXplLzFh/MmFlZmQ0NWYzYzA2/YTdmN2FmNWUxOWVi/ZDAyNDEyYzdiZGVl/ODcvaHViLzIwMTYv/MDYvMjEvNjBmYmEz/NTktZTVlMy00NTlk/LWJlMjEtZjdmZDU0/NDI4NTFlL3ZpYmVy/LWlvcy5wbmc_YXV0/bz13ZWJwJndpZHRo/PTc2OA",
        // Add your image URL here
        'title': "Voucher",
        'subtitle': "Send vouchers for special occasions",
      },
      <String, String>{
        'imageUrl':
            "https://imgs.search.brave.com/JwpIa28H4JmOm3p7RqVhLrmJenKy96tfI4mHrkS8ybU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y25ldC5jb20vYS9p/bWcvcmVzaXplLzFh/MmFlZmQ0NWYzYzA2/YTdmN2FmNWUxOWVi/ZDAyNDEyYzdiZGVl/ODcvaHViLzIwMTYv/MDYvMjEvNjBmYmEz/NTktZTVlMy00NTlk/LWJlMjEtZjdmZDU0/NDI4NTFlL3ZpYmVy/LWlvcy5wbmc_YXV0/bz13ZWJwJndpZHRo/PTc2OA",
        // Add your image URL here
        'title': "Voucher",
        'subtitle': "Send vouchers for special occasions",
      },
      <String, String>{
        'imageUrl':
            "https://imgs.search.brave.com/JwpIa28H4JmOm3p7RqVhLrmJenKy96tfI4mHrkS8ybU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y25ldC5jb20vYS9p/bWcvcmVzaXplLzFh/MmFlZmQ0NWYzYzA2/YTdmN2FmNWUxOWVi/ZDAyNDEyYzdiZGVl/ODcvaHViLzIwMTYv/MDYvMjEvNjBmYmEz/NTktZTVlMy00NTlk/LWJlMjEtZjdmZDU0/NDI4NTFlL3ZpYmVy/LWlvcy5wbmc_YXV0/bz13ZWJwJndpZHRo/PTc2OA",
        // Add your image URL here
        'title': "Voucher",
        'subtitle': "Send vouchers for special occasions",
      },
      <String, String>{
        'imageUrl':
            "https://imgs.search.brave.com/JwpIa28H4JmOm3p7RqVhLrmJenKy96tfI4mHrkS8ybU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y25ldC5jb20vYS9p/bWcvcmVzaXplLzFh/MmFlZmQ0NWYzYzA2/YTdmN2FmNWUxOWVi/ZDAyNDEyYzdiZGVl/ODcvaHViLzIwMTYv/MDYvMjEvNjBmYmEz/NTktZTVlMy00NTlk/LWJlMjEtZjdmZDU0/NDI4NTFlL3ZpYmVy/LWlvcy5wbmc_YXV0/bz13ZWJwJndpZHRo/PTc2OA",
        // Add your image URL here
        'title': "Voucher",
        'subtitle': "Send vouchers for special occasions",
      },
      <String, String>{
        'imageUrl':
            "https://imgs.search.brave.com/JwpIa28H4JmOm3p7RqVhLrmJenKy96tfI4mHrkS8ybU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y25ldC5jb20vYS9p/bWcvcmVzaXplLzFh/MmFlZmQ0NWYzYzA2/YTdmN2FmNWUxOWVi/ZDAyNDEyYzdiZGVl/ODcvaHViLzIwMTYv/MDYvMjEvNjBmYmEz/NTktZTVlMy00NTlk/LWJlMjEtZjdmZDU0/NDI4NTFlL3ZpYmVy/LWlvcy5wbmc_YXV0/bz13ZWJwJndpZHRo/PTc2OA",
        // Add your image URL here
        'title': "Voucher",
        'subtitle': "Send vouchers for special occasions",
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: <Widget>[
                  const Text(AppString.gift),
                  const SizedBox(width: 5),
                  Image.asset(AppImages.flagDemo),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                AppString.choicesFromTopStores,
                style: textTheme(context).displayMedium!.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 24),

              /// =================================Gift Container ==========================>
              Expanded(
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: giftItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Map<String, String> giftItem = giftItems[index];
                    return InkWell(
                      onTap: () {
                        Get.to(GiftOffer());
                      },
                      child: GiftListTile(
                        imageUrl: giftItem["imageUrl"] ?? '',
                        title: giftItem["title"] ?? '',
                        subtitle: giftItem["subtitle"] ?? '',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GiftListTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const GiftListTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[CachedImage(imageUrl: imageUrl)],
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(subtitle, style: textTheme.displayMedium),
          Divider(color: AppColors.primaryColor.withValues(alpha: 0.2)),
        ],
      ),
    );
  }
}
