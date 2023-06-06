import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'abstract_routes_info.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  GoRouter router() {
    final AbstractRoutesInfo routesInfo = MobileRoutesInfo();
    return GoRouter(
        routes: routesInfo.routes,
        navigatorKey: rootNavigatorKey,
        initialLocation: routesInfo.initialRoute);
  }
}
