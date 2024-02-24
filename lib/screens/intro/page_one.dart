import 'package:coinnext/core/app_colors.dart';
import 'package:coinnext/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.only(top: 250, left: 20, right: 20),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: 'Get free ',
              color: AppColors.black,
              size: 42,
            ),
            TextWidget(
              text: 'cryptocurrency ',
              color: AppColors.black,
              size: 42,
            ),
            TextWidget(
              text: 'for getting started',
              color: AppColors.black,
              size: 42,
            ),
            SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'Terms apply',
              color: AppColors.blue,
              size: 14,
            )
          ],
        ));
  }
}
