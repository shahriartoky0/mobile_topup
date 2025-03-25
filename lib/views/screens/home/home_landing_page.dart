import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/utilities/app_theme.dart';
import 'package:untitled/views/base/components/cached_image.dart';
import 'package:untitled/views/screens/accounts/account_home.dart';

import '../../../utilities/app_colors.dart';

class HomeLandingPage extends StatelessWidget {
  const HomeLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InAppbar(),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(12),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          child: CachedImage(
                            imageUrl:
                                "https://imgs.search.brave.com/gqC0TFGd8Ea56ikbuQFo4DrptdJwsp33BOHENy1wtFM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/d29ybGRwcmVzc3Bo/b3RvLm9yZy9nZXRt/ZWRpYS81NGZhZDZi/OC05ODQ3LTQ1MzYt/OGMyOS04NTViODM5/YmU2ZDUvRXhoaWJp/dGlvbjIwMjRfQW1z/dGVyZGFtX0ROS19j/LU5hdGhhbGllLUhh/Z2Vuc3RlaW4uanBn/P21heHNpZGVzaXpl/PTkwMCZyZXNpemVt/b2RlPWZvcmNl",
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 50,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Top Up your frien Any time from any where",
                              style: textTheme(
                                context,
                              ).headlineMedium!.copyWith(color: AppColors.white),
                            ),
                            SizedBox(height: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                              ),
                              onPressed: () {
                                // if (_formKey.currentState!.validate()) {}
                              },

                              child: Text(
                                AppString.topUp.tr,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// ========================== the top Up starts here =================== >
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  // Default button text is 'Confirm'
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    AppString.recentTopUp,
                    style: textTheme(context).labelMedium!.copyWith(fontSize: 14),
                  ),
                ),ElevatedButton(
                  onPressed: () {},
                  // Default button text is 'Confirm'
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    AppString.scheduleTopUp,
                    style: textTheme(context).labelMedium!.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
