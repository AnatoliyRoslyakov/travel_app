import 'package:flutter/material.dart';

import '../../widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController =
        TabController(length: 3, vsync: this); // this -> context
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Меню
          Container(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                children: [
                  Icon(Icons.menu, size: 30, color: Colors.black54),
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5)),
                  ),
                ],
              )),
          const SizedBox(height: 40),
          // Путешествие
          Container(
            margin: EdgeInsets.only(left: 20),
            child: AppLargeText(
              text: 'Путешествие',
              color: Colors.black,
            ),
          ),
          // tabbar
          Container(
            child: TabBar(controller: _tabController, tabs: [
              Tab(
                text: 'Места',
              ),
              Tab(text: 'Вдохновение'),
              Tab(text: 'Эмоции'),
            ]),
          ),
          SizedBox(
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                  controller: _tabController,
                  children: [Text('Привет'), Text('Тут'), Text('Пока')]))
        ],
      ),
    );
  }
}
