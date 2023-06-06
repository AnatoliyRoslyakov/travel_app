import 'package:go_router/go_router.dart';
import 'package:the_travel_app/router/routes.dart';

import '../pages/detail_page.dart';
import '../pages/navpages/main_page.dart';
import '../pages/welcom_page.dart';

abstract class AbstractRoutesInfo {
  String get initialRoute;

  List<RouteBase> get routes;
}

class MobileRoutesInfo implements AbstractRoutesInfo {
  @override
  String get initialRoute => Routes.welcom.path;

  @override
  List<RouteBase> get routes => <RouteBase>[
        GoRoute(
          path: Routes.welcom.path,
          name: Routes.welcom.name,
          builder: (context, state) => const WelcomPage(),
        ),
        GoRoute(
          path: Routes.home.path,
          name: Routes.home.name,
          builder: (context, state) => const MainPage(),
        ),
        GoRoute(
          path: Routes.detail.path,
          name: Routes.detail.name,
          builder: (context, state) => const DetailPage(),
        ),
      ];
}
