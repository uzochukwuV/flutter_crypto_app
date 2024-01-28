import 'package:coinnext/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.red));
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
        return MaterialApp(
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          highContrastDarkTheme: ThemeData(brightness: Brightness.dark),
          color: Colors.white,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme:
                  Typography.englishLike2018.apply(fontSizeFactor: 1.sp)),
          debugShowCheckedModeBanner: false,
          home: const HomeState(),
        );
      },
    );
  }
}
