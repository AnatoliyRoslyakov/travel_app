import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:the_travel_app/router/app_router.dart';

void main() {
  runApp(MyApp());
}

final GoRouter router = AppRouter().router();

class MyApp extends StatelessWidget {
  final GlobalKey _appKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: _appKey,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
