import 'package:coinnext/src/pages/first_page.dart';
import 'package:coinnext/src/pages/second_page.dart';
import 'package:flutter/material.dart';

class HomeState extends StatelessWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 20,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.house)),
            BottomNavigationBarItem(
                label: 'PortFolio', icon: Icon(Icons.analytics)),
            BottomNavigationBarItem(label: 'User', icon: Icon(Icons.person))
          ]),
    );
  }
}
