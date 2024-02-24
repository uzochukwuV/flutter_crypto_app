import 'package:coinnext/core/app_colors.dart';
import 'package:coinnext/screens/portfolio/dashboard/screen.dart';
import 'package:coinnext/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import './market/screen.dart' as Market;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentState = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      DashboardScreen(),
      const Market.Screen(),
      Center(
        child: TextWidget(text: 'Hello Trade', color: AppColors.black),
      ),
      Center(
        child: TextWidget(text: 'Hello Account', color: AppColors.black),
      ),
      Center(
        child: TextWidget(text: 'Hello Account', color: AppColors.black),
      )
    ];
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Container(
        color: AppColors.white,
        height: Get.height,
        width: Get.width,
        child: screens[currentState],
      )),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => setState(() => currentState = value),
          currentIndex: currentState,
          selectedFontSize: 14.0,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 14.0,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.grey1,
          enableFeedback: false,
          showSelectedLabels: false,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black87,
                ),
                activeIcon: Icon(
                  Icons.home_filled,
                  color: Colors.black87,
                ),
                label: 'Dashboard'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.trending_down_outlined,
                  color: Colors.black87,
                ),
                activeIcon: Icon(
                  Icons.trending_down_rounded,
                  color: Colors.black,
                ),
                label: 'Market'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.stacked_bar_chart_rounded,
                  color: Colors.black87,
                ),
                activeIcon: Icon(
                  Icons.stacked_bar_chart_rounded,
                  color: Colors.black,
                ),
                label: 'Spot'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.insert_chart,
                  color: Colors.black87,
                ),
                activeIcon: Icon(
                  Icons.money_sharp,
                  color: Colors.black87,
                ),
                label: 'Trade'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.black87,
                ),
                label: 'Account')
          ]),
    );
  }
}
