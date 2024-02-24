import 'package:coinnext/core/app_colors.dart';
import 'package:coinnext/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.only(top: 250, left: 20, right: 20),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextWidget(
                text: 'Track prices on all cryptocurrencies',
                color: AppColors.black,
                size: 36,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: TextWidget(
                text:
                    'Set up automatic price alerts to let you know about price movemnets for a specific cryptocurrency',
                color: AppColors.grey1,
                size: 18,
              ),
            )
          ],
        ));
  }
}
