import 'package:flutter/material.dart';
import 'package:the_travel_app/pages/navpages/bar_item_page.dart';
import 'package:the_travel_app/pages/home_page.dart';
import 'package:the_travel_app/pages/navpages/my_page.dart';
import 'package:the_travel_app/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(label: 'Главная', icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: 'Панель', icon: Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(label: 'Поиск', icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: 'Аккаунт', icon: Icon(Icons.person))
          ]),
    );
  }
}
