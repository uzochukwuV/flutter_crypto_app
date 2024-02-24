import 'package:coinnext/core/app_colors.dart';
import 'package:coinnext/screens/auth/sign_in.dart';
import 'package:coinnext/widgets/input.dart';
import 'package:coinnext/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'Register an account',
          color: AppColors.black,
          size: 26,
        ),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
          top: true,
          child: Container(
            width: Get.width,
            height: Get.height,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        InputWidget(
                            inputText: 'Username', inputHelpText: 'Username'),
                        InputWidget(
                            inputText: 'Email', inputHelpText: 'E-mail'),
                        InputWidget(
                            inputText: 'Password', inputHelpText: 'Password'),
                        InputWidget(
                            inputText: 'Confirm Password',
                            inputHelpText: 'Re-type Password'),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: Get.width,
                        child: TextWidget(
                          text: 'Forget Password',
                          color: AppColors.black,
                          size: 12,
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: Get.width,
                      height: 80,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              primary: AppColors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              elevation: 5),
                          child: TextWidget(
                              text: 'Submit', color: AppColors.white)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.grey2,
                                        width: 2,
                                        style: BorderStyle.solid))),
                          ),
                        ),
                        TextWidget(
                          text: 'Already have an account ?',
                          color: AppColors.grey1,
                          size: 16,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.grey2,
                                        width: 2,
                                        style: BorderStyle.solid))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () => Get.to(() => const SignIn()),
                        child: TextWidget(
                          text: 'Sign In',
                          color: AppColors.black,
                        ),
                      ),
                    )
                  ]),
            ),
          )),
    );
  }
}
