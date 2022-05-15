import 'package:flutter/material.dart';
import 'package:travelapptest/pages/navepages/bar_item_page.dart';
import 'package:travelapptest/pages/navepages/home_page.dart';
import 'package:travelapptest/pages/navepages/my_page.dart';
import 'package:travelapptest/pages/navepages/search_page.dart';

// ignore: camel_case_types
class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  State<main_page> createState() => _main_pageState();
}

// ignore: camel_case_types
class _main_pageState extends State<main_page> {
  List pages = [
    const Homepage(),
    const baritempage(),
    const searchpage(),
    const mypage(),
  ];
  int currentstate = 0;
  void onTap(int index) {
    setState(() {
      currentstate = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentstate],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.white,
          currentIndex: currentstate,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(0.3),
          elevation: 0,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.apps), label: 'home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_sharp), label: 'bar chart'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'search'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'person'),
          ]),
    );
  }
}
