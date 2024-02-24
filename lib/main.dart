import 'package:coinnext/core/page_names.dart';
import 'package:coinnext/screens/auth/sign_in.dart';
import 'package:coinnext/screens/intro/core.dart';
import 'package:coinnext/screens/portfolio/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/app_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
          highContrastDarkTheme: ThemeData(brightness: Brightness.dark),
          color: Colors.white,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme:
                  Typography.englishLike2018.apply(fontSizeFactor: 1.sp)),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          getPages: [
            GetPage(name: PageNames.home, page: () => const IntroCore()),
            GetPage(name: PageNames.signIn, page: () => const SignIn()),
            GetPage(name: PageNames.mainHome, page: () => const Home()),
          ],
        );
      },
    );
  }
}
