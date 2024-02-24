import 'package:coinnext/core/app_colors.dart';
import 'package:coinnext/screens/auth/sign_in.dart';
import 'package:coinnext/screens/portfolio/home.dart';
import 'package:coinnext/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSucess extends StatefulWidget {
  const LoginSucess({Key? key}) : super(key: key);

  @override
  _LoginSucessState createState() => _LoginSucessState();
}

class _LoginSucessState extends State<LoginSucess> {
  double wt = 1;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () => {setState(() => wt = 10)});
    return Scaffold(
        body: Container(
      width: Get.width,
      height: Get.height,
      child: Center(
        child: AnimatedScale(
          onEnd: () => {Get.to(() => Home())},
          duration: const Duration(seconds: 3),
          scale: wt,
          curve: Easing.standardAccelerate,
          child: ClipOval(
            child: Container(
              width: 100,
              height: 100,
              color: AppColors.white,
              child: Center(
                child: TextWidget(
                  text: 'Success',
                  color: AppColors.success,
                  size: 8,
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
