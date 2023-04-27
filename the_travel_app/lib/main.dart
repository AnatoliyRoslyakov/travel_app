import 'package:flutter/material.dart';
import 'package:the_travel_app/pages/navpages/main_page.dart';

import 'pages/detail_page.dart';
import 'pages/welcom_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailPage(),
    );
  }
}
