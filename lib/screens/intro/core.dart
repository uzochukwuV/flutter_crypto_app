import 'package:coinnext/core/app_colors.dart';
import 'package:coinnext/core/page_names.dart';
import 'package:coinnext/screens/auth/sign_in.dart';
import 'package:coinnext/screens/intro/page_one.dart';
import 'package:coinnext/screens/intro/page_three.dart';
import 'package:coinnext/screens/intro/page_two.dart';
import 'package:coinnext/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroCore extends StatefulWidget {
  const IntroCore({Key? key}) : super(key: key);

  @override
  _IntroCoreState createState() => _IntroCoreState();
}

class _IntroCoreState extends State<IntroCore> {
  final controller = PageController(keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [PageOne(), PageTwo(), PageThree()],
          ),
          Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                onTap: () => Get.toNamed(PageNames.signIn),
                child: TextWidget(
                  text: 'Sign in',
                  size: 16,
                  color: AppColors.black,
                ),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: Get.height / 4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey3,
                          offset: Offset(2, 3),
                          blurRadius: 2,
                          spreadRadius: 1),
                      BoxShadow(
                          color: AppColors.grey3,
                          offset: Offset(2, 3),
                          blurRadius: 2,
                          spreadRadius: 1)
                    ],
                    border: Border.all(
                        color: AppColors.grey2,
                        width: 2,
                        style: BorderStyle.solid),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Center(
                    widthFactor: Get.width / 1.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        // dots
                        SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: WormEffect(
                              dotColor: AppColors.grey3,
                              radius: 8,
                              dotHeight: 8,
                              dotWidth: 8,
                              activeDotColor: AppColors.black),
                        ),
                        // Button
                        GestureDetector(
                          onTap: () => Get.to(() => SignIn()),
                          child: Container(
                            height: 60,
                            width: 300,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.black,
                            ),
                            child: Center(
                                child: TextWidget(
                              text: 'Enter',
                              color: AppColors.white,
                            )),
                          ),
                        ),

                        const Text(
                          'Browse Assets',
                          strutStyle: StrutStyle(fontSize: 18),
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              textBaseline: TextBaseline.ideographic,
                              height: 2,
                              leadingDistribution: TextLeadingDistribution.even,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationColor: Colors.black),
                        )
                      ],
                    )),
              ))
        ],
      ),
    );
  }
}
